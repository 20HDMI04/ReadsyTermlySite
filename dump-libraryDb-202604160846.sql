--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2026-04-16 08:46:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "libraryDb";
--
-- TOC entry 3504 (class 1262 OID 16384)
-- Name: libraryDb; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE "libraryDb" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "libraryDb" OWNER TO admin;

\connect "libraryDb"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 17179)
-- Name: public; Type: SCHEMA; Schema: -; Owner: admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO admin;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 17196)
-- Name: Author; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Author" (
    id text NOT NULL,
    bio text,
    "birthDate" timestamp(3) without time zone,
    nationality text,
    "biggerProfilePic" text,
    "smallerProfilePic" text,
    "biggerProfilePicKey" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    name text NOT NULL,
    "smallerProfilePicKey" text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "approveStatus" boolean DEFAULT false NOT NULL,
    "openLibraryId" text,
    subjects text,
    "topWorks" text
);


ALTER TABLE public."Author" OWNER TO admin;

--
-- TOC entry 220 (class 1259 OID 17203)
-- Name: Book; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Book" (
    id text NOT NULL,
    title text NOT NULL,
    "authorId" text,
    "originalPublicationYear" integer,
    "pageNumber" integer,
    description text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "biggerCoverPic" text NOT NULL,
    "smallerCoverPic" text NOT NULL,
    "approveStatus" boolean DEFAULT false NOT NULL,
    "biggerCoverPicKey" text,
    "latestPublicationYear" integer,
    "originalPublisher" text,
    "smallerCoverPicKey" text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "googleBookId" text,
    "openLibraryId" text
);


ALTER TABLE public."Book" OWNER TO admin;

--
-- TOC entry 222 (class 1259 OID 17218)
-- Name: BookGenres; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."BookGenres" (
    "bookId" text NOT NULL,
    "genreId" text NOT NULL
);


ALTER TABLE public."BookGenres" OWNER TO admin;

--
-- TOC entry 231 (class 1259 OID 17433)
-- Name: BookIsbn; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."BookIsbn" (
    id text NOT NULL,
    "isbnNumber" text NOT NULL,
    "bookId" text NOT NULL
);


ALTER TABLE public."BookIsbn" OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 17235)
-- Name: BookStatistics; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."BookStatistics" (
    id text NOT NULL,
    "bookId" text NOT NULL,
    "averageRating" double precision DEFAULT 0.0 NOT NULL,
    "ratingCount" integer DEFAULT 0 NOT NULL,
    "readersCount" integer DEFAULT 0 NOT NULL,
    "wantToReadCount" integer DEFAULT 0 NOT NULL,
    "reviewCount" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."BookStatistics" OWNER TO admin;

--
-- TOC entry 229 (class 1259 OID 17330)
-- Name: Comment; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Comment" (
    id text NOT NULL,
    text text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "userId" text NOT NULL,
    "bookId" text NOT NULL
);


ALTER TABLE public."Comment" OWNER TO admin;

--
-- TOC entry 230 (class 1259 OID 17338)
-- Name: CommentLike; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."CommentLike" (
    "userId" text NOT NULL,
    "commentId" text NOT NULL
);


ALTER TABLE public."CommentLike" OWNER TO admin;

--
-- TOC entry 227 (class 1259 OID 17315)
-- Name: FavoriteAuthor; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."FavoriteAuthor" (
    "userId" text NOT NULL,
    "authorId" text NOT NULL
);


ALTER TABLE public."FavoriteAuthor" OWNER TO admin;

--
-- TOC entry 226 (class 1259 OID 17308)
-- Name: FavoriteBook; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."FavoriteBook" (
    "userId" text NOT NULL,
    "bookId" text NOT NULL
);


ALTER TABLE public."FavoriteBook" OWNER TO admin;

--
-- TOC entry 225 (class 1259 OID 17301)
-- Name: FavoriteGenre; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."FavoriteGenre" (
    "userId" text NOT NULL,
    "genreId" text NOT NULL
);


ALTER TABLE public."FavoriteGenre" OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 17211)
-- Name: Genres; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Genres" (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Genres" OWNER TO admin;

--
-- TOC entry 224 (class 1259 OID 17247)
-- Name: HaveReadIt; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."HaveReadIt" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "bookId" text NOT NULL,
    "addedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."HaveReadIt" OWNER TO admin;

--
-- TOC entry 228 (class 1259 OID 17322)
-- Name: Rating; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Rating" (
    "userId" text NOT NULL,
    "bookId" text NOT NULL,
    score integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Rating" OWNER TO admin;

--
-- TOC entry 218 (class 1259 OID 17189)
-- Name: User; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "biggerProfilePic" text,
    "smallerProfilePic" text,
    "biggerProfilePicKey" text,
    nickname text,
    "smallerProfilePicKey" text,
    "updatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."User" OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 17180)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO admin;

--
-- TOC entry 3486 (class 0 OID 17196)
-- Dependencies: 219
-- Data for Name: Author; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Author" VALUES ('8ccc1848-b5f3-40bd-b538-af841fe39a01', 'Colleen Hoover is the #1 New York Times and International bestselling author of multiple novels and novellas. She lives in Texas with her husband and their three boys. She is the founder of The Bookworm Box, a non-profit book subscription service and bookstore in Sulphur Springs, Texas. 

For more information and for a schedule of events, please visit colleenhoover.com. 

To contact Colleen and her team (Her team''s name is Stephanie), please email hooverink@outlook.com', '1979-12-10 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/14323006-L.jpg', 'https://covers.openlibrary.org/b/id/14323006-M.jpg', NULL, '2026-03-07 11:10:39.447', 'Colleen Hoover', NULL, '2026-03-07 11:10:39.447', true, 'OL7315784A', NULL, NULL);
INSERT INTO public."Author" VALUES ('39a4afc7-f7a6-4d14-900f-b777748b6e88', 'Joanne "Jo" Murray, OBE (née Rowling), better known under the pen name J. K. Rowling, is a British author best known as the creator of the Harry Potter fantasy series, the idea for which was conceived whilst on a train trip from Manchester to London in 1990. The Potter books have gained worldwide attention, won multiple awards, sold more than 400 million copies, and been the basis for a popular series of films.', '1965-07-30 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/5543033-L.jpg', 'https://covers.openlibrary.org/b/id/5543033-M.jpg', NULL, '2026-03-07 11:10:42.333', 'J. K. Rowling', NULL, '2026-03-07 11:10:42.333', true, 'OL23919A', NULL, NULL);
INSERT INTO public."Author" VALUES ('aa73ae39-9cd7-44df-b9fe-1e8d533310f7', 'Ana Huang is a #1 New York Times, #1 USA Today, #1 Sunday Times, and #1 Amazon bestselling author. Best known for her Twisted series, she writes New Adult and contemporary romance with deliciously alpha heroes, strong heroines, and plenty of steam, angst, and swoon.

Her books have been translated in thirty languages and featured in outlets such as Good Morning America, The Today Show, NPR, Cosmopolitan, and PEOPLE magazine.

A self-professed travel enthusiast, she loves incorporating beautiful destinations into her stories and will never say no to a good chai latte.', '1991-03-06 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/15088765-L.jpg', 'https://covers.openlibrary.org/b/id/15088765-M.jpg', NULL, '2026-03-07 11:10:47.753', 'Ana Huang', NULL, '2026-03-07 11:10:47.753', true, 'OL9180803A', NULL, NULL);
INSERT INTO public."Author" VALUES ('17393407-c644-42b0-a076-b9e91ec49958', 'George Raymond Richard Martin (born September 20, 1948), sometimes referred to as GRRM, is an American author and screenwriter of fantasy, horror, and science fiction. He is best known for his ongoing *A Song of Ice and Fire* series of epic fantasy novels.

Critics have described Martin''s work as dark and cynical. His first novel, Dying of the Light, set the tone for most of his future work; it is set on a mostly abandoned planet that is slowly becoming uninhabitable as it moves away from its sun. This story, and many of Martin''s others, have a strong sense of melancholy. His characters are often unhappy, or at least unsatisfied - trying to stay idealistic in a ruthless world. Many have elements of tragic heroes in them. Reviewer T. M. Wagner writes, "Let it never be said Martin doesn''t share Shakespeare''s fondness for the senselessly tragic." This gloominess can be an obstacle for some readers. The Inchoatus Group writes, "If this absence of joy is going to trouble you, or you’re looking for something more affirming, then you should probably seek elsewhere."

([Source][1])


  [1]: http://en.wikipedia.org/wiki/George_R._R._Martin', '1948-09-19 22:00:00', NULL, 'https://covers.openlibrary.org/b/id/6387401-L.jpg', 'https://covers.openlibrary.org/b/id/6387401-M.jpg', NULL, '2026-03-07 11:10:50.506', 'George R. R. Martin', NULL, '2026-03-07 11:10:50.506', true, 'OL234664A', NULL, NULL);
INSERT INTO public."Author" VALUES ('74e90205-df10-4206-a8f8-e90838ef8f90', 'Stephen Edwin King (born September 21, 1947) is an American author of horror, supernatural fiction, suspense, crime, science-fiction, and fantasy novels. His books have sold more than 350 million copies, and many have been adapted into films, television series, miniseries, and comic books. King has published 63 novels, including seven under the pen name Richard Bachman, and five non-fiction books. He has also written approximately 200 short stories, most of which have been published in book collections.

King has received Bram Stoker Awards, World Fantasy Awards, and British Fantasy Society Awards. In 2003, the National Book Foundation awarded him the Medal for Distinguished Contribution to American Letters. He has also received awards for his contribution to literature for his entire bibliography, such as the 2004 World Fantasy Award for Life Achievement and the 2007 Grand Master Award from the Mystery Writers of America. In 2015, he was awarded with a National Medal of Arts from the U.S. National Endowment for the Arts for his contributions to literature. He has been described as the "King of Horror", a play on his surname and a reference to his high standing in pop culture.', '1947-09-20 22:00:00', NULL, 'https://covers.openlibrary.org/b/id/14853840-L.jpg', 'https://covers.openlibrary.org/b/id/14853840-M.jpg', NULL, '2026-03-07 11:10:53.703', 'Stephen King', NULL, '2026-03-07 11:10:53.703', true, 'OL19981A', NULL, NULL);
INSERT INTO public."Author" VALUES ('8af4ae5f-2ea3-4ddf-84c7-74d0aef21e27', 'H. D. Carlton is an International and USA Today Bestselling author. She lives in Oregon with her husband, Bigfoot, two dogs, and cat. When she’s not bathing in the tears of her readers, she’s watching paranormal shows and wishing she was a mermaid. Her favorite characters are of the morally gray variety and believes that everyone should check their sanity at the door before diving into her stories.', NULL, NULL, 'https://covers.openlibrary.org/b/id/12986920-L.jpg', 'https://covers.openlibrary.org/b/id/12986920-M.jpg', NULL, '2026-03-07 11:10:56.431', 'H. D. Carlton', NULL, '2026-03-07 11:10:56.431', true, 'OL10218224A', NULL, NULL);
INSERT INTO public."Author" VALUES ('3548c0f3-87a4-4484-a58a-7c6488361cae', 'Italian neuroscientist and writer of romance novels.', NULL, NULL, 'https://covers.openlibrary.org/b/id/12916673-L.jpg', 'https://covers.openlibrary.org/b/id/12916673-M.jpg', NULL, '2026-03-07 11:10:59.126', 'Ali Hazelwood', NULL, '2026-03-07 11:10:59.126', true, 'OL9096427A', NULL, NULL);
INSERT INTO public."Author" VALUES ('8c00d0a4-fd96-4d3c-8a2d-b063d3817771', 'Sarah J. Maas is the #1 New York Times and internationally bestselling author of the Crescent City, A Court of Thorns and Roses, and the Throne of Glass series. Her books have sold more than twelve million copies and are published in thirty-seven languages. A New York native, Sarah lives in Philadelphia with her husband, son, and dog. To find out more, visit sarahjmaas.com or follow @therealsjmaas on Instagram.', '1986-03-04 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/15156166-L.jpg', 'https://covers.openlibrary.org/b/id/15156166-M.jpg', NULL, '2026-03-07 11:11:01.859', 'Sarah J. Maas', NULL, '2026-03-07 11:11:01.859', true, 'OL7115219A', NULL, NULL);
INSERT INTO public."Author" VALUES ('29edfbbb-d676-424e-ade3-c4793f5da1b5', 'Tahereh Mafi is an American author based in Santa Monica, California. She is known for writing young adult fiction.', '1988-11-08 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/7274392-L.jpg', 'https://covers.openlibrary.org/b/id/7274392-M.jpg', NULL, '2026-03-07 11:11:04.612', 'Tahereh Mafi', NULL, '2026-03-07 11:11:04.612', true, 'OL6964763A', NULL, NULL);
INSERT INTO public."Author" VALUES ('8664e246-9277-409b-906d-19ad87b76b92', 'No biography available.', '1976-01-01 00:00:00', NULL, 'https://covers.openlibrary.org/b/id/7914208-L.jpg', 'https://covers.openlibrary.org/b/id/7914208-M.jpg', NULL, '2026-03-07 11:11:49.479', 'Yuval Noah Harari', NULL, '2026-03-07 11:11:49.479', true, 'OL3778242A', NULL, NULL);
INSERT INTO public."Author" VALUES ('cc2b4fab-4453-423e-acff-028741435a31', '孙武（前545年—前470年或前496年）妫姓，孙氏，名武，字长卿，春秋时期齐国人，陈胡公的直系后代，著名军事家、政治家，兵家代表人物。兵书《孙子兵法》的作者，后人尊称为孙子、兵圣、东方兵圣。', NULL, NULL, 'https://covers.openlibrary.org/b/id/14850583-L.jpg', 'https://covers.openlibrary.org/b/id/14850583-M.jpg', NULL, '2026-03-07 11:11:52.263', '孙武', NULL, '2026-03-07 11:11:52.263', true, 'OL30553A', NULL, NULL);
INSERT INTO public."Author" VALUES ('16672eba-ab5c-4fc5-a5ee-b403756b152f', 'No biography available.', '1977-01-01 00:00:00', NULL, 'https://covers.openlibrary.org/a/olid/OL7471384A-L.jpg?default=false', 'https://covers.openlibrary.org/a/olid/OL7471384A-M.jpg?default=false', NULL, '2026-03-07 11:11:57.794', 'Alex Michaelides', NULL, '2026-03-07 11:11:57.794', true, 'OL7471384A', NULL, NULL);
INSERT INTO public."Author" VALUES ('730a6234-59f6-4676-9599-f089d5a48f87', 'Paulo Coelho, born and raised in Rio de Janeiro, Brazil, is a Brazilian novelist known for employing rich symbolism in his depictions of the often spiritually motivated journeys taken by his characters. Coelho dropped out of law school in 1970 and traveled through South America, Mexico, North Africa, and Europe. In 1972 he returned home and began writing pop and rock music lyrics with Raul Seixas, a well-known Brazilian singer and songwriter. He worked for Polygram and CBS Records until 1980, when he embarked on new travels in Europe and Africa.

It was during this trip that he walked the route of Santiago de Compostela, which formed the basis of his first book, *O diário de um mago* (1987), which was published in English as *The Diary of a Magus* in 1992 and was reissued as *The Pilgrimage* in 1995. In 1988 Coelho published *O alquimista* (*The Alchemist*), which ultimately became an international best-seller. His other notable works include *The Valkyries*, *Eleven Minutes*, *Manual of The Warrior of Light*, *Manuscript Found in Accra*, *The Devil and Miss Prym*, *The Fifth Mountain*, *Veronika Decides to Die*, and *The Zahir*.

Source: [Britannica](https://www.britannica.com/biography/Paulo-Coelho)', '1947-08-23 22:00:00', NULL, 'https://covers.openlibrary.org/b/id/6286753-L.jpg', 'https://covers.openlibrary.org/b/id/6286753-M.jpg', NULL, '2026-03-07 11:11:07.346', 'Paulo Coelho', NULL, '2026-03-07 11:11:07.346', true, 'OL66700A', NULL, NULL);
INSERT INTO public."Author" VALUES ('b313c939-5b06-4f54-a52a-c6e2e1b8968d', 'George Orwell, originally born as Eric Arthur Blair, was an English novelist and journalist. His work is marked by keen intelligence and wit, a profound awareness of social injustice, an intense, revolutionary opposition to totalitarianism, a passion for clarity in language and a belief in democratic socialism. ([Source][1].)

[1]:https://en.wikipedia.org/wiki/George_Orwell', '1903-06-24 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/9160343-L.jpg', 'https://covers.openlibrary.org/b/id/9160343-M.jpg', NULL, '2026-03-07 11:11:10.096', 'George Orwell', NULL, '2026-03-07 11:11:10.096', true, 'OL118077A', NULL, NULL);
INSERT INTO public."Author" VALUES ('5888be7e-f4cc-451f-861d-a124e062573d', 'American author', '1969-01-01 00:00:00', NULL, 'https://covers.openlibrary.org/b/id/15158775-L.jpg', 'https://covers.openlibrary.org/b/id/15158775-M.jpg', NULL, '2026-03-07 11:11:13.059', 'Kathleen Glasgow', NULL, '2026-03-07 11:11:13.059', true, 'OL7632574A', NULL, NULL);
INSERT INTO public."Author" VALUES ('a25ade87-4d04-4504-bd8a-1cbbd123268e', 'Jeffrey Patrick "Jeff" Kinney (born February 19, 1971) is an American game designer and author of children''s books including the Diary of a Wimpy Kid book series. He is also attributed to be the creator of the children-oriented website Poptropica.

Kinney attended Pittsburgh high school in Pittsburgh  and currently lives in Tustin, California  with his wife and two sons Will and Grant.', '1971-02-18 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/15125415-L.jpg', 'https://covers.openlibrary.org/b/id/15125415-M.jpg', NULL, '2026-03-07 11:11:15.948', 'Jeff Kinney', NULL, '2026-03-07 11:11:15.948', true, 'OL2832500A', NULL, NULL);
INSERT INTO public."Author" VALUES ('f6b08559-1384-4d78-962b-c58dec25ac11', 'Jane Austen was an English writer. Although Austen was widely read in her lifetime, she published her works anonymously. The most urgent preoccupations of her bright, young heroines are courtship and marriage. Austen herself never married. Her best-known books include *Pride and Prejudice* (1813) and *Emma* (1816). Virginia Woolf called Austen "the most perfect artist among women.', '1775-12-15 22:43:40', NULL, 'https://covers.openlibrary.org/b/id/7005426-L.jpg', 'https://covers.openlibrary.org/b/id/7005426-M.jpg', NULL, '2026-03-07 11:11:21.327', 'Jane Austen', NULL, '2026-03-07 11:11:21.327', true, 'OL21594A', NULL, NULL);
INSERT INTO public."Author" VALUES ('26936a34-5325-4536-b8fa-4988b0fbf8f3', 'No biography available.', '1963-03-06 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/14362742-L.jpg', 'https://covers.openlibrary.org/b/id/14362742-M.jpg', NULL, '2026-03-07 11:11:24.254', 'E. L. James', NULL, '2026-03-07 11:11:24.254', true, 'OL7093600A', NULL, NULL);
INSERT INTO public."Author" VALUES ('6fe9fc89-c5e9-4894-a92f-a5346bf0c932', 'American author of young adult literature, whose works include *The Hunger Games* trilogy and *The Underland Chronicles* series. The daughter of an Air Force officer, she lives in her native home of Connecticut.', '1962-01-01 00:00:00', NULL, 'https://covers.openlibrary.org/b/id/7026950-L.jpg', 'https://covers.openlibrary.org/b/id/7026950-M.jpg', NULL, '2026-03-07 11:11:27.052', 'Suzanne Collins', NULL, '2026-03-07 11:11:27.052', true, 'OL1394359A', NULL, NULL);
INSERT INTO public."Author" VALUES ('c090e202-e4ec-4854-90e2-19bb300c07eb', 'No biography available.', '1964-06-04 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/14401292-L.jpg', 'https://covers.openlibrary.org/b/id/14401292-M.jpg', NULL, '2026-03-07 11:11:30.313', 'Rick Riordan', NULL, '2026-03-07 11:11:30.313', true, 'OL30765A', NULL, NULL);
INSERT INTO public."Author" VALUES ('3c4d1d6d-54c6-44bc-9b60-262e9bdf0a58', 'Nelle Harper Lee was an American novelist. She wrote the 1960 novel *To Kill a Mockingbird* that won the 1961 Pulitzer Prize and became a classic of modern American literature. Lee received numerous accolades and honorary degrees, including the Presidential Medal of Freedom in 2007 which was awarded for her contribution to literature. She assisted her close friend Truman Capote in his research for the book *In Cold Blood* (1966). Capote was the basis for the character Dill Harris in *To Kill a Mockingbird.*', '1926-04-27 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/6389646-L.jpg', 'https://covers.openlibrary.org/b/id/6389646-M.jpg', NULL, '2026-03-07 11:11:33.135', 'Harper Lee', NULL, '2026-03-07 11:11:33.135', true, 'OL498120A', NULL, NULL);
INSERT INTO public."Author" VALUES ('9cadb009-c573-4e66-9763-452caa4fdfaa', 'British writer', '1992-01-01 00:00:00', NULL, 'https://covers.openlibrary.org/b/id/14433789-L.jpg', 'https://covers.openlibrary.org/b/id/14433789-M.jpg', NULL, '2026-03-07 11:11:36.109', 'Holly Jackson', NULL, '2026-03-07 11:11:36.109', true, 'OL7722491A', NULL, NULL);
INSERT INTO public."Author" VALUES ('ec0eb3a3-2fdb-4a9d-a978-15e57cf363d0', 'an American novelist and film producer. She is best known for writing the vampire romance series Twilight.
Meyer was the bestselling author of 2008 and 2009 in the U.S. 
Meyer received the 2009 Children''s Book of the Year award from the British Book Awards for Breaking Dawn, the Twilight series finale.

Stephenie Morgan was born on December 24, 1973, in Hartford, Connecticut, the second of six children to financial officer Stephen Morgan and homemaker Candy Morgan. Meyer was raised in Phoenix, Arizona, and attended Chaparral High School in Scottsdale, Arizona. In 1992, Meyer won a National Merit Scholarship, which helped fund her undergraduate studies at Brigham Young University in Provo, Utah, where she received a BA in English Literature in 1997. Although she began and finished her degree at BYU, she took classes at Arizona State University in fall 1996 and spring 1997.

Meyer met her future husband, Christian "Pancho" Meyer, in Arizona when they were both children. They married in 1994, when Meyer was twenty-one.Together, they have sons who Christian Meyer retired from his job as an auditor to take care of full time.

Before writing her first novel, Twilight, Meyer considered going to law school because she felt she had no chance of becoming a writer. She later noted that the birth of her oldest son, Gabe, in 1997 changed her mind: "Once I had Gabe, I just wanted to be his mom." Before becoming an author, Meyer''s only professional work was as a receptionist at a property company.', '1973-12-23 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/3366829-L.jpg', 'https://covers.openlibrary.org/b/id/3366829-M.jpg', NULL, '2026-03-07 11:11:41.383', 'Stephenie Meyer', NULL, '2026-03-07 11:11:41.383', true, 'OL1391085A', NULL, NULL);
INSERT INTO public."Author" VALUES ('8e09fc0d-0e66-4f6b-bd11-480dbae919e2', 'Holly Black is the #1 New York Times bestselling author of over thirty fantasy novels for kids and teens. She has been a finalist for an Eisner Award and the Lodestar Award, and the recipient of the Mythopoeic Award, a Nebula, and a Newbery Honor. Her books have been translated into 32 languages worldwide and adapted for film. She currently lives in New England with her husband and son in a house with a secret library.', '1971-11-09 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/7284384-L.jpg', 'https://covers.openlibrary.org/b/id/7284384-M.jpg', NULL, '2026-03-07 11:11:46.723', 'Holly Black', NULL, '2026-03-07 11:11:46.723', true, 'OL1430285A', NULL, NULL);
INSERT INTO public."Author" VALUES ('dc6c3380-e99b-441e-9985-d21d6d877100', 'Taylor Jenkins Reid is the author of the New York Times Bestselling novels *Carrie Soto Is Back*, *Malibu Rising*, *Daisy Jones and The Six* and *The Seven Husbands of Evelyn Hugo*, as well as *One True Loves*, *Maybe in Another Life*, *After I Do*, and *Forever, Interrupted*. Her books have been chosen by Reese’s Book Club, Read with Jenna, Indie Next, Best of Amazon, and Book of the Month. Her novel, *Daisy Jones and The Six*, is now a limited series on Amazon Prime. She lives in Los Angeles.', '1983-01-01 00:00:00', NULL, 'https://covers.openlibrary.org/b/id/12925659-L.jpg', 'https://covers.openlibrary.org/b/id/12925659-M.jpg', NULL, '2026-03-07 11:12:00.562', 'Taylor Jenkins Reid', NULL, '2026-03-07 11:12:00.562', true, 'OL7290222A', NULL, NULL);
INSERT INTO public."Author" VALUES ('77873e49-18e0-4d88-9178-194e1acedf49', 'No biography available.', NULL, NULL, 'https://covers.openlibrary.org/a/olid/OL7620131A-L.jpg?default=false', 'https://covers.openlibrary.org/a/olid/OL7620131A-M.jpg?default=false', NULL, '2026-03-07 11:12:08.76', 'Casey McQuiston', NULL, '2026-03-07 11:12:08.76', true, 'OL7620131A', NULL, NULL);
INSERT INTO public."Author" VALUES ('19f5a874-789e-4356-8b3e-dab40a26f720', 'No biography available.', '1909-06-18 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/8139734-L.jpg', 'https://covers.openlibrary.org/b/id/8139734-M.jpg', NULL, '2026-03-07 11:12:14.06', '太宰 治', NULL, '2026-03-07 11:12:14.06', true, 'OL714657A', NULL, NULL);
INSERT INTO public."Author" VALUES ('6f516a5a-3924-44cf-bbd5-7d94089913a7', 'Jenny Han is an American author of young adult fiction and children''s fiction. She is best known for writing The Summer I Turned Pretty trilogy and the To All the Boys series, the latter of which was adapted into a film of the same name in 2018 starring Lana Condor and Noah Centineo.

https://en.wikipedia.org/wiki/Jenny_Han', '1980-09-02 22:00:00', NULL, 'https://covers.openlibrary.org/b/id/9372037-L.jpg', 'https://covers.openlibrary.org/b/id/9372037-M.jpg', NULL, '2026-03-07 11:12:19.401', 'Jenny Han', NULL, '2026-03-07 11:12:19.401', true, 'OL1425972A', NULL, NULL);
INSERT INTO public."Author" VALUES ('5bca985c-3483-45b8-9088-b2fabc9bf997', 'No biography available.', NULL, NULL, 'https://covers.openlibrary.org/b/id/15156039-L.jpg', 'https://covers.openlibrary.org/b/id/15156039-M.jpg', NULL, '2026-03-07 11:12:22.133', 'Palle Vasu', NULL, '2026-03-07 11:12:22.133', true, 'OL15330765A', NULL, NULL);
INSERT INTO public."Author" VALUES ('7cfc5984-5170-4e61-b920-20e930ff6aef', 'John Ronald Reuel Tolkien (1892-1973) was a major scholar of the English language, specialising in Old and Middle English. Twice Professor of Anglo-Saxon (Old English) at the University of Oxford, he also wrote a number of stories, including most famously The Hobbit (1937) and The Lord of the Rings (1954-1955), which are set in a pre-historic era in an invented version of the world which he called by the Middle English name of Middle-earth. This was peopled by Men (and women), Elves, Dwarves, Trolls, Orcs (or Goblins) and of course Hobbits. He has regularly been condemned by the Eng. Lit. establishment, with honourable exceptions, but loved by literally millions of readers worldwide.

In the 1960s he was taken up by many members of the nascent "counter-culture" largely because of his concern with environmental issues. In 1997 he came top of three British polls, organised respectively by Channel 4 / Waterstone''s, the Folio Society, and SFX, the UK''s leading science fiction media magazine, amongst discerning readers asked to vote for the greatest book of the 20th century. 

([Source][1])


  [1]: http://www.tolkiensociety.org/tolkien/biography.html', '1892-01-02 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/6155606-L.jpg', 'https://covers.openlibrary.org/b/id/6155606-M.jpg', NULL, '2026-03-07 11:12:27.67', 'J.R.R. Tolkien', NULL, '2026-03-07 11:12:27.67', true, 'OL26320A', NULL, NULL);
INSERT INTO public."Author" VALUES ('068bb746-d566-4eba-9a97-91ab8f10e42f', 'Hanya K Yanagihara (born September 20, 1974)[3] is an American novelist, editor, and travel writer. She grew up in Hawaii.[4]

Photo by SamLevyPhoto2020 - Own work, CC BY-SA 4.0, https://commons.wikimedia.org/w/index.php?curid=93126610', '1974-01-01 00:00:00', NULL, 'https://covers.openlibrary.org/b/id/11463283-L.jpg', 'https://covers.openlibrary.org/b/id/11463283-M.jpg', NULL, '2026-03-07 11:12:33.406', 'Hanya Yanagihara', NULL, '2026-03-07 11:12:33.406', true, 'OL9325164A', NULL, NULL);
INSERT INTO public."Author" VALUES ('33c6a688-eeb5-4000-a3ab-3d228b594413', 'John Green''s first novel, Looking for Alaska, won the 2006 Michael L. Printz Award presented by the American Library Association. His second novel, An Abundance of Katherines, was a 2007 Michael L. Printz Award Honor Book and a finalist for the Los Angeles Times Book Prize. His next novel, Paper Towns, is a New York Times bestseller and won the Edgar Allen Poe Award for Best YA Mystery.  Starting in 2007, John and his brother Hank were the hosts of a popular internet blog, "Brotherhood 2.0," (aka [vlogbrothers](https://www.youtube.com/@vlogbrothers)) where they discussed their lives, books and current events every day for a year except for weekends and holidays.', '1977-08-23 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/8109586-L.jpg', 'https://covers.openlibrary.org/b/id/8109586-M.jpg', NULL, '2026-03-07 11:12:36.418', 'John Green', NULL, '2026-03-07 11:12:36.418', true, 'OL5046634A', NULL, NULL);
INSERT INTO public."Author" VALUES ('16c3afe6-6b36-408f-baa0-5b31681f4fe0', 'Antoine de Saint-Exupéry (29 June 1900—31 July 1944) was a French writer and aviator. He is best remembered for his novella *The Little Prince (Le Petit Prince)*, and for his books about aviation adventures, including Night Flight and Wind, Sand and Stars.

He was a successful commercial pilot before World War II, joining the Armée de l''Air (French Air Force) on the outbreak of war, flying reconnaissance missions until the armistice with Germany. Following a spell of writing in the United States, he joined the Free French Forces. He disappeared on a reconnaissance flight over the Mediterranean in July 1944.

([Source][1])


  [1]: http://en.wikipedia.org/wiki/Antoine_de_Saint-Exupéry', '1900-06-28 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/6338378-L.jpg', 'https://covers.openlibrary.org/b/id/6338378-M.jpg', NULL, '2026-03-07 11:12:47.712', 'Antoine de Saint-Exupéry', NULL, '2026-03-07 11:12:47.712', true, 'OL31901A', NULL, NULL);
INSERT INTO public."Author" VALUES ('7e65eff1-e2f5-4238-bf1d-1715f7154d76', 'Ray Bradbury is one of those rare individuals whose writing has changed the way people think. His more than five hundred published works -- short stories, novels, plays, screenplays, television scripts, and verse -- exemplify the American imagination at its most creative. 

Once read, his words are never forgotten. His best-known and most beloved books, *The Martian Chronicles*, *The Illustrated Man*, *Fahrenheit 451* and *Something Wicked This Way Comes*, are masterworks that readers carry with them over a lifetime. His timeless, constant appeal to audiences young and old has proven him to be one of the truly classic authors of the 20th Century -- and the 21st. 

In recognition of his stature in the world of literature and the impact he has had on so many for so many years, Bradbury was awarded the National Book Foundation''s 2000 Medal for Distinguished Contribution to American Letters, an the National Medal of Arts in 2004. 

([Source][1])


  [1]: http://www.raybradbury.com/about.html', '1920-08-21 22:00:00', NULL, 'https://covers.openlibrary.org/b/id/14853852-L.jpg', 'https://covers.openlibrary.org/b/id/14853852-M.jpg', NULL, '2026-03-07 11:12:50.571', 'Ray Bradbury', NULL, '2026-03-07 11:12:50.571', true, 'OL24137A', NULL, NULL);
INSERT INTO public."Author" VALUES ('66974af1-0788-4a9a-89bd-d447a10ca35a', 'Elwyn Brooks "E. B." White was an American writer. A long-time contributor to "The New Yorker" magazine, he also wrote many famous books for both adults and children, such as the popular Charlotte''s Web and Stuart Little, and co-authored a widely used writing guide, The Elements of Style, popularly known by its authors'' names, as "Strunk & White."', '1899-07-10 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/6390049-L.jpg', 'https://covers.openlibrary.org/b/id/6390049-M.jpg', NULL, '2026-03-07 11:12:53.569', 'E. B. White', NULL, '2026-03-07 11:12:53.569', true, 'OL30250A', NULL, NULL);
INSERT INTO public."Author" VALUES ('9c105044-9faf-412d-9c9d-ee8ee3c98c86', 'Madeline Miller was born in Boston and grew up in New York City and Philadelphia. She attended Brown University, where she earned her BA and MA in Classics. For the last ten years she has been teaching and tutoring Latin, Greek and Shakespeare to high school students. She also studied in the Dramaturgy department at Yale School of Drama, where she focused on the adaptation of classical texts to modern forms. She currently lives near Philadelphia, PA. The Song of Achilles is her first novel. Her second novel, Circe, will be published in April 2018. Visit her website at: www.madelinemiller.com', '1978-07-23 23:00:00', NULL, 'https://covers.openlibrary.org/b/id/14853654-L.jpg', 'https://covers.openlibrary.org/b/id/14853654-M.jpg', NULL, '2026-03-07 11:12:56.446', 'Madeline Miller', NULL, '2026-03-07 11:12:56.446', true, 'OL1926056A', NULL, NULL);


--
-- TOC entry 3487 (class 0 OID 17203)
-- Dependencies: 220
-- Data for Name: Book; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Book" VALUES ('99251f46-c7d2-4392-b160-20340b8e5602', 'It Ends With Us', '8ccc1848-b5f3-40bd-b538-af841fe39a01', 2012, 385, 'Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town where she grew up—she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life seems too good to be true.

Ryle is assertive, stubborn, maybe even a little arrogant. He’s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn’t hurt. Lily can’t get him out of her head. But Ryle’s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his “no dating” rule, she can’t help but wonder what made him that way in the first place.

As questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan—her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.

With this bold and deeply personal novel, It Ends With Us is a heart-wrenching story and an unforgettable tale of love that comes at the ultimate price.', '2026-03-07 11:10:39.473', 'https://covers.openlibrary.org/b/id/10473609-L.jpg', 'https://covers.openlibrary.org/b/id/10473609-M.jpg', true, NULL, 2024, 'Atria', NULL, '2026-03-07 11:10:39.473', NULL, '/works/OL18020194W');
INSERT INTO public."Book" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'Harry Potter and the Philosopher''s Stone', '39a4afc7-f7a6-4d14-900f-b777748b6e88', 1997, 305, 'Turning the envelope over, his hand trembling, Harry saw a purple wax seal bearing a coat of arms; a lion, an eagle, a badger and a snake surrounding a large letter ''H''.

HARRY POTTER has never even heard of Hogwarts when the LETTERS start dropping on the doormat at number four, Privet Drive. Addressed in GREEN INK on yellowish parchment with a PURPLE SEAL, they are swiftly confiscated by his GRISLY aunt and uncle. Then, on Harry''s eleventh birthday, a great beetle-eyed giant of a man called RUBEUS HAGRID bursts in with some ASTONISHING news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!', '2026-03-07 11:10:42.342', 'https://covers.openlibrary.org/b/id/15155833-L.jpg', 'https://covers.openlibrary.org/b/id/15155833-M.jpg', true, NULL, 2025, 'salamandra', NULL, '2026-03-07 11:10:42.342', NULL, '/works/OL82563W');
INSERT INTO public."Book" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', 'It Starts with Us', '8ccc1848-b5f3-40bd-b538-af841fe39a01', 2022, 369, '**Before It Ends with Us, it started with Atlas. Colleen Hoover tells fan favorite Atlas’s side of the story and shares what comes next in this long-anticipated sequel to the “glorious and touching” (USA TODAY) #1 New York Times bestseller It Ends with Us.**

Lily and her ex-husband, Ryle, have just settled into a civil coparenting rhythm when she suddenly bumps into her first love, Atlas, again. After nearly two years separated, she is elated that for once, time is on their side, and she immediately says yes when Atlas asks her on a date.

But her excitement is quickly hampered by the knowledge that, though they are no longer married, Ryle is still very much a part of her life—and Atlas Corrigan is the one man he will hate being in his ex-wife and daughter’s life.

Switching between the perspectives of Lily and Atlas, It Starts with Us picks up right where the epilogue for the “gripping, pulse-pounding” (Sarah Pekkanen, author of Perfect Neighbors) bestselling phenomenon It Ends with Us left off. Revealing more about Atlas’s past and following Lily as she embraces a second chance at true love while navigating a jealous ex-husband, it proves that “no one delivers an emotional read like Colleen Hoover” (Anna Todd, New York Times bestselling author).', '2026-03-07 11:10:45.02', 'https://covers.openlibrary.org/b/id/12749873-L.jpg', 'https://covers.openlibrary.org/b/id/12749873-M.jpg', true, NULL, 2023, 'Great Britain by Simon & Schuster UK Ltd, 2022', NULL, '2026-03-07 11:10:45.02', NULL, '/works/OL27733867W');
INSERT INTO public."Book" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', 'Twisted Love', 'aa73ae39-9cd7-44df-b9fe-1e8d533310f7', 2021, 365, 'He has a heart of ice … but for her, he''d burn the world. Alex Volkov is a devil blessed with the face of an angel and cursed with a past he can''t escape. Driven by a tragedy that has haunted him for most of his life, his ruthless pursuits for success and vengeance leave little room for matters of the heart. But when he''s forced to look after his best friend''s sister, he starts to feel something in his chest: A crack. A melt. A fire that could end his world as he knew it.

Ava Chen is a free spirit trapped by nightmares of a childhood she can''t remember. But despite her broken past, she''s never stopped seeing the beauty in the world … including the heart beneath the icy exterior of a man she shouldn''t want. Her brother''s best friend. Her neighbor. Her savior and her downfall. Theirs is a love that was never supposed to happen - but when it does, it unleashes secrets that could destroy them both … and everything they hold dear. Twisted Love is a brother''s best friend/opposites attract romance with a hint of suspense. It''s book one in the Twisted series, but can be read as a standalone. WARNING: This book contains a possessive alpha/antihero, explicit sexual content, and profanity. No cheating or ménage, but if you''re looking for a traditionally sweet, loveable hero, this is not the book for you. Recommended for 18+.', '2026-03-07 11:10:47.758', 'https://covers.openlibrary.org/b/id/12940491-L.jpg', 'https://covers.openlibrary.org/b/id/12940491-M.jpg', true, NULL, 2023, 'clube do autor ', NULL, '2026-03-07 11:10:47.758', NULL, '/works/OL24390422W');
INSERT INTO public."Book" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'A Game of Thrones', '17393407-c644-42b0-a076-b9e91ec49958', 1996, 772, '***A Game of Thrones*** is the inaugural novel in ***A Song of Ice and Fire***, an epic series of fantasy novels crafted by the American author **George R. R. Martin**. Published on August 1, 1996, this novel introduces readers to the richly detailed world of Westeros and Essos, where political intrigue, power struggles, and magical elements intertwine.

The story unfolds through multiple perspectives, each chapter focusing on a different character, allowing readers to experience the narrative from various angles. This complex structure has become a hallmark of Martin''s storytelling, immersing readers in the lives and motivations of a diverse cast.

### Plot Summary

Set in the fictional continents of Westeros and Essos, the narrative revolves around the power struggles among noble families vying for the Iron Throne, the seat of power in the Seven Kingdoms of Westeros. The story is rich with political intrigue, betrayal, and epic battles, as well as a deep exploration of themes such as loyalty, honor, and the consequences of power.

### Themes

The novel explores themes of power, loyalty, and the moral complexities of leadership. It delves into the consequences of ambition and the struggle between personal honor and political necessity. The richly detailed world-building and intricate character development make ***A Game of Thrones*** a compelling and immersive read.

### Key Characters

- **Eddard "Ned" Stark**: The honorable Lord of Winterfell and Warden of the North, known for his unwavering honor and sense of duty.
- **Catelyn Stark**: The devoted wife of Eddard Stark, whose strength and wisdom guide her family through challenging times.
- **Robert Baratheon**: The King of the Seven Kingdoms, who won the throne through rebellion. His reign is marked by political intrigue and personal struggles, reflecting the broader conflicts of the realm.
- **Cersei Lannister**: The ambitious and cunning Queen of Westeros, whose political acumen and determination make her a formidable presence in the court.
- **Jaime Lannister**: A skilled swordsman and member of the Kingsguard, known for his prowess in battle and complex loyalties.
- **Tyrion Lannister**: The witty and resourceful dwarf, known for his sharp mind and cunning, navigating the treacherous politics of the realm.
- **Daenerys Targaryen**: An exiled princess of House Targaryen, seeking to reclaim her birthright and restore her family''s dynasty.
- **Jon Snow**: The bastard son of Eddard Stark, who joins the Night''s Watch and faces unique challenges in the far north.
- **Sansa Stark**: The eldest daughter of Eddard Stark, initially known for her naivety and romantic ideals, who learns to navigate the complexities of court life.
- **Arya Stark**: The youngest daughter of Eddard Stark, known for her spirited and adventurous nature, seeking her own path in the world.
- **Bran Stark**: The second son of Eddard Stark, whose life takes a dramatic turn.

### Awards and Recognition

- Winner of the 1997 Locus Award
- Nominated for the 1997 Nebula Award
- Nominated for the 1997 World Fantasy Award
- Winner of the 1997 Hugo Award for Best Novella for "Blood of the Dragon," which includes the Daenerys Targaryen chapters from the novel
- Became a New York Times Bestseller in January 2011 and reached No. 1 on the list in July 2011

Followed by: [***A Clash of Kings***][1]

[1]: https://openlibrary.org/works/OL257939W', '2026-03-07 11:10:50.516', 'https://covers.openlibrary.org/b/id/9269962-L.jpg', 'https://covers.openlibrary.org/b/id/9269962-M.jpg', true, NULL, 2022, 'Debutxaca', NULL, '2026-03-07 11:10:50.516', NULL, '/works/OL257943W');
INSERT INTO public."Book" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'It', '74e90205-df10-4206-a8f8-e90838ef8f90', 1986, 1200, '"*It*" is a 1986 horror novel by American author Stephen King. "*It*" was his 22nd book and his 17th novel written under his own name. The story follows the experiences of seven children as they are terrorized by an evil entity that exploits the fears of its victims to disguise itself while hunting its prey. "*It*" primarily appears in the form of Pennywise the Dancing Clown to attract its preferred prey of young children.

The novel won the British Fantasy Award in 1987, and received nominations for the Locus and World Fantasy Awards that same year.

In 2003, "*It*" was listed at number 144 on the BBC''s The Big Read poll.




----------
See also:

 - [IT 1/2][2]
 - [IT 2/2][3]


  [1]: https://www.stephenking.com/library/novel/it.html
  [2]: https://openlibrary.org/works/OL14916816W/It_1_2
  [3]: https://openlibrary.org/works/OL14916818W/It_2_2', '2026-03-07 11:10:53.71', 'https://covers.openlibrary.org/b/id/8569284-L.jpg', 'https://covers.openlibrary.org/b/id/8569284-M.jpg', true, NULL, 2021, 'Altin Kitaplar', NULL, '2026-03-07 11:10:53.71', NULL, '/works/OL81613W');
INSERT INTO public."Book" VALUES ('0be78d56-30eb-4641-8267-804cbdbdb94c', 'Haunting Adeline', '8af4ae5f-2ea3-4ddf-84c7-74d0aef21e27', 2021, 612, '**The Manipulator**

I can manipulate the emotions of anyone who lets me.

I will make you hurt, make you cry, make you laugh and sigh.

But my words don''t affect him. Especially not when I plead for him to leave.

He''s always there, watching and waiting.

And I can never look away.

Not when I want him to come closer.

**The Shadow**

I didn''t mean to fall in love.

But now that I have, I can''t stay away.

I''m mesmerized by her smile, by her eyes, and the way she moves.

The way she undresses...

I''ll keep watching and waiting. Until I can make her mine.

And once she is, I''ll never let her go.

Not even when she begs me to.', '2026-03-07 11:10:56.439', 'https://covers.openlibrary.org/b/id/12992962-L.jpg', 'https://covers.openlibrary.org/b/id/12992962-M.jpg', true, NULL, 2025, 'Hailey Carlton', NULL, '2026-03-07 11:10:56.439', NULL, '/works/OL27310398W');
INSERT INTO public."Book" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', 'The Love Hypothesis', '3548c0f3-87a4-4484-a58a-7c6488361cae', 2021, 405, 'The Instant New York Times Best Seller and TikTok Sensation!

As seen on The View!

A BuzzFeed Best Summer Read of 2021

When a fake relationship between scientists meets the irresistible force of attraction, it throws one woman''s carefully calculated theories on love into chaos.

As a third-year PhD candidate, Olive Smith doesn''t believe in lasting romantic relationships—but her best friend does, and that''s what got her into this situation. Convincing Anh that Olive is dating and well on her way to a happily ever after was always going to take more than hand-wavy Jedi mind tricks: Scientists require proof. So, like any self-respecting biologist, Olive panics and kisses the first man she sees.

That man is none other than Adam Carlsen, a young hotshot professor—and well-known ass. Which is why Olive is positively floored when Stanford''s reigning lab tyrant agrees to keep her charade a secret and be her fake boyfriend. But when a big science conference goes haywire, putting Olive''s career on the Bunsen burner, Adam surprises her again with his unyielding support and even more unyielding...six-pack abs.

Suddenly their little experiment feels dangerously close to combustion. And Olive discovers that the only thing more complicated than a hypothesis on love is putting her own heart under the microscope.', '2026-03-07 11:10:59.132', 'https://covers.openlibrary.org/b/id/10601402-L.jpg', 'https://covers.openlibrary.org/b/id/10601402-M.jpg', true, NULL, 2025, 'The House of Books', NULL, '2026-03-07 11:10:59.132', NULL, '/works/OL24178205W');
INSERT INTO public."Book" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', 'A Court of Mist and Fury', '8c00d0a4-fd96-4d3c-8a2d-b063d3817771', 2014, 577, 'Feyre has undergone more trials than one human woman can carry in her heart. Though she''s now been granted the powers and lifespan of the High Fae, she is haunted by her time Under the Mountain and the terrible deeds she performed to save the lives of Tamlin and his people.

As her marriage to Tamlin approaches, Feyre''s hollowness and nightmares consume her. She finds herself split into two different people: one who upholds her bargain with Rhysand, High Lord of the feared Night Court, and one who lives out her life in the Spring Court with Tamlin. While Feyre navigates a dark web of politics, passion, and dazzling power, a greater evil looms. She might just be the key to stopping it, but only if she can harness her harrowing gifts, heal her fractured soul, and decide how she wishes to shape her future-and the future of a world in turmoil.

Bestselling author Sarah J. Maas''s masterful storytelling brings this second book in her dazzling, sexy, action-packed series to new heights.', '2026-03-07 11:11:01.863', 'https://covers.openlibrary.org/b/id/14315081-L.jpg', 'https://covers.openlibrary.org/b/id/14315081-M.jpg', true, NULL, 2024, 'Editorial Planeta, S. A.', NULL, '2026-03-07 11:11:01.863', NULL, '/works/OL17860744W');
INSERT INTO public."Book" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', 'Shatter Me', '29edfbbb-d676-424e-ade3-c4793f5da1b5', 2011, 326, 'Juliette hasn''t touched anyone in exactly 264 days. The last time she did, it was an accident, but The Reestablishment locked her up for murder. No one knows why Juliette''s touch is fatal. As long as she doesn''t hurt anyone else, no one really cares. The world is too busy crumbling to pieces to pay attention to a 17-year-old girl. Diseases are destroying the population, food is hard to find, birds don''t fly anymore, and the clouds are the wrong color. The Reestablishment said their way was the only way to fix things, so they threw Juliette in a cell. Now so many people are dead that the survivors are whispering war-- and The Reestablishment has changed its mind. Maybe Juliette is more than a tortured soul stuffed into a poisonous body. Maybe she''s exactly what they need right now. Juliette has to make a choice: Be a weapon. Or be a warrior. In this electrifying debut, Tahereh Mafi presents a world as riveting as The Hunger Games and a superhero story as thrilling as The X-Men. Full of pulse-pounding romance, intoxicating villainy, and high-stakes choices, Shatter Me is a fresh and original dystopian novel—with a paranormal twist—that will leave readers anxiously awaiting its sequel.', '2026-03-07 11:11:04.62', 'https://covers.openlibrary.org/b/id/6974992-L.jpg', 'https://covers.openlibrary.org/b/id/6974992-M.jpg', true, NULL, 2024, 'Harper Collins', NULL, '2026-03-07 11:11:04.62', NULL, '/works/OL16014245W');
INSERT INTO public."Book" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'O Alquimista', '730a6234-59f6-4676-9599-f089d5a48f87', 1988, 200, 'The Alchemist details the journey of a young Andalusian shepherd boy named Santiago. Santiago, believing a recurring dream to be prophetic, decides to travel to the pyramids of Egypt to find treasure. On the way, he encounters love, danger, opportunity and disaster. One of the significant characters that he meets is an old king named Melchizedek who tells him that "When you want something, all the universe conspires in helping you to achieve it." This is the core philosophy and motif of the book.', '2026-03-07 11:11:07.352', 'https://covers.openlibrary.org/b/id/7414780-L.jpg', 'https://covers.openlibrary.org/b/id/7414780-M.jpg', true, NULL, 2021, 'Bompiani', NULL, '2026-03-07 11:11:07.352', NULL, '/works/OL796465W');
INSERT INTO public."Book" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'Nineteen Eighty-Four', 'b313c939-5b06-4f54-a52a-c6e2e1b8968d', 1949, 282, 'Nineteen Eighty-Four: A Novel, often referred to as 1984, is a dystopian social science fiction novel by the English novelist George Orwell (the pen name of Eric Arthur Blair). It was published on 8 June 1949 by Secker & Warburg as Orwell''s ninth and final book completed in his lifetime. Thematically, Nineteen Eighty-Four centres on the consequences of totalitarianism, mass surveillance, and repressive regimentation of persons and behaviours within society. Orwell, himself a democratic socialist, modelled the authoritarian government in the novel after Stalinist Russia. More broadly, the novel examines the role of truth and facts within politics and the ways in which they are manipulated.

----------		
Also contained in:		
[Novels (Animal Farm / Burmese Days / Clergyman''s Daughter / Coming Up for Air / Keep the Aspidistra Flying / Nineteen Eighty-Four)](https://openlibrary.org/works/OL1168045W)		
[Novels (Animal Farm / Nineteen Eighty-Four)](https://openlibrary.org/works/OL1167981W)
[Orwell''s Nineteen Eighty-Four: Text, Sources, Criticism](https://openlibrary.org/works/OL1168095W)', '2026-03-07 11:11:10.104', 'https://covers.openlibrary.org/b/id/9267242-L.jpg', 'https://covers.openlibrary.org/b/id/9267242-M.jpg', true, NULL, 2024, 'CreateSpace Independent Publishing Platform', NULL, '2026-03-07 11:11:10.104', NULL, '/works/OL1168083W');
INSERT INTO public."Book" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', 'Girl in Pieces', '5888be7e-f4cc-451f-861d-a124e062573d', 2000, 429, 'Charlotte Davis is in pieces. At 17 she''s already lost more than most people do in a lifetime. But she''s learned how to forget. The broken glass washes away the sorrow until there is nothing but calm. You don''t have to think about your father and the river. Your best friend, who is gone forever. Or your mother, who has nothing left to give you. 

Every new scar hardens Charlie''s heart just a little more, yet it still hurts so much. It hurts enough to not care anymore, which is sometimes what has to happen before you can find your way back from the edge. 

A deeply moving portrait of a girl in a world that owes her nothing, and has taken so much, and the journey she undergoes to put herself back together. Kathleen Glasgow''s debut is heartbreakingly real and unflinchingly honest. It''s a story you won''t be able to look away from.', '2026-03-07 11:11:13.065', 'https://covers.openlibrary.org/b/id/8888850-L.jpg', 'https://covers.openlibrary.org/b/id/8888850-M.jpg', true, NULL, 2023, 'Presenca', NULL, '2026-03-07 11:11:13.065', NULL, '/works/OL20234863W');
INSERT INTO public."Book" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'Diary of a Wimpy Kid', 'a25ade87-4d04-4504-bd8a-1cbbd123268e', 2002, 228, 'Greg Heffley finds thrust into middle school, where undersized weaklings like him share the hallways with much bigger kids who are already shaving. But nothing scares Greg more than the moldy piece of cheese on the blacktop. Can he and his best friend, Rowley Jefferson, make it through the year without getting the Cheese Touch?', '2026-03-07 11:11:15.957', 'https://covers.openlibrary.org/b/id/14376136-L.jpg', 'https://covers.openlibrary.org/b/id/14376136-M.jpg', true, NULL, 2022, 'jeff kinney', NULL, '2026-03-07 11:11:15.957', NULL, '/works/OL8483260W');
INSERT INTO public."Book" VALUES ('29bba103-a874-4340-9f88-25059ec4a2b4', 'Ugly Love', '8ccc1848-b5f3-40bd-b538-af841fe39a01', 2014, 362, 'ATTRACTION AT FIRST SIGHT CAN BE MESSY… When Tate Collins finds airline pilot Miles Archer passed out in front of her apartment door, it is definitely not love at first sight. They wouldn’t even go so far as to consider themselves friends. But what they do have is an undeniable mutual attraction. He doesn’t want love and she doesn’t have time for a relationship, but their chemistry cannot be ignored. Once their desires are out in the open, they realize they have the perfect set-up, as long as Tate can stick to two rules: Never ask about the past and don’t expect a future. Tate is determined that she can handle it, but when she realises that she can’t, will she be able to say no to her sexy pilot when he lives just next door?', '2026-03-07 11:11:18.564', 'https://covers.openlibrary.org/b/id/12856728-L.jpg', 'https://covers.openlibrary.org/b/id/12856728-M.jpg', true, NULL, 2024, 'Galera Record', NULL, '2026-03-07 11:11:18.564', NULL, '/works/OL20577143W');
INSERT INTO public."Book" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'Pride and Prejudice', 'f6b08559-1384-4d78-962b-c58dec25ac11', 1813, 350, 'Pride and Prejudice is an 1813 novel of manners written by Jane Austen. The novel follows the character development of Elizabeth Bennet, the dynamic protagonist of the book who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness.

Mr. Bennet, owner of the Longbourn estate in Hertfordshire, has five daughters, but his property is entailed and can only be passed to a male heir. His wife also lacks an inheritance, so his family faces becoming very poor upon his death. Thus, it is imperative that at least one of the girls marry well to support the others, which is a motivation that drives the plot.', '2026-03-07 11:11:21.334', 'https://covers.openlibrary.org/b/id/14348537-L.jpg', 'https://covers.openlibrary.org/b/id/14348537-M.jpg', true, NULL, 2024, 'FINE EDITIONS PRESS', NULL, '2026-03-07 11:11:21.334', NULL, '/works/OL66554W');
INSERT INTO public."Book" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'Fifty Shades of Grey', '26936a34-5325-4536-b8fa-4988b0fbf8f3', 2000, 563, 'When literature student Anastasia Steele goes to interview young entrepreneur Christian Grey, she encounters a man who is beautiful, brilliant, and intimidating. The unworldly, innocent Ana is startled to realize she wants this man and, despite his enigmatic reserve, finds she is desperate to get close to him. Unable to resist Ana’s quiet beauty, wit, and independent spirit, Grey admits he wants her, too—but on his own terms.
 
Shocked yet thrilled by Grey’s singular erotic tastes, Ana hesitates. For all the trappings of success—his multinational businesses, his vast wealth, his loving family—Grey is a man tormented by demons and consumed by the need to control. When the couple embarks on a daring, passionately physical affair, Ana discovers Christian Grey’s secrets and explores her own dark desires.

Erotic, amusing, and deeply moving, the Fifty Shades Trilogy is a tale that will obsess you, possess you, and stay with you forever.

This book is intended for mature audiences.', '2026-03-07 11:11:24.262', 'https://covers.openlibrary.org/b/id/12648183-L.jpg', 'https://covers.openlibrary.org/b/id/12648183-M.jpg', true, NULL, 2022, 'CreateSpace Independent Publishing Platform', NULL, '2026-03-07 11:11:24.262', NULL, '/works/OL16336633W');
INSERT INTO public."Book" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'The Hunger Games', '6fe9fc89-c5e9-4894-a92f-a5346bf0c932', 2008, 373, 'The Hunger Games is a 2008 dystopian novel by the American writer Suzanne Collins. It is written in the perspective of 16-year-old Katniss Everdeen, who lives in the future, post-apocalyptic nation of Panem in North America. The Capitol, a highly advanced metropolis, exercises political control over the rest of the nation. The Hunger Games is an annual event in which one boy and one girl aged 12–18 from each of the twelve districts surrounding the Capitol are selected by lottery to compete in a televised battle royale to the death.

The book received critical acclaim from major reviewers and authors. It was praised for its plot and character development. In writing The Hunger Games, Collins drew upon Greek mythology, Roman gladiatorial games, and contemporary reality television for thematic content. The novel won many awards, including the California Young Reader Medal, and was named one of Publishers Weekly''s "Best Books of the Year" in 2008.

The Hunger Games was first published in hardcover on September 14, 2008, by Scholastic, featuring a cover designed by Tim O''Brien.', '2026-03-07 11:11:27.064', 'https://covers.openlibrary.org/b/id/12646537-L.jpg', 'https://covers.openlibrary.org/b/id/12646537-M.jpg', true, NULL, 2025, '大塊文化出版股份有限公司', NULL, '2026-03-07 11:11:27.064', NULL, '/works/OL5735363W');
INSERT INTO public."Book" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', 'The Lightning Thief', 'c090e202-e4ec-4854-90e2-19bb300c07eb', 2005, 381, 'Twelve-year-old Percy Jackson is on the most dangerous quest of his life.  With the help of a satyr and a daughter of Athena, Percy must journey across the United States to catch a thief who has stolen the original weapon of mass destruction—Zeus’ master bolt.  Along the way, he must face a host of mythological enemies determined to stop him.  Most of all, he must come to terms with a father he has never known, and an Oracle that has warned him of betrayal by a friend.', '2026-03-07 11:11:30.324', 'https://covers.openlibrary.org/b/id/7239831-L.jpg', 'https://covers.openlibrary.org/b/id/7239831-M.jpg', true, NULL, 2024, 'Carlsen Verlag Gmbh', NULL, '2026-03-07 11:11:30.324', NULL, '/works/OL492658W');
INSERT INTO public."Book" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'To Kill a Mockingbird', '3c4d1d6d-54c6-44bc-9b60-262e9bdf0a58', 1960, 358, 'One of the best-loved stories of all time, To Kill a Mockingbird has been translated into more than 40 languages, sold more than 30 million copies worldwide, served as the basis for an enormously popular motion picture, and voted one of the best novels of the 20th century by librarians across the United States. A gripping, heart-wrenching, and wholly remarkable tale of coming-of-age in a South poisoned by virulent prejudice, it views a world of great beauty and savage inequities through the eyes of a young girl, as her father -- a crusading local lawyer -- risks everything to defend a black man unjustly accused of a terrible crime.

Lawyer Atticus Finch defends Tom Robinson -- a black man charged with the rape of a white girl. Writing through the young eyes of Finch''s children Scout and Jem, Harper Lee explores with rich humor and unswerving honesty the irrationality of adult attitudes toward race and class in small-town Alabama during the mid-1930s Depression years. The conscience of a town steeped in prejudice, violence, and hypocrisy is pricked by the stamina and quiet heroism of one man''s struggle for justice. But the weight of history will only tolerate so much.


----------
Also contained in:

 - [Best Sellers from Reader''s Digest Condensed Books](https://openlibrary.org/works/OL16035425W)', '2026-03-07 11:11:33.145', 'https://covers.openlibrary.org/b/id/14351077-L.jpg', 'https://covers.openlibrary.org/b/id/14351077-M.jpg', true, NULL, 2022, 'Perma-Bound', NULL, '2026-03-07 11:11:33.145', NULL, '/works/OL3140822W');
INSERT INTO public."Book" VALUES ('b7bafc65-c34e-4ea2-9c46-7409635fdc85', 'A Good Girl''s Guide to Murder', '9cadb009-c573-4e66-9763-452caa4fdfaa', 2019, 439, 'Everyone is talking about A Good Girl''s Guide to Murder! With shades of Serial and Making a Murderer this is the story about an investigation turned obsession, full of twists and turns and with an ending you''ll never expect.

Everyone in Fairview knows the story.

Pretty and popular high school senior Andie Bell was murdered by her boyfriend, Sal Singh, who then killed himself. It was all anyone could talk about. And five years later, Pip sees how the tragedy still haunts her town.

But she can''t shake the feeling that there was more to what happened that day. She knew Sal when she was a child, and he was always so kind to her. How could he possibly have been a killer?

Now a senior herself, Pip decides to reexamine the closed case for her final project, at first just to cast doubt on the original investigation. But soon she discovers a trail of dark secrets that might actually prove Sal innocent . . . and the line between past and present begins to blur. Someone in Fairview doesn''t want Pip digging around for answers, and now her own life might be in danger.', '2026-03-07 11:11:36.116', 'https://covers.openlibrary.org/b/id/13156188-L.jpg', 'https://covers.openlibrary.org/b/id/13156188-M.jpg', true, NULL, 2025, 'Delacorte Press', NULL, '2026-03-07 11:11:36.116', NULL, '/works/OL20646061W');
INSERT INTO public."Book" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', 'Twisted Lies', 'aa73ae39-9cd7-44df-b9fe-1e8d533310f7', 2022, 589, 'He''ll do anything to have her...including lie.

Charming, deadly, and smart enough to hide it, Christian Harper is a monster dressed in the perfectly tailored suits of a gentleman.

He has little use for morals and even less use for love, but he can’t deny the strange pull he feels toward the woman living just one floor below him.

She’s the object of his darkest desires, the only puzzle he can’t solve. And when the opportunity to get closer to her arises, he breaks his own rules to offer her a deal she can’t refuse.

Every monster has their weakness. She’s his.

His obsession.

His addiction.

His only exception.

---

Sweet, shy, and introverted despite her social media fame, Stella Alonso is a romantic who keeps her heart in a cage.

Between her two jobs, she has little time or desire for a relationship.

But when a threat from her past drives her into the arms—and house—of the most dangerous man she’s ever met, she’s tempted to let herself feel something for the first time in a long time.

Because despite Christian’s cold nature, he makes her feel everything when she’s with him.

Passionate.

Protected.

Truly wanted.

Theirs is a love twisted with secrets and tainted by lies…and when the truths are finally revealed, they could shatter everything.

Twisted Lies is a steamy fake dating romance. It''s the fourth and final book in the Twisted series but can be read as a standalone.

Warning: The story contains explicit content, violence, profanity, and topics that may be sensitive to some readers. Please see inside the book for a detailed list. Recommended for 18+.', '2026-03-07 11:11:38.605', 'https://covers.openlibrary.org/b/id/14425197-L.jpg', 'https://covers.openlibrary.org/b/id/14425197-M.jpg', true, NULL, 2024, 'Bloom Books', NULL, '2026-03-07 11:11:38.605', NULL, '/works/OL27818823W');
INSERT INTO public."Book" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'Twilight', 'ec0eb3a3-2fdb-4a9d-a978-15e57cf363d0', 2005, 421, 'About three things I was absolutely positive. First, Edward was a vampire. Second, there was a part of him -- and I didn''t know how dominant that part might be -- that thirsted for my blood. And third, I was unconditionally and irrevocably in love with him. When Isabella Swan moves to the gloomy town of Forks and meets the mysterious, alluring Edward Cullen, her life takes a thrilling and terrifying turn. With his porcelain skin, golden eyes, mesmerizing voice, and supernatural gifts, Edward is both irresistible and impenetrable. Up until now, he has managed to keep his true identity hidden, but Bella is determined to uncover his dark secret. What Bella doesn''t realize is the closer she gets to him, the more she is putting herself and those around her at risk. And, it might be too late to turn back. Deeply seductive and extraordinarily suspenseful, Twilight will have listeners riveted right until the end. -- Container.

Bella Swan and Edward Cullen, a pair of star-crossed lovers whose forbidden relationship ripens against the backdrop of small-town suspicion and a mysterious coven of vampires.', '2026-03-07 11:11:41.389', 'https://covers.openlibrary.org/b/id/12641977-L.jpg', 'https://covers.openlibrary.org/b/id/12641977-M.jpg', true, NULL, 2015, 'Yen Press LLC', NULL, '2026-03-07 11:11:41.389', NULL, '/works/OL5720023W');
INSERT INTO public."Book" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', 'The Cruel Prince', '8e09fc0d-0e66-4f6b-bd11-480dbae919e2', 2018, 414, '**GUARD YOUR MORTAL HEART.**

JUDE WAS SEVEN WHEN HER PARENTS were murdered and she and her two sisters were stolen away to live in the treacherous High Court of Faerie. Ten years later, Jude wants nothing more than to belong there, despite her mortality. But many of the fey despise humans. Especially Prince Cardan, the youngest and wickedest son of the High King.

To win a place at the Court, she must defy him--and face the consequences.

As Jude becomes more deeply embroiled in palace intrigues and deceptions, she discovers her own capacity for tricker and bloodshed. But as betrayal threatens to drown the Courts of Faerie in violence, Jude will need to risk her life in a dangerous alliance to save her sisters, and Faerie itself.

From #1 *New York Times* bestselling author Holly Black comes the first book in a stunning new trilogy filled with twists and enchantment, as one girl learns the meaning of true power when she finds herself caught in a web of royal faerie intrigue.

This description comes from the publisher. *The Cruel Prince* is the first book of the Folk of the Air trilogy.', '2026-03-07 11:11:46.731', 'https://covers.openlibrary.org/b/id/8361789-L.jpg', 'https://covers.openlibrary.org/b/id/8361789-M.jpg', true, NULL, 2023, 'Boekerij', NULL, '2026-03-07 11:11:46.731', NULL, '/works/OL17850410W');
INSERT INTO public."Book" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'Sapiens', '8664e246-9277-409b-906d-19ad87b76b92', 2011, 373, 'From a renowned historian comes a groundbreaking narrative of humanity’s creation and evolution—a #1 international bestseller—that explores the ways in which biology and history have defined us and enhanced our understanding of what it means to be “human.”

One hundred thousand years ago, at least six different species of humans inhabited Earth. Yet today there is only one—homo sapiens. What happened to the others? And what may happen to us?

Most books about the history of humanity pursue either a historical or a biological approach, but Dr. Yuval Noah Harari breaks the mold with this highly original book that begins about 70,000 years ago with the appearance of modern cognition. From examining the role evolving humans have played in the global ecosystem to charting the rise of empires, Sapiens integrates history and science to reconsider accepted narratives, connect past developments with contemporary concerns, and examine specific events within the context of larger ideas.

Dr. Harari also compels us to look ahead, because over the last few decades humans have begun to bend laws of natural selection that have governed life for the past four billion years. We are acquiring the ability to design not only the world around us, but also ourselves. Where is this leading us, and what do we want to become?

Featuring 27 photographs, 6 maps, and 25 illustrations/diagrams, this provocative and insightful work is sure to spark debate and is essential reading for aficionados of Jared Diamond, James Gleick, Matt Ridley, Robert Wright, and Sharon Moalem.', '2026-03-07 11:11:49.488', 'https://covers.openlibrary.org/b/id/8634250-L.jpg', 'https://covers.openlibrary.org/b/id/8634250-M.jpg', true, NULL, 2098, 'Debolsillo', NULL, '2026-03-07 11:11:49.488', NULL, '/works/OL17075811W');
INSERT INTO public."Book" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'The Art of War', 'cc2b4fab-4453-423e-acff-028741435a31', 1900, 79, 'The Art of War is an ancient Chinese military treatise dating from the Late Spring and Autumn Period. The work, which is attributed to the ancient Chinese military strategist Sun Tzu', '2026-03-07 11:11:52.276', 'https://covers.openlibrary.org/b/id/4849549-L.jpg', 'https://covers.openlibrary.org/b/id/4849549-M.jpg', true, NULL, 2023, 'Marcador Editora', NULL, '2026-03-07 11:11:52.276', NULL, '/works/OL244537W');
INSERT INTO public."Book" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', 'Twisted Games', 'aa73ae39-9cd7-44df-b9fe-1e8d533310f7', 2021, 474, 'She can never be his…but he’s taking her anyway.

Stoic, broody, and arrogant, elite bodyguard Rhys Larsen has two rules: 1) Protect his clients at all costs 2) Do not become emotionally involved. Ever.

He has never once been tempted to break those rules…until her.

Bridget von Ascheberg. A princess with a stubborn streak that matches his own and a hidden fire that reduces his rules to ash. She’s nothing he expected and everything he never knew he needed.

Day by day, inch by inch, she breaks down his defenses until he’s faced with a truth he can no longer deny: he swore an oath to protect her, but all he wants is to ruin her. Take her.

Because she’s his.

His princess.

His forbidden fruit.

His every depraved fantasy.

***

Regal, strong-willed, and bound by the chains of duty, Princess Bridget dreams of the freedom to live and love as she chooses.

But when her brother abdicates, she’s suddenly faced with the prospect of a loveless, politically expedient marriage and a throne she never wanted.

And as she navigates the intricacies—and treacheries—of her new role, she must also hide her desire for a man she can’t have.

Her bodyguard.

Her protector.

Her ultimate ruin.


Unexpected and forbidden, theirs is a love that could destroy a kingdom…and doom them both.


Twisted Games is a contemporary royal bodyguard romance. It’s book two of the Twisted series but can be read as a standalone.

Warning: This book contains a possessive hero, explicit content, and profanity.', '2026-03-07 11:11:55.02', 'https://covers.openlibrary.org/b/id/12821465-L.jpg', 'https://covers.openlibrary.org/b/id/12821465-M.jpg', true, NULL, 2024, 'Bloom Books, Incorporated', NULL, '2026-03-07 11:11:55.02', NULL, '/works/OL25515697W');
INSERT INTO public."Book" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', 'The Silent Patient', '16672eba-ab5c-4fc5-a5ee-b403756b152f', 2018, 346, 'Alicia Berenson’s life is seemingly perfect. One evening her husband Gabriel returns home late from a fashion shoot, and Alicia shoots him five times in the face, and then never speaks another word. Alicia’s refusal to talk, or give any kind of explanation, turns a domestic tragedy into something far grander, a mystery that captures the public imagination and casts Alicia into notoriety. The price of her art skyrockets, and she, the silent patient, is hidden away from the tabloids and spotlight at the Grove, a secure forensic unit in North London. Theo Faber is a criminal psychotherapist who has waited a long time for the opportunity to work with Alicia. His determination to get her to talk and unravel the mystery of why she shot her husband takes him down a twisting path into his own motivations–a search for the truth that threatens to consume him.', '2026-03-07 11:11:57.802', 'https://covers.openlibrary.org/b/id/9407338-L.jpg', 'https://covers.openlibrary.org/b/id/9407338-M.jpg', true, NULL, 2023, 'Droemer eBook', NULL, '2026-03-07 11:11:57.802', NULL, '/works/OL19096402W');
INSERT INTO public."Book" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', 'Hunting Adeline', '8af4ae5f-2ea3-4ddf-84c7-74d0aef21e27', 2021, 651, 'The final installment to the Cat and Mouse Duet...

The Diamond:

Death walks alongside me, But the reaper is no match for me. I''m trapped in a world full of monsters dressed as men, and those who aren''t as they seem.
They won''t keep me forever.
I no longer recognize the person I''ve become, And I''m fighting to find my way back to the beast who hunts me in the night. They call me a diamond, But they''ve only created an angel of death.

The Hunter:

I was born a predator, With ruthlessness ingrained in my bones. When what''s mine is stolen from me in the night, Like a diamond hidden within a fortress,
I find that I can no longer contain the beast. Blood will paint the ground as I tear apart this world to find her. And bring her back to where she belongs. No one will escape my wrath, Especially not those who have betrayed me.', '2026-03-07 11:12:39.295', 'https://covers.openlibrary.org/b/id/14614757-L.jpg', 'https://covers.openlibrary.org/b/id/14614757-M.jpg', true, NULL, 2025, 'Zando', NULL, '2026-03-07 11:12:39.295', NULL, '/works/OL27297240W');
INSERT INTO public."Book" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', 'The Seven Husbands of Evelyn Hugo', 'dc6c3380-e99b-441e-9985-d21d6d877100', 2017, 354, 'Aging and reclusive Hollywood movie icon Evelyn Hugo is finally ready to tell the truth about her glamorous and scandalous life. But when she chooses unknown magazine reporter Monique Grant for the job, no one is more astounded than Monique herself. Why her? Why now?

Monique is not exactly on top of the world. Her husband has left her, and her professional life is going nowhere. Regardless of why Evelyn has selected her to write her biography, Monique is determined to use this opportunity to jumpstart her career.

Summoned to Evelyn''s luxurious apartment, Monique listens in fascination as the actress tells her story. From making her way to Los Angeles in the 1950s to her decision to leave show business in the ''80s, and, of course, the seven husbands along the way, Evelyn unspools a tale of ruthless ambition, unexpected friendship, and a great forbidden love. Monique begins to feel a very real connection to the legendary star, but as Evelyn''s story near its conclusion, it becomes clear that her life intersects with Monique''s own in tragic and irreversible ways.

Written with Reid''s signature talent for creating "complex, likable characters" (Real Simple), this is a mesmerizing journey through the splendor of old Hollywood into the harsh realities of the present day as two women struggle with what it means—and what it costs—to face the truth', '2026-03-07 11:12:00.569', 'https://covers.openlibrary.org/b/id/8354226-L.jpg', 'https://covers.openlibrary.org/b/id/8354226-M.jpg', true, NULL, 2024, 'Ambo|Anthos', NULL, '2026-03-07 11:12:00.569', NULL, '/works/OL18203673W');
INSERT INTO public."Book" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'Harry Potter and the Deathly Hallows', '39a4afc7-f7a6-4d14-900f-b777748b6e88', 2007, 731, 'Harry Potter is leaving Privet Drive for the last time. But as he climbs into the sidecar of Hagrid’s motorbike and they take to the skies, he knows Lord Voldemort and the Death Eaters will not be far behind.

The protective charm that has kept him safe until now is broken. But the Dark Lord is breathing fear into everything he loves. And he knows he can’t keep hiding.

To stop Voldemort, Harry knows he must find the remaining Horcruxes and destroy them.

He will have to face his enemy in one final battle.

([source][1])


----------
See also:

 - [Harry Potter and the Deathly Hallows: 2/2][2]


  [1]: https://www.jkrowling.com/book/harry-potter-deathly-hallows/
  [2]: https://openlibrary.org/works/OL17922343W/Harry_Potter_and_the_Deathly_Hallows_Chapters_20-36', '2026-03-07 11:12:03.099', 'https://covers.openlibrary.org/b/id/15158660-L.jpg', 'https://covers.openlibrary.org/b/id/15158660-M.jpg', true, NULL, 2023, 'Media Rodzina', NULL, '2026-03-07 11:12:03.099', NULL, '/works/OL82586W');
INSERT INTO public."Book" VALUES ('d1275694-5dbb-4a90-9a93-649fc1c8a0f9', 'Verity', '8ccc1848-b5f3-40bd-b538-af841fe39a01', 2018, 327, 'Lowen Ashleigh is a struggling writer on the brink of financial ruin when she accepts the job offer of a lifetime. Jeremy Crawford, husband of bestselling author Verity Crawford, has hired Lowen to complete the remaining books in a successful series his injured wife is unable to finish.
 
Lowen arrives at the Crawford home, ready to sort through years of Verity’s notes and outlines, hoping to find enough material to get her started. What Lowen doesn’t expect to uncover in the chaotic office is an unfinished autobiography Verity never intended for anyone to read. Page after page of bone-chilling admissions, including Verity''s recollection of the night her family was forever altered.
 
Lowen decides to keep the manuscript hidden from Jeremy, knowing its contents could devastate the already grieving father. But as Lowen’s feelings for Jeremy begin to intensify, she recognizes all the ways she could benefit if he were to read his wife’s words. After all, no matter how devoted Jeremy is to his injured wife, a truth this horrifying would make it impossible for him to continue loving her.', '2026-03-07 11:12:06.015', 'https://covers.openlibrary.org/b/id/8747160-L.jpg', 'https://covers.openlibrary.org/b/id/8747160-M.jpg', true, NULL, 2023, 'Hugo Poche', NULL, '2026-03-07 11:12:06.015', NULL, '/works/OL20068530W');
INSERT INTO public."Book" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', 'Red, White & Royal Blue', '77873e49-18e0-4d88-9178-194e1acedf49', 2019, 452, '**What happens when America''s First Son falls in love with the Prince of Wales?**

When his mother became President of the United States, Alex Claremont-Diaz was promptly cast as the American equivalent of a young royal. Handsome, charismatic, genius--his image is pure millennial-marketing gold for the White House. There''s only one problem: Alex has a beef with an actual prince, Henry, across the pond. And when the tabloids get hold of a photo involving an Alex/Henry altercation, U.S./British relations take a turn for the worse.

Heads of family and state and other handlers devise a plan for damage control: Stage a truce between the two rivals. What at first begins as a fake, Instagrammable friendship grows deeper, and more dangerous, than either Alex or Henry could have imagined. Soon Alex finds himself hurtling into a secret romance with a surprisingly unstuffy Henry that could derail the presidential campaign and upend two nations. It raises the question: Can love save the world after all? Where do we find the courage, and the power, to be the people we are meant to be? And how can we learn to let our true colors shine through?

This description comes from the publisher.', '2026-03-07 11:12:08.767', 'https://covers.openlibrary.org/b/id/9171544-L.jpg', 'https://covers.openlibrary.org/b/id/9171544-M.jpg', true, NULL, 2023, 'SEGUINTE', NULL, '2026-03-07 11:12:08.767', NULL, '/works/OL20090688W');
INSERT INTO public."Book" VALUES ('86f55ad0-c48c-4be7-aac1-a4162ae7aeff', '人間失格', '19f5a874-789e-4356-8b3e-dab40a26f720', 1948, 215, 'Osamu Dazai''s No Longer Human, this leading postwar Japanese writer''s second novel, tells the poignant and fascinating story of a young man who is caught between the breakup of the traditions of a northern Japanese aristocratic family and the impact of Western ideas. In consequence, he feels himself "disqualified from being human" (a literal translation of the Japanese title). Donald Keene, who translated this and Dazai''s first novel, The Setting Sun, has said of the author''s work: "His world . . . suggests Chekhov or possibly postwar France, . . . but there is a Japanese sensibility in the choice and presentation of the material. A Dazai novel is at once immediately intelligible in Western terms and quite unlike any Western book." His writing is in some ways reminiscent of Rimbaud, while he himself has often been called a forerunner of Yukio Mishima.', '2026-03-07 11:12:14.068', 'https://covers.openlibrary.org/b/id/13190147-L.jpg', 'https://covers.openlibrary.org/b/id/13190147-M.jpg', true, NULL, 2025, 'Anaconda', NULL, '2026-03-07 11:12:14.068', NULL, '/works/OL3923952W');
INSERT INTO public."Book" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', 'Twisted Hate', 'aa73ae39-9cd7-44df-b9fe-1e8d533310f7', 2022, 576, 'He hates her...almost as much as he wants her.

Gorgeous, cocky, and fast on his way to becoming a hotshot doctor, Josh Chen has never met a woman he couldn’t charm—except for Jules f**king Ambrose.

The beautiful redhead has been a thorn in his side since they met, but she also consumes his thoughts in a way no woman ever has.

When their animosity explodes into one unforgettable night, he proposes a solution that’ll get her out of his system once and for all: an enemies with benefits arrangement with simple rules.

No jealousy.

No strings attached.

And absolutely no falling in love.

**

Outgoing and ambitious, Jules Ambrose is a former party girl who’s focused on one thing: passing the attorney’s bar exam.

The last thing she needs is to get involved with a doctor who puts the SUFFER in insufferable…no matter how good-looking he is.

But the more she gets to know him, the more she realizes there’s more than meets the eye to the man she’s hated for so long.

Her best friend’s brother.

Her nemesis.

And her only salvation.

Theirs is a match made in hell, and when the demons from their past catch up with them, they’re faced with truths that could either save them …or destroy everything they’ve worked for.

Twisted Hate is a steamy enemies with benefits/enemies to lovers romance. It''s book three in the Twisted series but can be read as a standalone.

Warning: The story contains explicit content, mild violence, profanity, and topics that may be sensitive to some readers. Detailed list linked inside the book. Recommended for 18+.', '2026-03-07 11:12:16.596', 'https://covers.openlibrary.org/b/id/12928487-L.jpg', 'https://covers.openlibrary.org/b/id/12928487-M.jpg', true, NULL, 2024, 'Sourcebooks, Incorporated', NULL, '2026-03-07 11:12:16.596', NULL, '/works/OL27245843W');
INSERT INTO public."Book" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', 'The Summer I Turned Pretty', '6f516a5a-3924-44cf-bbd5-7d94089913a7', 2000, 275, 'This book is fresh fun and exciting. 15 year Belly Conklin is enjoying another summer with the people that she loves in Cousins, a place she''s been going to since she was a baby! The fishers, Aka Jerimiah and Conrad, are finally grown up, and Belly feels like she can fit in aswell. Belly would be turning 16 this year, as now she feels as if she can fit in with the boys. She thinks the summer will be fun, Hanging out on the beach and Playing with the people she loves, Belly is looking foward to her summer vacation. But that''s when she finds out that Susannah Fisher is diagnosed with Cancer, which changes everything. Things are different in the Summer house. Her first love, Conrad is different, he''s distant. While the stay in the house was supposed to be enjoying, they need to focus on things that matter the most. Sussanah. Belly decides that it''s time she acts like the adult that she is. Choosing between her 2 lovers Jerimiah and Conrad Fisher. Will either of them like her? Because this...Is the Summer I turned Pretty.', '2026-03-07 11:12:19.417', 'https://covers.openlibrary.org/b/id/8783502-L.jpg', 'https://covers.openlibrary.org/b/id/8783502-M.jpg', true, NULL, 2024, 'כנרת', NULL, '2026-03-07 11:12:19.417', NULL, '/works/OL5819962W');
INSERT INTO public."Book" VALUES ('14728228-cbb8-48d8-9f59-109402188de6', 'We Were Never Meant To Be', '5bca985c-3483-45b8-9088-b2fabc9bf997', 2025, NULL, 'No description available.', '2026-03-07 11:12:22.141', 'https://covers.openlibrary.org/b/id/15024571-L.jpg', 'https://covers.openlibrary.org/b/id/15024571-M.jpg', true, NULL, 2025, 'Notion Press', NULL, '2026-03-07 11:12:22.141', NULL, '/works/OL43113687W');
INSERT INTO public."Book" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'The Hobbit', '7cfc5984-5170-4e61-b920-20e930ff6aef', 1937, 360, 'The Hobbit is a tale of high adventure, undertaken by a company of dwarves in search of dragon-guarded gold. A reluctant partner in this perilous quest is Bilbo Baggins, a comfort-loving unambitious hobbit, who surprises even himself by his resourcefulness and skill as a burglar.

Encounters with trolls, goblins, dwarves, elves, and giant spiders, conversations with the dragon, Smaug, and a rather unwilling presence at the Battle of Five Armies are just some of the adventures that befall Bilbo.

Bilbo Baggins has taken his place among the ranks of the immortals of children’s fiction. Written by Professor Tolkien for his children, The Hobbit met with instant critical acclaim when published.', '2026-03-07 11:12:27.676', 'https://covers.openlibrary.org/b/id/14627509-L.jpg', 'https://covers.openlibrary.org/b/id/14627509-M.jpg', true, NULL, 2024, 'Uitgeverij Meulenhoff', NULL, '2026-03-07 11:12:27.676', NULL, '/works/OL27482W');
INSERT INTO public."Book" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'A Court of Thorns and Roses', '8c00d0a4-fd96-4d3c-8a2d-b063d3817771', 2013, 438, 'When nineteen-year-old huntress Feyre kills a wolf in the woods, a terrifying creature arrives to demand retribution. Dragged to a treacherous magical land she knows about only from legends, Feyre discovers that her captor is not truly a beast, but one of the lethal, immortal faeries who once ruled her world.

At least, he''s not a beast all the time.

As she adapts to her new home, her feelings for the faerie, Tamlin, transform from icy hostility into a fiery passion that burns through every lie she''s been told about the beautiful, dangerous world of the Fae. But something is not right in the faerie lands. An ancient, wicked shadow is growing, and Feyre must find a way to stop it, or doom Tamlin-and his world-forever.', '2026-03-07 11:12:30.493', 'https://covers.openlibrary.org/b/id/8738585-L.jpg', 'https://covers.openlibrary.org/b/id/8738585-M.jpg', true, NULL, 2025, 'Recorded Books', NULL, '2026-03-07 11:12:30.493', NULL, '/works/OL17352669W');
INSERT INTO public."Book" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'A Little Life', '068bb746-d566-4eba-9a97-91ab8f10e42f', 2015, 805, 'A Little Life is a 2015 novel by American novelist Hanya Yanagihara. The novel was written over the course of eighteen months. Despite the length and difficult subject matter, it became a bestseller.', '2026-03-07 11:12:33.411', 'https://covers.openlibrary.org/b/id/12065783-L.jpg', 'https://covers.openlibrary.org/b/id/12065783-M.jpg', true, NULL, 2022, 'Lumen', NULL, '2026-03-07 11:12:33.411', NULL, '/works/OL17370186W');
INSERT INTO public."Book" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'The Fault in Our Stars', '33c6a688-eeb5-4000-a3ab-3d228b594413', 2010, 309, 'Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel''s story is about to be completely rewritten.
([source][1])


  [1]: http://www.johngreenbooks.com/the-fault-in-our-stars', '2026-03-07 11:12:36.424', 'https://covers.openlibrary.org/b/id/7418786-L.jpg', 'https://covers.openlibrary.org/b/id/7418786-M.jpg', true, NULL, 2021, 'Penguin', NULL, '2026-03-07 11:12:36.424', NULL, '/works/OL16444438W');
INSERT INTO public."Book" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'Harry Potter and the Order of the Phoenix', '39a4afc7-f7a6-4d14-900f-b777748b6e88', 2003, 556, 'After the Dementors’ attack on his cousin Dudley, Harry knows he is about to become Voldemort’s next target.

Although many are denying the Dark Lord’s return, Harry is not alone, and a secret order is gathering at Grimmauld Place to fight against the Dark forces.

Meanwhile, Voldemort’s savage assaults on Harry’s mind are growing stronger every day.

He must allow Professor Snape to teach him to protect himself before he runs out of time.
([source][1])


----------
This work has also been published in multiple volumes. See:

 - [Harry Potter and the Order of the Phoenix: III](https://openlibrary.org/works/OL17937113W/Harry_Potter_and_the_Order_of_the_Phoenix_Chapters_17-23)
 - [Harry Potter and the Order of the Phoenix: IV](https://openlibrary.org/works/OL17915213W/Harry_Potter_and_the_Order_of_the_Phoenix_Chapters_24-30)

  [1]: https://www.jkrowling.com/book/harry-potter-order-phoenix/', '2026-03-07 11:12:41.937', 'https://covers.openlibrary.org/b/id/15158666-L.jpg', 'https://covers.openlibrary.org/b/id/15158666-M.jpg', true, NULL, 2019, 'salamandra', NULL, '2026-03-07 11:12:41.937', NULL, '/works/OL82548W');
INSERT INTO public."Book" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'Animal Farm', 'b313c939-5b06-4f54-a52a-c6e2e1b8968d', 1945, 116, 'Animal Farm is a brilliant political satire and a powerful and affecting story of revolutions and idealism, power and corruption. ''All animals are equal. But some animals are more equal than others.'' Mr Jones of Manor Farm is so lazy and drunken that one day he forgets to feed his livestock. The ensuing rebellion under the leadership of the pigs Napoleon and Snowball leads to the animals taking over the farm. Vowing to eliminate the terrible inequities of the farmyard, the renamed Animal Farm is organised to benefit all who walk on four legs. But as time passes, the ideals of the rebellion are corrupted, then forgotten. And something new and unexpected emerges..', '2026-03-07 11:12:44.937', 'https://covers.openlibrary.org/b/id/11261770-L.jpg', 'https://covers.openlibrary.org/b/id/11261770-M.jpg', true, NULL, 2025, 'Penguin Random House', NULL, '2026-03-07 11:12:44.937', NULL, '/works/OL1168007W');
INSERT INTO public."Book" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'Le petit prince', '16c3afe6-6b36-408f-baa0-5b31681f4fe0', 1943, 88, '*Le Petit Prince* est une œuvre de langue française, la plus connue d''Antoine de Saint-Exupéry. Publié en 1943 à New York simultanément à sa traduction anglaise, c''est une œuvre poétique et philosophique sous l''apparence d''un conte pour enfants.

Traduit en quatre cent cinquante-sept langues et dialectes, *Le Petit Prince* est le deuxième ouvrage le plus traduit au monde après la Bible.

Le langage, simple et dépouillé, parce qu''il est destiné à être compris par des enfants, est en réalité pour le narrateur le véhicule privilégié d''une conception symbolique de la vie. Chaque chapitre relate une rencontre du petit prince qui laisse celui-ci perplexe, par rapport aux comportements absurdes des « grandes personnes ». Ces différentes rencontres peuvent être lues comme une allégorie.

Les aquarelles font partie du texte et participent à cette pureté du langage : dépouillement et profondeur sont les qualités maîtresses de l''œuvre.

On peut y lire une invitation de l''auteur à retrouver l''enfant en soi, car « toutes les grandes personnes ont d''abord été des enfants. (Mais peu d''entre elles s''en souviennent.) ». L''ouvrage est dédié à Léon Werth, mais « quand il était petit garçon ».

(Wikipedia)', '2026-03-07 11:12:47.72', 'https://covers.openlibrary.org/b/id/10708272-L.jpg', 'https://covers.openlibrary.org/b/id/10708272-M.jpg', true, NULL, 2025, 'Nova Leitura', NULL, '2026-03-07 11:12:47.72', NULL, '/works/OL10263W');
INSERT INTO public."Book" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'Fahrenheit 451', '7e65eff1-e2f5-4238-bf1d-1715f7154d76', 1953, 211, 'Fahrenheit 451 is a 1953 dystopian novel by American writer Ray Bradbury. Often regarded as one of his best works, the novel presents a future American society where books are outlawed and "firemen" burn any that are found. The book''s tagline explains the title as "''the temperature at which book paper catches fire, and burns": the autoignition temperature of paper. The lead character, Guy Montag, is a fireman who becomes disillusioned with his role of censoring literature and destroying knowledge, eventually quitting his job and committing himself to the preservation of literary and cultural writings.

The novel has been the subject of interpretations focusing on the historical role of book burning in suppressing dissenting ideas for change. In a 1956 radio interview, Bradbury said that he wrote Fahrenheit 451 because of his concerns at the time (during the McCarthy era) about the threat of book burning in the United States. In later years, he described the book as a commentary on how mass media reduces interest in reading literature.

In 1954, Fahrenheit 451 won the American Academy of Arts and Letters Award in Literature and the Commonwealth Club of California Gold Medal. It later won the Prometheus "Hall of Fame" Award in 1984 and a "Retro" Hugo Award, one of a limited number of Best Novel Retro Hugos ever given, in 2004. Bradbury was honored with a Spoken Word Grammy nomination for his 1976 audiobook version.


----------
Also contained in:

 - [451° по Фаренгейту: Рассказы](https://openlibrary.org/works/OL17811384W/Fahrenheit_451_stories)
 - [451° по Фаренгейту: повести и рассказы](https://openlibrary.org/works/OL27741633W)
 - [Works](https://openlibrary.org/works/OL28185143W)', '2026-03-07 11:12:50.577', 'https://covers.openlibrary.org/b/id/12993656-L.jpg', 'https://covers.openlibrary.org/b/id/12993656-M.jpg', true, NULL, 2021, 'Corgi Books', NULL, '2026-03-07 11:12:50.577', NULL, '/works/OL103123W');
INSERT INTO public."Book" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'Charlotte''s Web', '66974af1-0788-4a9a-89bd-d447a10ca35a', 1952, 189, 'Charlotte''s Web is a book of children''s literature by American author E. B. White and illustrated by Garth Williams; it was published on October 15, 1952, by Harper & Brothers. The novel tells the story of a livestock pig named Wilbur and his friendship with a barn spider named Charlotte. When Wilbur is in danger of being slaughtered by the farmer, Charlotte writes messages praising Wilbur (such as "Some Pig") in her web in order to persuade the farmer to let him live.


----------
Also contained in:
[Novels](https://openlibrary.org/works/OL483326W)', '2026-03-07 11:12:53.575', 'https://covers.openlibrary.org/b/id/8461797-L.jpg', 'https://covers.openlibrary.org/b/id/8461797-M.jpg', true, NULL, 2017, 'Turtleback Books', NULL, '2026-03-07 11:12:53.575', NULL, '/works/OL483391W');
INSERT INTO public."Book" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', 'The Song of Achilles', '9c105044-9faf-412d-9c9d-ee8ee3c98c86', 2011, 381, 'This is the story of the seige of Troy from the perspective of Achilles best-friend Patroclus.  Although Patroclus is outcast from his home for disappointing his father he manages to be the only mortal who can keep up with the half-God Archilles.  Even though many will know the facts behind the story the telling is fresh and engaging.', '2026-03-07 11:12:56.454', 'https://covers.openlibrary.org/b/id/7098465-L.jpg', 'https://covers.openlibrary.org/b/id/7098465-M.jpg', true, NULL, 2024, 'Bloomsbury Publishing', NULL, '2026-03-07 11:12:56.454', NULL, '/works/OL16509148W');


--
-- TOC entry 3489 (class 0 OID 17218)
-- Dependencies: 222
-- Data for Name: BookGenres; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."BookGenres" VALUES ('99251f46-c7d2-4392-b160-20340b8e5602', 'fc6484a8-1ce7-4c84-b425-b08aeaf3d9f8');
INSERT INTO public."BookGenres" VALUES ('99251f46-c7d2-4392-b160-20340b8e5602', '06836d6b-5ab5-422d-9fe6-16dc705c3f0d');
INSERT INTO public."BookGenres" VALUES ('99251f46-c7d2-4392-b160-20340b8e5602', 'd5f123ea-79d2-4e1a-849a-49b6b798a0ba');
INSERT INTO public."BookGenres" VALUES ('99251f46-c7d2-4392-b160-20340b8e5602', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('99251f46-c7d2-4392-b160-20340b8e5602', '9440094a-585d-4c5b-b9b6-2e874bff6d82');
INSERT INTO public."BookGenres" VALUES ('99251f46-c7d2-4392-b160-20340b8e5602', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('99251f46-c7d2-4392-b160-20340b8e5602', '7eb34720-9c9b-4890-8aae-8193cd7b9df8');
INSERT INTO public."BookGenres" VALUES ('99251f46-c7d2-4392-b160-20340b8e5602', '5d8f0471-b068-4f38-8d78-de0aeb463a6b');
INSERT INTO public."BookGenres" VALUES ('99251f46-c7d2-4392-b160-20340b8e5602', '728088fb-487a-43b0-80eb-dab6a900ee9f');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '4c0b845c-e935-469d-aa77-f7fef4faf4b0');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'f658f553-0dbc-43af-83f7-90602972f968');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '25fefa33-431c-45b3-b2a4-c3e1044d480c');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '9bd952ce-1cee-414b-b127-56a82f73439f');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'aa58a5b3-f2cd-44f8-92d8-7c9bb9e58660');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'fd56af92-cf68-446b-9928-410c8724c208');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'd1f3b191-1adf-4f3f-9ef1-ce8ab465c049');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'e0905665-8ca9-4969-9294-1349097f1820');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '43fd6115-4a88-42de-9c59-e8352c0a8834');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'e3368776-bf60-4e9d-ba92-2ba7e6b3eb7e');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'b78c2c0d-e569-4de2-a872-9ad225873efa');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '657c52e4-9858-4edd-bbc4-27f6b224df31');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '01f6b1b2-e59a-43d5-a9fc-d8f8db65f7ed');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '41591a59-e547-46eb-b921-ed61948421ac');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '815afae8-9376-4d95-9ac7-2032fb47ade6');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '148242d1-1b4d-4e00-bdd4-4e7a3cd5ea86');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'd69adc92-1c7b-4832-827f-ee4b4b78a5bd');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'd2ef9d9d-2052-49e3-a56c-7fff54c131ee');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '7eebb72d-859e-4d5f-83d2-b884eea3b421');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'b7f817b2-9240-4fee-80d4-e6a18b2a3360');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2f580aac-a64d-4b91-875c-ba28e97910b9');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'ffce3971-9879-46f9-9d2e-a649f7469359');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'b29b8c4a-b040-4b4f-b9a8-653d35f2e6b4');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'b3eba362-0b2d-4620-9367-63a4b443b3c6');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '30fde04a-8b88-4f5e-9f2d-b9795514a897');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '43d7763a-5909-4e7a-9e14-28d7604f42eb');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'aef79423-4dfe-4a1d-a775-3226d0afaac3');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '69d3b08a-af5b-4b44-a311-345ceed2eb28');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'b2bb8458-0f69-46a7-a616-17d09647d462');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'bb18769b-8cf3-4a01-8574-7b93bf44439b');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '56c38139-b36f-46e4-9e30-d16f2c048ae1');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '10bce6ab-d13f-4d92-863c-fb75580d70a3');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '867d82e6-f0b2-45a8-bdb3-8e32a2c0cf03');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '8402ec03-6e22-4e5b-8214-de599036b032');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'a4de4682-5858-46f6-8063-85b961625964');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '71d8b7cc-0a4b-4f88-8272-e011f13fda87');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '9bb8e1a9-35f5-4dd8-b1ab-f5be90cf8b82');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '047489e2-9819-4ba1-ad29-cb95cc19c313');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'f0c96933-9129-4484-a187-885516ab6ca2');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'f23d0032-9c17-4b2e-a7fd-7177298b0ac9');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '888b50b1-1e1e-402e-8b5c-3189114c5742');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '34cfda32-11a6-465c-ba75-1081fcdaac36');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '6d0a0095-ed3f-4c2d-8dd9-1300d745c27e');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '8eec949a-d0e5-4a50-b1d1-c810aa92983b');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '54a37799-8ce7-4f79-8a62-f29adbe12fd4');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'dd7fb395-2457-4832-81f6-cf52a5436205');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'd893496d-e577-4f17-9434-ef9eb9fef921');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'ddab6893-a29d-4a44-b3b1-366f3663045f');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'bd170a59-40cf-4188-9495-2b388c21c5ea');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'd0ade6ac-592a-4b3f-97f3-610538acd455');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '471d1ce1-7475-48d9-943d-15e002c40d60');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'da4bd0be-2061-4663-9567-13507067dd43');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '7e82f27a-4be4-4e81-abbd-7e42b42d2faa');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '54b28dd6-a861-41f5-8995-ce9a909ef159');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '4b783ca4-81a0-433e-a48b-01c9d4332c7a');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'c812b50e-ae99-4ae0-b104-3236dfbd77ee');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'be35d180-f697-442a-a1dc-9d63a4c2297a');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'b084e60b-9dba-42ee-9335-a634a1a2768b');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '3bad707c-e101-47a3-a499-11f5946e015d');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '8bb53c63-bdad-4358-94fa-928f2a2720c8');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '669481e9-1a01-48df-962a-392553430839');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'cfc0cb73-93f6-44e8-9275-4dda3abdbd6a');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '9fa3360f-0be6-48a7-a4bb-18651889ec38');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'cc5004d8-55c4-4234-9ede-5988d8c419c4');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '3a5de281-e71b-43de-872f-593d46cd09d9');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '28abd48c-2cd9-4c8a-8fd2-ec0958c25d61');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '0e146ed2-598e-413e-aef4-5362e2c277b8');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '842e9960-b031-471e-b32b-01b3b6c92744');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '927691cb-44a0-47f8-9fc1-ee487c81eeec');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '8c0bc983-3c59-496f-b97f-ec1c70b53e24');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '0b3caccf-5af7-4fee-990d-9a76b6b2cf2d');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'abd948d3-1c57-4494-a677-261e3d234d79');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'd2bbf30c-5fbe-4d10-9484-e149f7624c17');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'a9229cfe-3d7d-4010-a15a-910d6afc0b7d');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'bb8a7cab-5b6b-482c-bdd4-b39e4665146f');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'cac45cab-08c5-476f-bbe1-2d17ae171846');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '7504bf17-33b7-4d3a-b48b-0eb745b68483');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '30048c4e-ddf6-4bcc-96a1-95ff4b84a805');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '5b94e2ad-8312-4f4b-a9eb-eb52c03532fa');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '4523e9c4-110c-4d90-b0f6-cebd79dcbd64');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2c245a6f-3422-4e9e-b7ea-32f0a83a09bd');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'c001cdff-0bc3-462f-9ecc-30cd9fa4162d');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', '3798f49d-40cb-4498-835c-ee2476443408');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'fb2228eb-9bd4-40ad-b8b3-595a268a6aa3');
INSERT INTO public."BookGenres" VALUES ('2af42d2e-ca83-4519-8725-7bcf5fa69a06', 'cb5191d8-f4eb-4cd1-a77f-2f115f94246f');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '374cc6bf-7956-44fb-9c01-41784ef6f207');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', 'cafd315f-5b09-4686-9e10-4cac719e75be');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '85c8facf-63e8-4bcd-81f3-b71dd99c56e7');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '3480feee-374a-432b-a1c8-9ebcc2a54226');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '4a4b96f4-af7c-49d2-ae3c-b285abb2c161');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', 'de6efc86-7766-4409-b2e0-4402c28b0a25');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '19d64fee-836f-4afb-8a9f-dd30a5b55f7c');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '07514ff2-a0e0-490b-8bba-32a8b6280871');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '59c8d3a8-95d4-4a6a-ae9e-568c5ef70d3b');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '954e0572-0f6e-485e-8ed2-012bbd91254f');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '5b5b9dbc-1ebe-401f-bc51-e9620ceb5b7b');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', 'c9b729dd-7c15-4b29-934a-0ba1ca54d78a');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '86589549-4152-433f-9392-cd0565ee7770');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('548b7c15-2d60-4ded-bc9b-7261432c2e05', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', '06836d6b-5ab5-422d-9fe6-16dc705c3f0d');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', '1986c060-8347-4b45-babf-1072472b29ca');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', '3480feee-374a-432b-a1c8-9ebcc2a54226');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', 'cafd315f-5b09-4686-9e10-4cac719e75be');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', 'c9fc7351-d5e9-4b1c-962f-3fb80da439d9');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', '90d54a22-e049-4661-9bf9-7cbefca80d0d');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', '7528f4f6-61ff-401a-8e58-0d0c610fc584');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', '5ab7eea5-0cf0-4bf4-97ef-2b634d436c87');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', '19d64fee-836f-4afb-8a9f-dd30a5b55f7c');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', 'f725a818-8352-4282-b6d9-f60fd35cac99');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', 'c60243da-9282-4578-8233-0842646ae9cc');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', '5b5b9dbc-1ebe-401f-bc51-e9620ceb5b7b');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('d0b0c6aa-de2f-4024-be19-5634f878b933', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'beaab4ca-195b-427e-9a0c-0ca9d75723b3');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '3c7eacbd-0277-44d0-8ad1-a372e7f3cf45');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'cb39b600-a6ab-4812-ab5a-d7694e326bff');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '094a4763-cb27-45e6-9677-ad000ab493eb');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '727da668-78f8-43a3-a2bf-118ec6c5eb70');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'a17acda0-9dc9-4d01-89aa-bd822c36dc42');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'a426ffb0-25c3-402f-b37a-ce4d6ef2887f');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '7328be2c-402b-41ef-981d-5ed4ffba81e8');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'ba7ecc6f-1159-442f-ad83-0c021065b47b');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '883a0f91-c283-43c3-82f1-12f2e946c65d');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '1f2ad7d8-64fd-464a-89ac-0fbe02565521');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '3ba62da9-e330-434e-b555-c205396d3ae1');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '9f99104e-5bfe-423c-a71b-d02640837fad');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'c6c0e5e7-0e07-41fe-a8be-85d3de434424');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'db0f46cb-8fa6-49af-a500-2f3edec9aa9d');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'ef74851e-ff04-4d79-8208-78e325c3ea1d');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '517c8662-42a7-4dcc-811d-ee29c2cfb750');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '50ad3057-1b22-4962-8bb8-c6e9c2835d3a');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'fd56af92-cf68-446b-9928-410c8724c208');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'c9c031a2-746b-4fff-baa8-26571e3d27eb');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '7504bf17-33b7-4d3a-b48b-0eb745b68483');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '6dfaeed1-dbab-4bfb-b227-0b18e46eaeff');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '1c5682f7-308c-4543-af4c-85cda9c01840');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'd7eeba7b-708b-4167-8f99-99087b555426');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '3687b778-171b-4c7b-8348-dd4665279e7e');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '0d5165d7-3ea1-47e6-9045-7830c68b04d4');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '54fe2705-1234-4961-893c-3302780c96fe');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '258e3563-f449-4cd8-825a-37f5c8ca8c55');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '4c1cbaf7-897b-4799-8727-eb0935529538');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '01d42bc0-fce8-4873-ad63-84d57fece8b9');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '897a3cf2-3aa0-46f5-aabf-bd7e997c3b13');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'ab05a69f-d616-4c5d-89c6-af09aae4ff29');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '548d5e38-fce9-48ef-a40e-274f767b331c');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'df72bf67-faee-4d96-8fce-7242224a2d60');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '1ff1634f-6e8e-4d65-beca-85e0a1714cbe');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'e6a2af72-29f5-49a1-8002-760146811849');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '10e783ab-6d61-42d8-8e22-bc3a4a4f5982');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '9b0cbd11-dd8a-4474-9efb-20085978f2ed');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '55a18e68-6907-4c5d-8094-7fdd43fe05e0');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '14ab65de-b103-456c-85b9-dcc396b11589');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'c2ffec6d-8924-4a16-8dca-db7a0b3fdd60');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'de6efc86-7766-4409-b2e0-4402c28b0a25');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '104aee3c-351e-4b88-842f-93d0f706bfa4');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '22666a0a-6347-41a8-a777-51ba102f6b83');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'eeb016fd-fb45-46a7-bc91-31a8e69b651b');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '323664a1-a46b-40a3-abf7-42c23439a29b');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'b713f0cd-67fa-4b0c-bbad-118eb97dfdcd');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '157150f0-6055-4608-9faa-fefe890392c4');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'ddab6893-a29d-4a44-b3b1-366f3663045f');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'e7972953-e32c-4f45-a732-3848824ab0de');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '75ee18c2-423c-4a18-a79e-67e2bd5e277b');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'dd45db86-8848-4172-8164-bc2d8f260e1e');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '444fda65-c527-455c-8736-535d7f590ce9');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '9298507e-8ac9-4985-a75b-85916355c2b1');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '217bdfef-cafb-4f78-9b3e-c497eab9fd26');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('abe8fd45-3521-4769-99b6-8c019f7d108c', '56c38139-b36f-46e4-9e30-d16f2c048ae1');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'ee383fe4-3335-4559-915a-68aa8dbb0704');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'e2308edf-8aa1-493c-b4c4-d100d91ccb76');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '0ae80677-47c2-48d1-aa7e-994eb8a33ea6');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'cb5191d8-f4eb-4cd1-a77f-2f115f94246f');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'c9b729dd-7c15-4b29-934a-0ba1ca54d78a');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '17490108-2fb3-4b11-bf5c-6f0b888bdc31');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '25cc19ce-b50b-4faf-86f0-1dd60b571007');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '7e82f27a-4be4-4e81-abbd-7e42b42d2faa');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '54b28dd6-a861-41f5-8995-ce9a909ef159');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '4b783ca4-81a0-433e-a48b-01c9d4332c7a');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'c812b50e-ae99-4ae0-b104-3236dfbd77ee');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'a99d252f-954f-453a-88a0-b169c97b62b6');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'e3cc5314-7620-446f-9b6b-214fa926b619');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '6c3a0bbf-175a-4268-bf5e-c87ec85d2999');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'cb39b600-a6ab-4812-ab5a-d7694e326bff');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '3a5de281-e71b-43de-872f-593d46cd09d9');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '3d1e0126-97d4-4efc-ac49-e9337324dbd9');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '7c1e7152-b88b-470c-9509-e162915b827b');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '1fbcb9ae-7b1f-451f-a7b2-f13bda84eae8');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '4c0b845c-e935-469d-aa77-f7fef4faf4b0');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '4f68d82a-03a9-4997-8168-52de1127438a');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'a33f13bd-686b-4528-820a-104d84dfdf07');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'e5d3b8e3-787a-4ee2-9c1b-6931d5460597');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '26698a65-d636-411d-bd90-9b1b8986702f');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '13ba5719-75c3-46cd-a632-e88b7e490464');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'f151e59d-03dd-4af6-ae8f-c2dc6436839e');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '251cc126-3181-43e7-94a2-bc48edbbb97b');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '8352aa14-5a7d-4067-bf6f-721947800a4e');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'c46953c4-0c69-4092-b3b3-3ba3397498ac');
INSERT INTO public."BookGenres" VALUES ('2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 'd444e5f6-700a-4487-8912-88a9870542a6');
INSERT INTO public."BookGenres" VALUES ('0be78d56-30eb-4641-8267-804cbdbdb94c', '622d01a3-30aa-4639-890e-6516118078f8');
INSERT INTO public."BookGenres" VALUES ('0be78d56-30eb-4641-8267-804cbdbdb94c', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('0be78d56-30eb-4641-8267-804cbdbdb94c', '67fa74af-6c10-463d-9b88-04726539445e');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', 'c9b729dd-7c15-4b29-934a-0ba1ca54d78a');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', 'f6cef521-db01-40f3-bec8-682649139c2a');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', '954e0572-0f6e-485e-8ed2-012bbd91254f');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', 'beaab4ca-195b-427e-9a0c-0ca9d75723b3');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', '374cc6bf-7956-44fb-9c01-41784ef6f207');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', '5b5b9dbc-1ebe-401f-bc51-e9620ceb5b7b');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', 'dc348191-bdda-4891-932a-a501d4ba2b51');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', 'a3fff69b-32d9-42b0-815d-2febcf1eefa4');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', '9780dd46-197f-4c4a-97a6-18c3d4be8908');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', '1e253c8d-c4c7-43bc-b113-55e32cc0dead');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', '507b5f95-d2d5-4c6d-9f4b-ff0a1118821a');
INSERT INTO public."BookGenres" VALUES ('961f3c72-1485-4d78-bad0-20a54e8e5c88', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '094a4763-cb27-45e6-9677-ad000ab493eb');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '56c38139-b36f-46e4-9e30-d16f2c048ae1');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '4a63da2b-b138-4abb-8ccc-42d6a84659b3');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', 'bb18769b-8cf3-4a01-8574-7b93bf44439b');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '469bc46e-8a0f-431e-a7bb-1a4303705774');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '21bb45fa-0497-4714-8b72-964f721881eb');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '258e3563-f449-4cd8-825a-37f5c8ca8c55');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '7504bf17-33b7-4d3a-b48b-0eb745b68483');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', 'dbe0bbd0-a9fe-4546-bba2-49fb3b6aab93');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', 'a0be9c3b-6e68-4a9b-92a5-9dbaeb9843b0');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', 'f6b1995e-7b67-4770-9091-906c8514679c');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '6e1c4748-9e75-4727-a7f3-f2a47b7821d3');
INSERT INTO public."BookGenres" VALUES ('7ca733f0-bf4f-48b9-ae7c-dd3233823588', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', '7057b63a-29a6-4fd7-9807-be642a0eace7');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', '754233d9-9366-4c7e-b3e1-d57c40d5c56c');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', 'b02de81a-4afc-4ca8-a3e2-b504652af048');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', 'dba34b77-a930-4cc2-b09a-d999a2782073');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', '0b3df91f-d21d-4fe2-b3ae-db7ce2fdd13f');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', '8db5aae4-9fbd-432f-b7ce-77af403a09d7');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', '3211f6ac-fa31-433b-a659-5feb6d03cc18');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', 'ab405751-4f92-4f03-b2b5-3756104937f2');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', '26eaecd1-a1bb-42a8-adcf-0eff93c79dab');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', 'e697730a-476d-4d4e-98ea-3de776a5ab12');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', '157150f0-6055-4608-9faa-fefe890392c4');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', 'e7d5cfa6-442d-4c3b-8067-b54f5e7c0bde');
INSERT INTO public."BookGenres" VALUES ('c533b55d-0907-492a-817b-a6a889ac13fd', '13bbc9ca-7645-4b71-99b0-b1455f79e117');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'a510f3e4-d0a3-49f4-8650-f0356582323b');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '7e82f27a-4be4-4e81-abbd-7e42b42d2faa');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '54b28dd6-a861-41f5-8995-ce9a909ef159');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '4b783ca4-81a0-433e-a48b-01c9d4332c7a');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '323664a1-a46b-40a3-abf7-42c23439a29b');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'dcf24125-511c-460e-b243-09da875c741e');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '6c44a3d2-3ef5-4cd6-a0cb-145dc435a1ef');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'b792c483-9f51-420a-b8a5-eee4a7f93a3e');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'c0508316-f91f-4c0d-8b2c-352291b563fc');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'ecf1ea6d-f009-4da6-bfa8-40fa4f59d54b');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '0567f150-f770-4027-a790-9f014afb0492');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'd3c5247d-d049-41c4-aaf8-fc99486bf480');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '094a4763-cb27-45e6-9677-ad000ab493eb');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '2cec5747-ed7d-4b1b-a730-d27de7812400');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '7aa76fc6-c056-4363-b467-8771c1dc6232');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'e2308edf-8aa1-493c-b4c4-d100d91ccb76');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '68471ad8-3fc2-4961-aa7b-a7562717e824');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '842e9960-b031-471e-b32b-01b3b6c92744');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'ddab6893-a29d-4a44-b3b1-366f3663045f');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '6a38e606-fe68-4159-a50a-b98a8893502b');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'adc67500-0da3-4cf1-b6ec-cdbbf7cd278a');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '927f5ae7-3651-4afe-9ca2-1265615d1e2e');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'ba7ecc6f-1159-442f-ad83-0c021065b47b');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '1d1f135f-0043-4a3b-9015-2048ecd74669');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '70163d29-04ce-4f10-87b5-b5d114df53a9');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'cb9f5568-5048-44fc-ba69-82931ca31a5f');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '28b47039-befb-498a-ae66-d79187c545f1');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '35100865-4299-4e14-8682-21e69f3036b4');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'eaeab13e-0ea8-4f70-8e57-e0a8021dde93');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '139d15ac-3887-4ebf-a3a9-13edafdcde8f');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '010cc6aa-d4dc-4ae5-8a19-a4c2ae61a2b9');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'b084e60b-9dba-42ee-9335-a634a1a2768b');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'c1a1e9f8-1167-4bc2-9e9f-8059e9adfe2d');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '1fa85671-75f8-4bca-85e9-2724f47da87e');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '305cc919-c7a4-465a-a8e9-47fb896b7f3d');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'cfbd7d90-4ddc-494d-a84d-9245c8d14181');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '27c5691c-a4ec-4717-8d35-94aff8c300f4');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '611b84f9-a606-43e5-8832-53cd9db2d811');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '84d3b938-d196-4472-bc4a-e30303507e29');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'f64afb02-72be-4910-ba9b-59983cfcafb2');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('6045772b-8f73-4558-ad45-f58632352975', 'd7eeba7b-708b-4167-8f99-99087b555426');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'ab50f836-5ad3-4186-a408-b8ab7854e657');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '14bb5c94-ada3-4b95-9267-32a8a8b62488');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '3b8d89dd-1e83-43d8-b857-5c9a18caf9c8');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '0acad680-7e84-4c8e-bc31-11d6cb7a5156');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'a8915ebc-05f9-4052-9a2f-a451a2fc761c');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'dbe0bbd0-a9fe-4546-bba2-49fb3b6aab93');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'c0508316-f91f-4c0d-8b2c-352291b563fc');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '11f7da9b-0420-4c54-859f-bb6f5440c05c');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '1bd0699d-86b0-4a6a-82c8-11e2619b2fb1');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'ab7834f8-9e53-4626-ba4c-9c1fb41219c3');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '6c44a3d2-3ef5-4cd6-a0cb-145dc435a1ef');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '14cca4a7-b145-4f89-89b4-997b5b52504f');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '5844de0a-c8bb-4469-9f15-31613cc06309');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'd9805e08-ea93-4c81-bf67-f6d22868cf27');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '390deac0-bf8a-4053-8c8c-7dcacd5911b6');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'e2308edf-8aa1-493c-b4c4-d100d91ccb76');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '8552f660-6145-4ad3-ae72-fd6d03253fe4');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '9ae634e5-6565-4236-8458-d2c532fe7740');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '07cda38e-8ea9-4f5b-ab4f-d8ffb2b707c4');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '32a3a353-a5cf-4dad-94c5-68b8c6595ff5');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '0e4117f3-fb00-4bd0-862a-dc4ae13f7b4a');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'dcf24125-511c-460e-b243-09da875c741e');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'e8070efb-d6e1-4fea-81aa-bc1f9ea0076c');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '9e92acd8-c4c9-4fa3-9bea-48230aae6e8a');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '421d1cb7-dd6d-44b9-aec8-dd5ff37b16f2');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'a9229cfe-3d7d-4010-a15a-910d6afc0b7d');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'c11329ea-890f-4660-aab1-7a5af7f3c06d');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '8e430c9c-90c3-4f75-a54d-888f1b70cfdc');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'c77b87f1-4c93-41a3-bf58-333de43e8b22');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'be61dad3-c731-4f3a-a2a6-49da902fd5cc');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'bcd3e5b2-5b53-45ad-bcd4-1af50df45fb3');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'cc36b578-35a4-48dd-b3b2-4a553c44caaf');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '6876654d-e038-488f-8556-109ae5c11f40');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '9bb8e1a9-35f5-4dd8-b1ab-f5be90cf8b82');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '7598d430-833b-4732-a154-1ce6b72e3089');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '50910fc0-353e-4b6f-9b95-f5635aea2267');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '273092aa-af82-49b0-8f37-8798305f8b2a');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '7e82f27a-4be4-4e81-abbd-7e42b42d2faa');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '4b783ca4-81a0-433e-a48b-01c9d4332c7a');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '40497c16-28e1-4e48-82d5-93d38c4ceb90');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'fc28a98c-382e-425c-b4eb-b118a772c1da');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'f6f76e8f-8be3-42b9-b010-37be0728ab6c');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'c435896e-d393-4df3-a3c8-3a475c39260a');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '5c7160e2-1b80-417e-878c-4d29efb1a30c');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'ba7ecc6f-1159-442f-ad83-0c021065b47b');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '9e826827-57cb-47d5-8d1c-416c2861d272');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '157150f0-6055-4608-9faa-fefe890392c4');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'ea9854f7-19a6-4aa3-845a-35cdd30f9192');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'a901ecff-f76d-4aa6-8e79-2953be47e6b2');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '41591a59-e547-46eb-b921-ed61948421ac');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '1178e9ca-3ac8-4b52-b8bd-8dc935db7bc3');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '571ce5b2-3df8-4f08-8fd9-c2a1cf005d31');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'fcfc2cf0-d198-4667-8b45-4f50234ea2f0');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'b0db7350-55c9-4340-92cb-8376d5cd6010');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '323664a1-a46b-40a3-abf7-42c23439a29b');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '3648344f-24ef-434a-a104-13fde18a9088');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '13af1d94-0d22-471d-8527-d2d7e8dc633c');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'a0b32aba-84f3-4239-8ef0-ba699ad7fb2e');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '573c5566-b516-4304-9b9c-f817d082198f');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'faa5c76b-3de0-412d-afa8-1b8579a6bf43');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'c6b4a88f-862e-42f5-bbb1-66a558c7cb55');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '82ce2bfe-d83c-42c0-a994-470818fb8ca4');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '81aa4d09-7d1c-46cd-b1b6-eebd7564d7e1');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '1138a8e1-3bc1-4252-a13f-16e3e8b70597');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'cddb0a26-205c-418b-9408-0c203e5eb4ff');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '94b6b076-c420-4333-9080-ab2cffa3ce46');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '814cb1c4-a231-455a-844c-122c8e49f5d1');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '2d230270-0c93-4e70-9663-bde3e5e55859');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'c221320a-9c0e-4d32-8d4d-8d97d4154f78');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '398e8d3b-0005-47f5-8c15-5803cc4bc7ca');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'fc6484a8-1ce7-4c84-b425-b08aeaf3d9f8');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '91043e4d-6698-4fe0-a474-7f7ea8680f71');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '32dc6944-c735-464b-86c5-b1d226b2687b');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '81a6d40b-e5b7-4694-97f4-6a956887f210');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '59ee7443-fb03-4bf3-98f8-7aa90f9b294a');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '0d9ff2d4-1190-4001-b0a5-062d10609968');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '5cf5553a-df02-4bbe-a744-a258178328db');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '0750e3e4-a892-4fb6-8cb4-4e0a77205b98');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '745b6569-6bc9-4494-b083-3c682e00c6cf');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '61feb5dd-3d9a-4acf-abbb-58e8aea10aa9');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '21fa18ba-98a2-4dfe-96d4-b62e24420d67');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '113b4e6f-1942-494a-953d-27e51722c8b3');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'd5ba7ba0-8d3c-48d6-b8dd-f8d6e404ceb0');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '592d1a81-4dc4-4ba9-8ebd-a5bd5bb12fdf');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '903b2581-5e76-407f-97e7-74ae307a25e8');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '504b36df-445f-4f56-a477-5dce83369a94');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '35445a1c-a6d0-41d5-99de-f2cccb32a0a4');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '448ddf4f-eeee-487a-8000-52d78eca8868');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', '106dc535-6086-4276-8c5e-33229dd16501');
INSERT INTO public."BookGenres" VALUES ('405d86f8-9b88-4b15-b164-dc2fd1b10476', 'dfa9e611-1589-45a9-883f-063a54f69fe8');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '223fb438-29a5-4495-9ab0-074a44a66392');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', 'bad5a28d-437d-4ac2-9cb2-e681303562bd');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '2c10bbd0-89bb-4333-b628-8525b73f248c');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '33219cff-0340-4e96-ac0c-9d3d987ca33f');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', 'e65b651b-0105-41ed-8ffc-120ac8cbd984');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', 'ce6c488b-b660-4134-be37-a4f3a2c1084e');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '122a99d7-82fe-4ee4-bbaa-a2109fbae4b6');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '1ecd456d-057e-4585-8c51-5077bad3b3dd');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', 'bdafa57b-2653-4dce-840f-9a9620317bef');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '7e8c5753-dcfd-4f40-86c5-6af6dae8648d');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '90a304f4-5a0f-4941-a1e3-62d2b31ffcb4');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '6dda7f78-e6a3-4031-8c67-e042785ff9a6');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '9141ee30-58af-4895-bb63-e216bb902d48');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '88f14714-5e99-4752-821b-30d73c52a2eb');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', 'db1f5bac-247f-463f-94f1-7ebe507912b3');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', 'a044b1bb-14fe-40a7-bf8e-39011f7e59dd');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', 'a3970c09-572f-44cd-9902-772796b3a259');
INSERT INTO public."BookGenres" VALUES ('f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '76db3c35-3703-496b-9623-857235f652a5');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '5b94e2ad-8312-4f4b-a9eb-eb52c03532fa');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'ad593639-7b10-41f7-9ea3-c278741f285b');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '77bceac3-3ad3-4535-a0af-db7c441d8cb8');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'df812c20-63b0-4d04-8cdd-900a2f3c7053');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'c1f28d06-64bf-441e-bf28-f0274032e332');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '37d9b784-cc12-4148-b537-b4ad7d15d467');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'c38c7fd9-b792-444e-ab32-f389db02a993');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'c4fbbba5-0731-4327-bdb8-e6e378cb67b8');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'd4e0d81e-54c7-48f8-b485-452f1618001b');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '3b277fa5-6585-4f62-b65a-fbd772015ebc');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'b66426f6-aff7-41bb-93cd-407f06220a14');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '91c6e265-be1d-4768-9e73-95b8ac234dce');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '69d3b08a-af5b-4b44-a311-345ceed2eb28');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'da4bd0be-2061-4663-9567-13507067dd43');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'c09ec4e0-022c-41e3-ad64-ddc7c7214750');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'de6efc86-7766-4409-b2e0-4402c28b0a25');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '15bbc998-9d40-40bd-9046-066ea86e8093');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '7732c31d-d421-4203-b933-1c452ee1bb4d');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '678fc2a2-0b08-4259-83a6-116f7da2a9f7');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '645861b1-3a31-4a6c-965e-7a9a00cbbb19');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '97a96abf-4578-454e-a406-4a85c06a398a');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'b4884bb0-8b26-44aa-b3fe-b9a5bf906e6e');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'd2bbf30c-5fbe-4d10-9484-e149f7624c17');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '9fa3360f-0be6-48a7-a4bb-18651889ec38');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '0d0d0b77-e328-4ad2-875d-7175b698be10');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'e7588a9f-bc08-4db5-a6dd-b844e8601d09');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', '1a3c2f73-896b-4d81-a8b6-35758b9ab495');
INSERT INTO public."BookGenres" VALUES ('98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 'a968a317-daff-4c5a-95ed-660c8df9f61d');
INSERT INTO public."BookGenres" VALUES ('29bba103-a874-4340-9f88-25059ec4a2b4', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('29bba103-a874-4340-9f88-25059ec4a2b4', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('29bba103-a874-4340-9f88-25059ec4a2b4', 'a70d0b26-857f-4323-8fd7-7361960fefef');
INSERT INTO public."BookGenres" VALUES ('29bba103-a874-4340-9f88-25059ec4a2b4', '7057b63a-29a6-4fd7-9807-be642a0eace7');
INSERT INTO public."BookGenres" VALUES ('29bba103-a874-4340-9f88-25059ec4a2b4', 'fc6484a8-1ce7-4c84-b425-b08aeaf3d9f8');
INSERT INTO public."BookGenres" VALUES ('29bba103-a874-4340-9f88-25059ec4a2b4', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('29bba103-a874-4340-9f88-25059ec4a2b4', '6bbe4ff6-74d1-4a99-bffa-2d65643e47d3');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '814e87b5-4a24-41fb-80a5-05d2416301a1');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'bf03a47f-7ef9-46eb-bd53-7cb231fb46dc');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '579f9084-e85c-4ee0-afc7-ca48f7d835a5');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'bd7e4c7c-fb72-4f80-9cfd-c5d2a0aa72cc');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'ea41a1b1-d50f-406d-8b51-d3584c308cf2');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '7e82f27a-4be4-4e81-abbd-7e42b42d2faa');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '54b28dd6-a861-41f5-8995-ce9a909ef159');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '4b783ca4-81a0-433e-a48b-01c9d4332c7a');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '56d06f24-a691-4797-81f6-df18821f7d05');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'c812b50e-ae99-4ae0-b104-3236dfbd77ee');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'f55e62da-7fd7-42dd-b2cc-56fb36f5cd1f');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'f8ae969a-b0d4-4750-b1ef-0d9842862046');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '6d095bfc-7ec5-443e-9c26-96436b16bccc');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'd69adc92-1c7b-4832-827f-ee4b4b78a5bd');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'd8f83420-33db-4ac6-8677-c8e8d03e3da0');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '2b42675e-9753-4a07-836d-c8521faf1e8b');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'd6115bb1-4cb6-40a8-a9e1-47879945d8d7');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '6babf388-a010-4ec6-a15e-4a6a81a2e269');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '3cedd54d-0429-448d-bb80-67d8d6516114');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'ef6a7a6c-03da-40e9-b155-b7c9f4b24a7f');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'd3e0d5ef-5789-4a35-be5f-e000e1f885b0');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '6c7805fd-5aa5-4961-8dd7-55a3174a76c0');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'dbe0bbd0-a9fe-4546-bba2-49fb3b6aab93');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '93b244ba-6269-4ce5-b943-d4d08df8b7f7');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '9c0350cc-d83a-4696-9178-7ffe0a4a069b');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'da1cc146-6b26-4542-b173-818c61a1ee9c');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'cac36014-aac0-4447-92db-7f702c6828e4');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '0b3df91f-d21d-4fe2-b3ae-db7ce2fdd13f');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '199bb0c0-743c-4deb-a9d3-ad02b04a6298');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '06695aa3-959d-4468-b83a-d5a776053c6c');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '622d01a3-30aa-4639-890e-6516118078f8');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '924d2b37-a524-4243-a893-b43193b26eb2');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '8c2eb2eb-1819-4414-877c-7ae158227b82');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '0b20eb49-af1e-4d99-9426-d4be8515c5d5');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '9def539b-6577-4354-8a6d-2f80e2c2b189');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '760cd5cb-3cdf-4594-a2ca-f3ea18818c6b');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'ba7ecc6f-1159-442f-ad83-0c021065b47b');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '6ad82c0b-f08c-4a9e-a746-4c01ebbf0205');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '0e3e232c-887b-4f73-b901-661e54692618');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '0c45c682-b80e-40db-8bad-29b40274e2ed');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'f8683274-36c8-4686-8251-e0f89d4deeec');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'eafd1029-a7c5-4c21-9b51-653a5890b3e7');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'bb087249-20b2-4057-8cfc-912256d5498c');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '73a5fa69-8be8-499d-9f7a-8f5f3914ae44');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '97db241e-fd55-46fe-9d42-2c84c5c3d47d');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '471d1ce1-7475-48d9-943d-15e002c40d60');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '5b4c5194-86bc-4ba7-8040-ad65d9d0b5da');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '833f19fb-bcdc-43f6-9c37-278deefdca2b');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'e0a1cc82-6783-45ef-b67f-e72f83a4cf08');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '1a25da19-be8a-4141-8f68-cfa2fea455ce');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'd9dc7c84-977a-4b51-b165-37ed3bca21f0');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'e8e3c2fa-9fcf-408c-8e5e-464b945ba947');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'cd405540-6b6d-49d0-9535-7994e3018f49');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'e2a3c2d1-242e-4be0-b62b-510d23a44b1c');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'e1200bf1-5659-4d06-9d08-48b3ab58ee30');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'c9e526dd-8913-4fa5-b3a2-40be5c13cb51');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '1438c07d-359f-46e7-ba5d-0a7380b5d7a9');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '691f59ed-6b4d-4fe7-af99-e7ef86cd00b6');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'cab060f3-01aa-4b9b-897b-e5af8b876a82');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'f96ab88a-394c-483a-9f6b-4d661eaeb287');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '00beef70-fd21-4d83-b552-200830ec5193');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '26eaecd1-a1bb-42a8-adcf-0eff93c79dab');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'a01dcfd5-3218-49a4-b3fa-be660ef3b2e8');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '645861b1-3a31-4a6c-965e-7a9a00cbbb19');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '59ec7184-c88e-4cbf-b039-02e51f23c8d7');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '81a6d40b-e5b7-4694-97f4-6a956887f210');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'e9efd1d5-96c1-4796-a4d0-268b589e7a4c');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '0d0d0b77-e328-4ad2-875d-7175b698be10');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'de6efc86-7766-4409-b2e0-4402c28b0a25');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'a968a317-daff-4c5a-95ed-660c8df9f61d');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '9bb8e1a9-35f5-4dd8-b1ab-f5be90cf8b82');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '41591a59-e547-46eb-b921-ed61948421ac');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', '07cda38e-8ea9-4f5b-ab4f-d8ffb2b707c4');
INSERT INTO public."BookGenres" VALUES ('4503d7fb-4b27-43f9-9e65-89f2c430b527', 'e74ca44a-33ce-4904-832f-8a019b777011');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '32698894-28d3-4bfe-91b6-6a802c32182b');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'fc6484a8-1ce7-4c84-b425-b08aeaf3d9f8');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '37bdb237-45ff-4e92-a42e-e90e9d100bf3');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '84d3b938-d196-4472-bc4a-e30303507e29');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'd9289c5f-9ee9-464e-83e8-069fb4377174');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '79c95855-a36f-4cb1-9bc7-aab20037a2b5');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '64bd06e9-650a-4f88-9474-316df19871e5');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'c331cef9-2bc4-49f3-bcb5-fd2afb23f23d');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '833cb807-0e33-44c9-ae4e-0be7fb89405a');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '07853d7a-e471-438b-a77a-d27b1adee559');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '59005fbc-6aed-40fd-9922-f840f32e93f4');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '5c7160e2-1b80-417e-878c-4d29efb1a30c');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '1fe6c1f9-1150-4441-b489-aa0bfb17f0c5');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'ba7ecc6f-1159-442f-ad83-0c021065b47b');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '7f759e31-fb56-474f-85b0-532cc1a654f6');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '323664a1-a46b-40a3-abf7-42c23439a29b');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'a2ac0cfe-761e-4617-9a03-b400d1057082');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'bf03a47f-7ef9-46eb-bd53-7cb231fb46dc');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '1dfec9c2-3158-4fca-8670-9f0f4f60656a');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '9bb8e1a9-35f5-4dd8-b1ab-f5be90cf8b82');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '32d613ab-fa27-49ee-a388-0fbdde3adbce');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'e5eadf28-f448-43df-9b92-aef62f7cfc03');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '26eaecd1-a1bb-42a8-adcf-0eff93c79dab');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '77c9d02e-fd1b-47fe-be6d-d0df0e7fc393');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '0ce209c1-ef4a-4998-ad04-71ffb05c6799');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '554068d8-d839-4e1d-af18-e61cb5ebf18c');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'd3e55835-d02d-4801-9ef8-11fd1d10cd27');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'be5bdd51-26c8-4ce8-b6aa-f3d8238d9516');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '374cc6bf-7956-44fb-9c01-41784ef6f207');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '9440094a-585d-4c5b-b9b6-2e874bff6d82');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 'd0aa249b-158c-4e6d-93c2-559732255bc2');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '9b74727d-aa88-4756-9452-12549081b200');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '6684ed0d-0883-42c4-8dc3-cac54e8fb678');
INSERT INTO public."BookGenres" VALUES ('6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '89cef53c-4989-48da-b697-7071a4f9eaa1');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'a9edb7bd-4c0d-4a75-91b8-2a47997a2f7a');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'c495e81c-1026-4d7d-b34d-0328174024c3');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'abaa5bcc-2a87-43d3-ac7c-88adccbabfaf');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'e8c2eb0a-f402-4e8e-802d-10357d8c038f');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '01f6b1b2-e59a-43d5-a9fc-d8f8db65f7ed');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '0a6f2754-8fd5-47cf-bdf9-9196819250a1');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'ddab918f-cf31-4a7b-a858-c4d67353134b');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'bff0f89b-ec0e-4ce0-b1ec-0a8f4f1d5f14');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '874483f8-4014-4f0f-9bf9-972d5e1bf0da');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'ba7ecc6f-1159-442f-ad83-0c021065b47b');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'eeb07ae8-612b-4da9-aad0-d62750060bf4');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '4c6f8280-fc49-46c0-a547-967bfb491818');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '1df29b46-381b-4ad2-8298-3a842ecc6354');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '00260188-412a-45de-b909-cbb48b2b8da0');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '814cb1c4-a231-455a-844c-122c8e49f5d1');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'ea047a24-2ba5-4bd1-9851-91a3f6b0e9d9');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'e8025ecf-22c8-4b93-982f-9461451fe452');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'c3075545-58a6-4a7a-990f-77200e11476d');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '2eb2df4a-5a0c-43a3-bbfb-88b8bf4809a1');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '1f1caf53-ca88-4c00-a264-2ec245dd5c6c');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '1db8609d-40cc-4fcc-871d-68415bdf97b9');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '4d432cd1-6770-4c1e-a029-f2d3e1db8719');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '53665eee-a62f-46a8-99cb-103be1a8b0db');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'b7f817b2-9240-4fee-80d4-e6a18b2a3360');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'b892e440-07ce-43dc-8f1c-87b8eba1c718');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'f658f553-0dbc-43af-83f7-90602972f968');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '3abb41f2-d869-4848-b139-2801b624048f');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '397a9e86-f362-4a8c-a43b-89247dbae8cd');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'bec5e3ff-54c2-43fd-867c-7249bae9c813');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'ffae740b-df6c-4304-8e0c-b8f68994f1ec');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '1d73788f-a0eb-4469-aa1d-02fd14225ae0');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '5291a810-3412-4a2a-b17c-f20d9db82da0');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'c50764e4-8040-47e4-b777-78696db92b20');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '273366a9-e2ce-40ce-b5c8-6497b9ebf0d0');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '881b7b64-ed54-4cf8-b126-a3f24bc04349');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '22f5be10-3d20-4c3f-9657-c8d005d3b606');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'd7bd0847-d62d-4487-93a2-b07243f458cd');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '34743ae6-d1c2-4411-b0f9-0c0c827f3292');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'a3970c09-572f-44cd-9902-772796b3a259');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '56c38139-b36f-46e4-9e30-d16f2c048ae1');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '73717f8c-8425-4d30-9b46-547f1b85fd57');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '7e82f27a-4be4-4e81-abbd-7e42b42d2faa');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '54b28dd6-a861-41f5-8995-ce9a909ef159');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '4b783ca4-81a0-433e-a48b-01c9d4332c7a');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '56d06f24-a691-4797-81f6-df18821f7d05');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'c812b50e-ae99-4ae0-b104-3236dfbd77ee');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '971b33bc-ed41-4acf-a5d0-6124acce1150');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'f6975dfb-77db-49ea-abe6-9664c52836c5');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '7eef82ad-1e81-42de-9f32-16771f6e5c6f');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '3648344f-24ef-434a-a104-13fde18a9088');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'd9dc7c84-977a-4b51-b165-37ed3bca21f0');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '691f59ed-6b4d-4fe7-af99-e7ef86cd00b6');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '58631f2b-6ab3-42c8-8f66-25720df5d93e');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'd69adc92-1c7b-4832-827f-ee4b4b78a5bd');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '645861b1-3a31-4a6c-965e-7a9a00cbbb19');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '6dda7f78-e6a3-4031-8c67-e042785ff9a6');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '5081ed77-244c-4fa3-ae99-240ed3b1f2f7');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'e995a775-6135-42c9-b3fd-c88f1cf22053');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'd7a2d8e2-b31a-4c75-bf5e-711b029280af');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '7733a9ec-e8cf-4a86-943f-cc7f38fdc996');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '9aee6b19-6281-4c90-bcee-486b236742c5');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '86589549-4152-433f-9392-cd0565ee7770');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'cdf08edd-7c10-4cfc-b5c8-7c73b98a4098');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '07c27022-a289-4ba2-84cb-e0722262cf7d');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '65cbf2fb-4f93-4153-800c-cdbd9de8bef8');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'cfc0cb73-93f6-44e8-9275-4dda3abdbd6a');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'f3f70353-36cf-4c23-87e6-d2d28102403b');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '1d8e778f-e5fb-4841-bf37-e78a7ea6c766');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '157150f0-6055-4608-9faa-fefe890392c4');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '8698ac87-ec56-41a7-9751-09dc4ba84c60');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'b3b6bb88-2b8f-4634-8ac0-3fa58c9fb6b4');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', '528bdab6-d1b0-42d5-9689-4080baca441d');
INSERT INTO public."BookGenres" VALUES ('9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 'cd753fb9-92a3-4f0e-bc00-8094af1f53db');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', 'b7f817b2-9240-4fee-80d4-e6a18b2a3360');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '6c11ba08-497d-43dd-b847-74426961ca9f');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '28ef988c-e0c7-4d0c-9ebf-b7b2906b2014');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '8c18f63c-c2e2-4071-8786-ab58a5feb1a6');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', 'd954d288-0803-4b33-86fc-b345e6c89508');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '8bb53c63-bdad-4358-94fa-928f2a2720c8');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '8f27dc4f-a038-4b46-99f6-050be37c8db4');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '8c215603-a4bc-42c2-9561-9b0159fe91f4');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '1c1a7a24-6ad3-4b1a-ad93-29b982b73306');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '25cc19ce-b50b-4faf-86f0-1dd60b571007');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '66237398-d154-4441-b599-62aa102771c0');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '6667006e-8514-4b8a-8f50-b26c9c88e7fc');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '3af48413-14c8-43b2-850f-0e8eb7eae8af');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', 'bb18769b-8cf3-4a01-8574-7b93bf44439b');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '56c38139-b36f-46e4-9e30-d16f2c048ae1');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '4f97a537-82e0-46a3-a5b9-a652d2103841');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '0e946358-e84a-431f-8c22-5c3afef99ca6');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '3fb6166e-6a96-4f60-998e-6f4493bf6d4c');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '30253e5d-348e-45db-b7b1-ac6c3543983a');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', 'dbe0bbd0-a9fe-4546-bba2-49fb3b6aab93');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', 'a9db6c11-01b5-4dba-8da7-3f21fd4ef30f');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '6f79e3eb-b046-49f4-8281-c086ce1e59a6');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '86589549-4152-433f-9392-cd0565ee7770');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '6d970fe4-00b2-4ab3-bb9e-418b32229750');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '5c7e5059-fdae-47a0-aa80-0df9eff9c61c');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '4f207997-a8e6-4729-83e4-3a1e29a3b123');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '0e4117f3-fb00-4bd0-862a-dc4ae13f7b4a');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'a968a317-daff-4c5a-95ed-660c8df9f61d');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '0a6f2754-8fd5-47cf-bdf9-9196819250a1');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'e2308edf-8aa1-493c-b4c4-d100d91ccb76');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '32dc6944-c735-464b-86c5-b1d226b2687b');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '6bc54c1b-5c96-4872-b722-7055f80496d1');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '9e6d8fa0-f9da-4e43-a4b2-c467956d0f1e');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '44e02a62-7aaf-4f61-b9fc-0e21a60abc52');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '323664a1-a46b-40a3-abf7-42c23439a29b');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '07476222-5a51-486a-beda-e5fa56c547cd');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '5b4c5194-86bc-4ba7-8040-ad65d9d0b5da');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'c9b729dd-7c15-4b29-934a-0ba1ca54d78a');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '25cc19ce-b50b-4faf-86f0-1dd60b571007');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'f6e7c9a1-8e4b-4248-a58f-e2766f8ae1e2');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'f658f553-0dbc-43af-83f7-90602972f968');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'b79ba18b-b215-4391-a85a-2c6deb732e87');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'd087dbca-ef35-4408-9c16-179d60e060fe');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'ba7ecc6f-1159-442f-ad83-0c021065b47b');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '45338ddd-3e7a-44c5-b3e7-c936758de4ac');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'f96ab88a-394c-483a-9f6b-4d661eaeb287');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'c9e526dd-8913-4fa5-b3a2-40be5c13cb51');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '716914f2-c0cb-4292-9054-258e52e7d9eb');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'a6b88800-fb01-46e4-bf14-644f2d30e116');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'c8ba7190-f4fd-410d-b946-3c92901d57bb');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'f79ae256-1e15-43b5-8802-ca78f96d58c2');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '3cedd54d-0429-448d-bb80-67d8d6516114');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '924d2b37-a524-4243-a893-b43193b26eb2');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '3cf4cd09-6cb9-4817-bb9e-04503c86fc1c');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'd0441068-bec0-44fe-ad71-70d097b753f2');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '0954502a-4058-42af-bf7c-51010a0a01d4');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'f0150fd3-6ce4-4e09-a01e-74349b9c600a');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '2425161b-1bef-496f-88e8-e9b48f7b72f5');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'b8c6ca39-b97d-4e86-baec-c322919b96ae');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '81a8b346-fa75-410d-9842-5ba97ea5d467');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '199bb0c0-743c-4deb-a9d3-ad02b04a6298');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '1e720719-78a1-45c2-8290-0b090165a5d9');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'ab868513-6a06-4d2a-a8cd-dedeefcdc07d');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '5880bc02-11e3-47c1-9dcd-09233d60550c');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '49575cf7-906e-4969-b811-cc7265fde25f');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'c7cdde09-5088-4aef-84a9-acefeba58678');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '9c0350cc-d83a-4696-9178-7ffe0a4a069b');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '491b3320-41ee-4685-b556-1f654b96a283');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'aff044eb-3321-4045-8d03-d26ea216a878');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 'd44889e5-15fc-4e87-a2da-b42eb9313108');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '2a5a3c1d-9a5e-4254-901b-4b6098dc5f04');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '1533b4ec-8278-4b10-b0dc-5ddaedabbbd5');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '02668f21-627c-4544-ba65-d4618f841dd9');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '2b42675e-9753-4a07-836d-c8521faf1e8b');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '5c9d4573-0090-401a-920e-29d2b84521fc');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '996c764a-16f7-4406-a19a-fbdabded0514');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '34c73019-5037-486e-bf8f-661f38c71a7e');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '25209df8-94fa-4533-965f-cbc189aa01be');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '99fed9d6-bca9-44dc-a2ab-ce1f373fe763');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '91043e4d-6698-4fe0-a474-7f7ea8680f71');
INSERT INTO public."BookGenres" VALUES ('eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '81a6d40b-e5b7-4694-97f4-6a956887f210');
INSERT INTO public."BookGenres" VALUES ('b7bafc65-c34e-4ea2-9c46-7409635fdc85', 'a2cf8bbe-8b79-4ece-aad0-571245584ede');
INSERT INTO public."BookGenres" VALUES ('b7bafc65-c34e-4ea2-9c46-7409635fdc85', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('b7bafc65-c34e-4ea2-9c46-7409635fdc85', '5116d9e0-6cf5-41b5-a53d-9540c5cd05b7');
INSERT INTO public."BookGenres" VALUES ('b7bafc65-c34e-4ea2-9c46-7409635fdc85', '02773b79-ab9b-40ed-81c1-fe3b2378224d');
INSERT INTO public."BookGenres" VALUES ('b7bafc65-c34e-4ea2-9c46-7409635fdc85', '33d8ce91-5af4-4348-8b88-027a0c9c6a00');
INSERT INTO public."BookGenres" VALUES ('b7bafc65-c34e-4ea2-9c46-7409635fdc85', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', 'beaab4ca-195b-427e-9a0c-0ca9d75723b3');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', 'c0db7098-a823-4fdc-be65-beebfacbcbcb');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '45b546da-197c-4eaf-8533-47b5941b5f88');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', 'f4bf6673-85d1-4096-904c-6b9fa815ef6a');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '374cc6bf-7956-44fb-9c01-41784ef6f207');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '5b5b9dbc-1ebe-401f-bc51-e9620ceb5b7b');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '565dc059-423c-49e2-9625-9b0a3359869f');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '1986c060-8347-4b45-babf-1072472b29ca');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '0e4117f3-fb00-4bd0-862a-dc4ae13f7b4a');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '622d01a3-30aa-4639-890e-6516118078f8');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', 'c9b729dd-7c15-4b29-934a-0ba1ca54d78a');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', 'c2ffec6d-8924-4a16-8dca-db7a0b3fdd60');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '22666a0a-6347-41a8-a777-51ba102f6b83');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '3440d7a2-3409-43a0-be2f-b673edf26213');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '201aede7-0ead-4298-9804-0912fc1f9f23');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '5bcb42d8-32e2-4d8b-857b-9dba171ab18e');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '14705434-7253-4360-86e3-44963a13ef8d');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '49c34034-1ebf-4d0a-9a23-441c505cf7b5');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '0fff65fa-d48f-4b34-a51f-d6ffe17295c0');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '3602e76e-f2bc-4df6-b9af-5f503ca64385');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '7bd1eabc-bdbc-445f-ba98-b3c4fd13544f');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '19d64fee-836f-4afb-8a9f-dd30a5b55f7c');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', '5ab7eea5-0cf0-4bf4-97ef-2b634d436c87');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', 'a8ccc213-8dea-41bc-854f-adc4a6c183ba');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', 'd2ef9d9d-2052-49e3-a56c-7fff54c131ee');
INSERT INTO public."BookGenres" VALUES ('508e7941-37f6-449e-bd2f-4f266edd6da2', 'c46953c4-0c69-4092-b3b3-3ba3397498ac');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'e52efde4-fc4d-4d6d-b5b0-125785fec39e');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '13198d10-1aa0-4c21-8373-8ac9c8f69b1f');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '53b4e8cb-dc59-445f-9510-81118b60dbc6');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'cdf9da9a-6f9e-4ae0-9933-a68805aa9296');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '14b3536f-4a74-43f1-bfa9-86b983e86ac8');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '3adeff21-7aee-4a73-b401-3c5369b0343f');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '4fe25f92-ee92-4be3-8fde-2a71a94cf7c3');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'deabce26-1fa1-4330-bb94-efa88e9af413');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '0ff40c2a-c631-46de-8a3e-550184f42ba5');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'b2bb8458-0f69-46a7-a616-17d09647d462');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '60743ab8-8f7f-41ca-a1e0-365b12aaa3a0');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '8c215603-a4bc-42c2-9561-9b0159fe91f4');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '0c4dd495-a605-41cf-9f08-f0b9d4a095ec');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '5291a810-3412-4a2a-b17c-f20d9db82da0');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'cf03e527-36da-461a-a1be-76eb6c42e3ee');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '633901bd-a95c-46d4-af3b-a8313e792c8d');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '60052918-e0c8-4ea6-854d-d48b515b319a');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '3388b989-44f9-4efd-bf0b-4ffa1bcb3205');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '25d1dc40-7561-4987-a669-340b9f827fb4');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '86589549-4152-433f-9392-cd0565ee7770');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '7057b63a-29a6-4fd7-9807-be642a0eace7');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'ffce3971-9879-46f9-9d2e-a649f7469359');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'b66426f6-aff7-41bb-93cd-407f06220a14');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '645861b1-3a31-4a6c-965e-7a9a00cbbb19');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'ba7ecc6f-1159-442f-ad83-0c021065b47b');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '990dcde4-bee9-4ad3-9267-948fde53a3a7');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'f64afb02-72be-4910-ba9b-59983cfcafb2');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'b084e60b-9dba-42ee-9335-a634a1a2768b');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'f658f553-0dbc-43af-83f7-90602972f968');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'b7f817b2-9240-4fee-80d4-e6a18b2a3360');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'f18987fa-7217-4b83-a1e8-92d63e8a3633');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '28ef988c-e0c7-4d0c-9ebf-b7b2906b2014');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'eaeab13e-0ea8-4f70-8e57-e0a8021dde93');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '5b94e2ad-8312-4f4b-a9eb-eb52c03532fa');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '45861056-7aaa-436d-8ab6-4b0139b02ae4');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '6f475f8f-709a-4420-84d4-f0d7d8afefef');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'c5ab0a16-6a49-4f9c-a46a-b0c84032e5b2');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '2a1bc6a9-fe83-4188-ba94-88f5ea7c4d4a');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'b0cf4c8a-2afd-4c72-9edd-819057be20e4');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'f21583d2-fcb5-4fad-89e8-e89186d5fca9');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '0a6f2754-8fd5-47cf-bdf9-9196819250a1');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '6c3dc204-1828-4873-b07d-fe837c508d2e');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '01f6b1b2-e59a-43d5-a9fc-d8f8db65f7ed');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'c6021066-f174-41d0-bdf8-9080b6dce212');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '99423b19-0b16-4602-b631-40166031c1b3');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '44ad972d-8169-460c-acf8-2eedcbf559c9');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '74f29f8a-b011-4752-be9e-b4da116c6b5d');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '3b212d69-846b-428a-8599-535fca927c18');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'aadf9810-54cc-427c-b6d9-3ff2dce9d6e7');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'a989bbe2-7e52-47a8-a7a8-0cfd23587158');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'cde90ef5-2161-4847-b6ad-35da25210db9');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'cc1f7c01-c28e-4a11-9cce-5b50f7eeca0d');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'c0508316-f91f-4c0d-8b2c-352291b563fc');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '3bad707c-e101-47a3-a499-11f5946e015d');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '9b2018b2-e8b5-4e9a-a2d9-2e236ca5ecfc');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '8bb53c63-bdad-4358-94fa-928f2a2720c8');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'a70784eb-96f9-45e0-a9a4-b026bcb77aee');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'dbe0bbd0-a9fe-4546-bba2-49fb3b6aab93');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'b792c483-9f51-420a-b8a5-eee4a7f93a3e');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '0f3aa117-9cb2-4d44-b3b3-e41feb6099e9');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'ab405751-4f92-4f03-b2b5-3756104937f2');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '4e420e27-9128-431c-993e-daec5aa4877b');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'da4bd0be-2061-4663-9567-13507067dd43');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '7fbff0e3-dd3b-4659-bbe4-9ece64cf4149');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '5d8f0471-b068-4f38-8d78-de0aeb463a6b');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'b61d726f-0597-41fa-affb-5f410fad0e23');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'c515d407-1693-4190-897d-14c09e0f3ad6');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '279a5a79-d641-428d-b394-7e9b0b900f55');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '4a63da2b-b138-4abb-8ccc-42d6a84659b3');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'd2bbf30c-5fbe-4d10-9484-e149f7624c17');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', 'fb2228eb-9bd4-40ad-b8b3-595a268a6aa3');
INSERT INTO public."BookGenres" VALUES ('d0c01d19-f647-4443-b173-8fb6db6c62d6', '0105d894-67d1-43e1-b917-9b7a51f49901');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '43fb61b8-3e19-40f7-9e36-0456d9e06eb6');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '83380588-2710-4afa-9582-9c6e6ea274ba');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '0e4117f3-fb00-4bd0-862a-dc4ae13f7b4a');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', 'ddab6893-a29d-4a44-b3b1-366f3663045f');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '86589549-4152-433f-9392-cd0565ee7770');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '9c929a3a-3d62-42f9-9b89-9e935f2c2b83');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '09805e3b-63ca-4ae3-bc50-8c29042c6777');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '0b7e75b7-9124-4bb7-9f47-5ef8b15e18d4');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', 'a0be9c3b-6e68-4a9b-92a5-9dbaeb9843b0');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '833f19fb-bcdc-43f6-9c37-278deefdca2b');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '691f59ed-6b4d-4fe7-af99-e7ef86cd00b6');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '6e1c4748-9e75-4727-a7f3-f2a47b7821d3');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', 'abd948d3-1c57-4494-a677-261e3d234d79');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '258e3563-f449-4cd8-825a-37f5c8ca8c55');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '1e0cb820-8359-4269-a3a5-8fbdf4050677');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', '53453169-1534-49ea-a22c-e0226169c2d6');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', 'e0fda348-ee52-4545-8d8b-609104b5992d');
INSERT INTO public."BookGenres" VALUES ('720f9c4f-a47c-43e7-b6ee-0d7204482734', 'cb40caaf-313f-4d19-948a-158e85d46a78');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'c63eaf41-ed7d-4e58-a084-c5a0e7369395');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'c0508316-f91f-4c0d-8b2c-352291b563fc');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '13bcd858-cc78-4f14-8143-309d7f208592');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'd98f857b-83de-4f79-b3d4-0bb56ad88a11');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'b310f710-3691-48dd-a077-fbc0d5d45e94');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'af52721b-5e8b-4a0d-85f3-a92586644a56');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '4bd2692e-8670-47ca-8ac8-f0c23301f550');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '4eef3508-b6d3-4bbd-b8e8-582c3b92ddcb');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '45bbb1c5-ab2b-4819-9bc5-7fbb5cac2f4b');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '593d51f4-5cfd-47cf-8316-51fa4593a842');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '87abd351-cbeb-4b47-97af-c0905029937c');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'bbf0d362-4588-4fc9-be6f-07fbe6d01fe9');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'a73c700d-0657-4765-911b-20f3d0c740b6');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '7465c4fd-204c-4b52-b407-c5c5322a9ac0');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '7a7aac5e-4c6a-4b6f-a94b-802c82951682');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '1b870ae5-4a85-439c-a689-f081bae8c2cd');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '78303360-182b-4f0c-976b-311eed5740b2');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '0d54953d-1255-4133-bebe-5a7ef40a9de4');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '946d3420-f2b9-4b39-849d-113b1e0a5795');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '8720b410-5943-40ef-8478-88cabef7021a');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '5a2b5b9c-cbf3-4274-a8d1-644eb19b609d');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '094a4763-cb27-45e6-9677-ad000ab493eb');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '5f513ab9-bdf3-494b-a96e-5e81321c9859');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '7cb6a802-2b64-4cbe-996e-a8480c2664e1');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '1dbff9c4-09ce-4909-8b69-dff3d6b98dc8');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '7998ac9f-4691-4693-b2df-40e270216869');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '3f3c5064-faa8-43c0-852b-17cff0747af5');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '6284a1f2-4d91-4519-be89-44672e510fff');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'de3b7935-2b68-4788-bc79-6e9a860c3d91');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '669288f1-de02-4de7-8e67-38ffdf55c942');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'b57ba7da-0ee2-4173-a494-b7e7824e7032');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'd18b861c-99e6-4f36-a836-0c8829635f53');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '8cca2a67-b51f-4c64-900b-32c0bdc36733');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '64cbd613-6b40-408f-9e20-4e3bdb227f48');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '87c94031-feab-42ea-a340-6e641dc69ba7');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'a967ed2e-0737-4bec-9f7e-05aff2576729');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '3cec2b7d-012b-4f22-b745-ebd6b898eff8');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '59ec7184-c88e-4cbf-b039-02e51f23c8d7');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '2909eb51-90b5-4cdc-938c-b28e15ca5390');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'e56984a6-8730-4fd4-862f-6c2f3dc07d94');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '700876b0-f61a-4e87-85a8-4fa3fb7e3ea2');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '894901d0-a4c6-45ce-9fa6-1f4b83f255cf');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'bdd70c9b-c681-49e6-97bd-ea86874c955c');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', 'f33f1cc2-226e-4d43-8742-a3c220c0fb7a');
INSERT INTO public."BookGenres" VALUES ('662e31e1-a71d-4ec5-81c7-85915dd52fa7', '5faa9ba1-661e-4eac-b2e4-62f3a1383580');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '3a5de281-e71b-43de-872f-593d46cd09d9');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '12fe7051-fe23-4ca7-9400-e8a48a2dc7ae');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '0cceb704-1728-432d-9d0a-8b8e1de26338');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '44b5a17f-f1b9-4fb9-a6bb-7f21fe075636');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '3864bb33-615a-4cf7-a9ff-a1046ba1c721');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '809943ab-4df3-434e-ba8d-7389ff2ef283');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '772ea0e5-6474-45b3-a31d-9c019678bd20');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '9b1c2b4c-d023-4451-83a8-7d7215b44e58');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '6622724d-6884-4a8a-8d05-a6a884b6bd32');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '9f5677bd-2f65-4f39-8409-cf243ca4bbaf');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '9213bff4-244a-4614-8c73-84c553d14aac');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'cbb4fb8f-9c94-4888-9901-87545ef73e61');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '25cc19ce-b50b-4faf-86f0-1dd60b571007');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '7f8c70cc-34f8-4179-9f14-8a1f9cac01e7');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '1ad1635f-6a9c-4a97-b571-faabd81bd2a8');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '3e7cbda7-8a4e-4d89-8fb9-86eca5cfa1af');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'fa15617b-50f9-464c-8350-4f5951f00cf6');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '782b5086-59fd-4107-a3de-5876a454df30');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '36abbc63-28dc-45d2-8b4c-8c8510acd097');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'de4e8358-32ce-4358-817b-95566c540c41');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'b25ec2bf-a349-401f-b5f5-6ab902cf6aac');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '9d8fc459-af55-4f20-8b2d-0fcd1134c35f');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '335d0030-4ae5-462f-a49a-ce97ee5c5bb4');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '600f7450-d95a-42ce-ba64-3eff97b26400');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '094a4763-cb27-45e6-9677-ad000ab493eb');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '586d8e0e-debf-47d0-bc70-a1e722b2d57a');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '0563ba0a-9cd2-4c33-9c17-cf157785ad5e');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '9ec39c11-4fa4-496d-96ff-d97468087e5d');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'c0508316-f91f-4c0d-8b2c-352291b563fc');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '8996a572-9dc5-4f3a-a958-f99a38f8e61c');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '72818a19-544a-4f9b-88a0-8a337e79da9b');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '7d594326-2aaa-4837-b5c2-9e757ceb230c');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '9e92acd8-c4c9-4fa3-9bea-48230aae6e8a');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '2909eb51-90b5-4cdc-938c-b28e15ca5390');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '1aff102b-772a-4a25-a86c-402b343e2741');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '5b0088c5-c562-4171-aaf2-498a9041240a');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'd77105dc-4f71-4817-8029-d18e10196d85');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '96904489-ae9e-4da2-b777-ab3c23e8d262');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '0d9c170e-845a-4ee8-98ad-ecf8cc9277a5');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'fb0a6242-a8c6-4d9c-a02e-06ea2fb4234a');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'eb8c7ae4-dfb1-4ab3-8b61-024d9918cf85');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'e512f3d6-3ae1-4bcb-a9d7-a1ceadaf3a4c');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '4e806120-ffbf-4138-abba-c8a0fd59ccfd');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '99a0a291-458d-4c82-be0d-26062b9deef9');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'dfd1a23f-a1ed-4c26-bbfa-4674fe9b8737');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'fde78633-d05d-4d4c-bbdb-fb37093e8fbc');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'be43b3e1-f8ac-49a9-9cb1-eca01cca85e0');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'ee2e64e2-d2e9-4379-9545-77fbc0746e46');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'f2a53942-d905-4133-8eec-717098dce9ff');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '33ba8625-4653-4357-b36f-56c2ee736b61');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'ccb04f88-3a46-4e63-a570-0ab755202e32');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '77a55382-1e52-431e-b07a-c42f8d6962a2');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '8b7ccc27-deea-4bcc-9995-c2deaf1e7ff8');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'd41900d9-1a8c-4e8f-b071-74eb5548004d');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'e32dd44b-d247-49ee-83a6-044b1bf903c7');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '9158ff1a-115b-42b6-b13e-8920603615b6');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'db42ca3b-3ef2-46b2-88ec-7eb28cbb4010');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '8b937906-29bd-4241-8687-67d6ceb24b29');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '06695aa3-959d-4468-b83a-d5a776053c6c');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'a989bbe2-7e52-47a8-a7a8-0cfd23587158');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'c5730dea-cb74-4f7f-a391-8ad3cce224c3');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '5cac75e4-a920-4356-9e20-dea6544def4d');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '9b39c41b-0b1a-4ed9-b9d1-c52d7a229c64');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '176375cb-95a4-4740-acdc-6802ef6bd3b0');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '970e960e-a2d1-4bf9-9b8a-9332eabf9fee');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '4c59b7ce-5322-42f1-a734-3dca6e773488');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '335fa8c2-a6ef-4510-b7b6-7727d577fa97');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'eb336560-10a6-48a5-b6ed-c473784aa423');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '65083803-228e-40d3-a7f9-37bda965365f');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '32dc6944-c735-464b-86c5-b1d226b2687b');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'e2308edf-8aa1-493c-b4c4-d100d91ccb76');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'b48f6e81-16ac-438c-8bac-7e42b712c02e');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '527db867-7ea8-4d16-9b10-df69e514f77e');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '4a967319-f363-4e81-9232-8dc95dc440df');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '03e24207-f9b6-4b66-8e7a-fc91a7693d85');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'a8fe7af9-98bc-4f10-83e5-5f4d0ea16e11');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'af7a8ca3-d180-4bb0-8d22-ad1de0c4d339');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'a563c39a-a26c-4a81-8407-915a3cfe3b75');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '233b6d8b-8026-4d2f-8ad4-969433144fb4');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'c00f8a77-2fda-46b9-a81f-2b74b122c9b2');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'eb905dad-660c-4c6a-886a-866104812932');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '989c8276-3afc-43e9-aa75-8cfdff50d209');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '9949d076-1587-4dff-9daa-127f67eeb83a');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'd6c76ea4-0eac-4245-9871-079cb494c5af');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '8d062490-6e12-46c4-bae5-357771babf16');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '76ce7d8e-09b0-4680-93f6-d5ee8a7cdc77');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'ac7351ef-9987-486a-b4c4-0a993b980098');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'c61c7617-b543-4fd5-ae03-18bc93b66d5f');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'ed3aa1b3-109d-4b47-804e-0cab0f4fee9c');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '74d47770-e375-424f-ba1a-a2c5600af0c0');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '97e5aa47-adae-4ac1-ab36-3b1f38f2343a');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'd0f7de7b-46e1-4695-980f-d00ee8a10eac');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '5494dc42-5423-4088-90c6-09646836952d');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '246852ae-123e-4506-8529-7d3881c05915');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'a7c33404-7673-471e-8d69-55a3d34278c9');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '38302df2-5239-40fd-b159-0862b13d295b');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '9dff59e0-6806-4d84-a2b7-eaa85bc09941');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '8e569767-4d41-48d0-98fc-09bcb8a7d7cd');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '4a6261ef-62f0-43e0-aee3-a424a27344db');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'dd3cb838-1bc0-4f04-ac7c-8320d5f4c762');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'fda09d1e-9692-4b5a-9691-a793cd76bd52');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'a50c8085-c187-4ddc-88ba-7935822ec106');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '096ee501-b21d-444d-9a65-545d6ab23969');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '8f945b95-4933-4bab-b9e5-d05c9e4a10ac');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '2bff74b0-4827-41d9-8bbf-263fa2fe2800');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '00eba844-4dc2-4986-b11b-e68a70e5cb70');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '3651ff6e-cccb-47ea-893e-2824577f3755');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '0f19d317-8d06-4d2f-903f-f1cc0ee34b76');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '514b9c0b-25d2-40ec-bd1d-5764f2487d75');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '6b944209-8d8f-4bb9-b74c-956b25514193');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '92acdc7b-48f0-4d3b-a3be-27768503c30a');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '59ec7184-c88e-4cbf-b039-02e51f23c8d7');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '81aa4d09-7d1c-46cd-b1b6-eebd7564d7e1');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '4766c64a-0d72-4c57-acd3-6ec4b72ec70c');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'df72bf67-faee-4d96-8fce-7242224a2d60');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'ccf0a939-c765-4e8f-8c6f-d4f65904fd8c');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'a0b32aba-84f3-4239-8ef0-ba699ad7fb2e');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '51da6f36-3850-462b-bb9f-6044de9a5794');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '83c6ed21-b2d6-44e0-b3c5-3ce7aa5054a1');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'fe734d3f-75fc-4521-8e6d-6ff0fa121752');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', '0aab6125-fbe5-4473-ad80-d19b6e3e9155');
INSERT INTO public."BookGenres" VALUES ('53f9df57-43c1-4a4b-a465-80cf117d5568', 'cf5e483a-65b8-4978-99d5-b0c370bfdb36');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '1986c060-8347-4b45-babf-1072472b29ca');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '0e4117f3-fb00-4bd0-862a-dc4ae13f7b4a');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '622d01a3-30aa-4639-890e-6516118078f8');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '539dcf39-15bf-4c10-89b1-01a96126488f');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '90d54a22-e049-4661-9bf9-7cbefca80d0d');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '99760690-cadc-41b8-9b65-b0ad2a1f32f5');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '7bd1eabc-bdbc-445f-ba98-b3c4fd13544f');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '5ab7eea5-0cf0-4bf4-97ef-2b634d436c87');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '8754311f-ce7e-49d9-a0e0-63b116f3d5fa');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '19d64fee-836f-4afb-8a9f-dd30a5b55f7c');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', 'c60243da-9282-4578-8233-0842646ae9cc');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '2bd31b00-4a93-43d5-b74e-bd8d1accbb7a');
INSERT INTO public."BookGenres" VALUES ('19478760-1c0f-4d20-ad9b-c96ac3040c08', '5b5b9dbc-1ebe-401f-bc51-e9620ceb5b7b');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', '038be3a5-228d-4355-9bcf-467e8fb882f5');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', '353b1657-5621-4e69-a089-da1c435102c9');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', '61fd44c5-ac1d-4831-8b75-0c25b0c249e2');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', 'dbeb061f-7be5-4a3b-98ec-1c1ea5cb730c');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', 'cab060f3-01aa-4b9b-897b-e5af8b876a82');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', '0963acf0-3714-4158-b4c7-5d75d279ebd0');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', '3adf0fa9-216b-402c-b9f7-4e5302b18f71');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', 'd8e6b253-ffe3-4cfb-811c-4b65fe5f9a46');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', '691d1ca1-005b-4c6d-b8e0-0c0b4de96522');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', '273092aa-af82-49b0-8f37-8798305f8b2a');
INSERT INTO public."BookGenres" VALUES ('feab4aba-356a-4608-898d-c115a9c1ee6c', '6e157f40-090f-4357-9e24-63d15d477583');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', 'e40103b3-e36f-4ea5-b467-906e90042741');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '374cc6bf-7956-44fb-9c01-41784ef6f207');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '0d0d0b77-e328-4ad2-875d-7175b698be10');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '9440094a-585d-4c5b-b9b6-2e874bff6d82');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '215d1fa0-8d44-4ac9-ae1f-63a847ed2e44');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '4f185040-3a56-4cee-b3da-6ff9146e86d7');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', 'fc6484a8-1ce7-4c84-b425-b08aeaf3d9f8');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', 'a96869c5-05b1-4b11-b045-d0d4eb12f704');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', 'c17c6c80-11df-4663-8bf2-d7d3d774d0ed');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '50c89f45-14a5-40a5-aab8-6eebd9d5f170');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '0923a249-6234-483e-bd6f-7e25d5662783');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '0e4117f3-fb00-4bd0-862a-dc4ae13f7b4a');
INSERT INTO public."BookGenres" VALUES ('256a01c4-207b-4d86-b74a-a1757e98667a', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'dd39ca5f-9cc6-457d-852b-57df8c8d001d');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'baf4354e-af63-4645-93a6-8f35f000caee');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '2333daf8-3912-43e4-a9f4-d1ebb6b24e58');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '66237398-d154-4441-b599-62aa102771c0');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '8cc8e220-f18f-492c-a729-108a5362d457');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '8cd685e0-0482-4bc8-9e59-391e30e07275');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '7438da5f-e6b4-4b44-942c-8602111ce66e');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'ffce3971-9879-46f9-9d2e-a649f7469359');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '25cc19ce-b50b-4faf-86f0-1dd60b571007');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '0582574d-1663-41e1-908b-8761ad84b469');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '7b020d31-93cd-4fbe-aee9-420252fab61c');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'ddab6893-a29d-4a44-b3b1-366f3663045f');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '9bb8e1a9-35f5-4dd8-b1ab-f5be90cf8b82');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'bd170a59-40cf-4188-9495-2b388c21c5ea');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'da4bd0be-2061-4663-9567-13507067dd43');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '471d1ce1-7475-48d9-943d-15e002c40d60');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'd0ade6ac-592a-4b3f-97f3-610538acd455');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '7e82f27a-4be4-4e81-abbd-7e42b42d2faa');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '54b28dd6-a861-41f5-8995-ce9a909ef159');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '4b783ca4-81a0-433e-a48b-01c9d4332c7a');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'c812b50e-ae99-4ae0-b104-3236dfbd77ee');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '3798f49d-40cb-4498-835c-ee2476443408');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '49575cf7-906e-4969-b811-cc7265fde25f');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'eac00fe7-92f7-4a41-8619-03f7f2df11df');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'bb18769b-8cf3-4a01-8574-7b93bf44439b');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'b2bb8458-0f69-46a7-a616-17d09647d462');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '427bb752-d92d-4f4e-8864-bb58344778d5');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'de6efc86-7766-4409-b2e0-4402c28b0a25');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '5b94e2ad-8312-4f4b-a9eb-eb52c03532fa');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '349aeb36-2c41-410f-8db6-764d13088535');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '705b8baf-47a5-403a-be5f-b7f2ccd1d0a7');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '8bca394c-e24b-45b7-a56c-815acb4e4884');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '8c6aa0be-d4a3-4185-bce5-11f9b6222aa5');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'e36a0ea9-c571-4f3a-a020-65a8be0bf2bb');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '37d9b784-cc12-4148-b537-b4ad7d15d467');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '99bd60ef-f9bd-4205-8c67-1b26905b59d9');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '7fd0043b-77d4-4182-9370-2825884f96f3');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'a4de4682-5858-46f6-8063-85b961625964');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '4a3ad52f-fc28-4894-966e-5cba6cab895c');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'e1ba4de8-dc24-4599-acbc-2644787633c4');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '395948d8-72a5-4503-9b00-3724ca4848ba');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '10bce6ab-d13f-4d92-863c-fb75580d70a3');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '4c212020-29b0-43db-ad8c-cc409154b888');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '606a6749-80af-4256-9ce4-c5882a6ac399');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '160938df-4f6b-46f6-8b80-42fd13be12af');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '06341e77-2861-486f-a48b-c528e00d2000');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '867d82e6-f0b2-45a8-bdb3-8e32a2c0cf03');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '0f19d317-8d06-4d2f-903f-f1cc0ee34b76');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '91232cc1-9681-4d13-8da1-ab3f9c324978');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '3a4567c4-a471-4640-b61b-3a30bae440b2');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'd2ef9d9d-2052-49e3-a56c-7fff54c131ee');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '91602e68-83f2-47e5-8092-a46e5f793090');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'cd272716-0282-41f3-a2ad-8e393fd4311f');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '2534b549-c34c-4d56-883f-6db474f06b2f');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '6de86a13-baba-44bb-a520-a3125b1255a4');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '45ab6e4b-5cc2-4d41-aadf-64fffb7223aa');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '2abea7d1-3125-4539-93e4-0c7c3fd14c4b');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'abd948d3-1c57-4494-a677-261e3d234d79');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'd1f3b191-1adf-4f3f-9ef1-ce8ab465c049');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '0fff19dc-405d-44d8-ae63-bdc9055cff38');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '786ed204-3b06-4cf8-98cf-97ead1594c78');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'ee383fe4-3335-4559-915a-68aa8dbb0704');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '95a79183-733a-49e6-9b05-8d4cd7956d7a');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '3bad707c-e101-47a3-a499-11f5946e015d');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'bb8a7cab-5b6b-482c-bdd4-b39e4665146f');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '85575126-651e-4adb-a7f0-5d056216c3f8');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '8bb53c63-bdad-4358-94fa-928f2a2720c8');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'cac45cab-08c5-476f-bbe1-2d17ae171846');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '7504bf17-33b7-4d3a-b48b-0eb745b68483');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'd2bbf30c-5fbe-4d10-9484-e149f7624c17');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '30048c4e-ddf6-4bcc-96a1-95ff4b84a805');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '02736c4e-11b5-4af4-a0cc-6106854f2619');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'cfc0cb73-93f6-44e8-9275-4dda3abdbd6a');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '0e146ed2-598e-413e-aef4-5362e2c277b8');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'cb39b600-a6ab-4812-ab5a-d7694e326bff');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 'e9994875-9a0a-40ed-a243-d128a1d3eabf');
INSERT INTO public."BookGenres" VALUES ('8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '28ef988c-e0c7-4d0c-9ebf-b7b2906b2014');
INSERT INTO public."BookGenres" VALUES ('d1275694-5dbb-4a90-9a93-649fc1c8a0f9', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('d1275694-5dbb-4a90-9a93-649fc1c8a0f9', 'fc6484a8-1ce7-4c84-b425-b08aeaf3d9f8');
INSERT INTO public."BookGenres" VALUES ('d1275694-5dbb-4a90-9a93-649fc1c8a0f9', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('d1275694-5dbb-4a90-9a93-649fc1c8a0f9', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('d1275694-5dbb-4a90-9a93-649fc1c8a0f9', 'f46c5e10-d1a0-418f-b624-de1fedecfd45');
INSERT INTO public."BookGenres" VALUES ('d1275694-5dbb-4a90-9a93-649fc1c8a0f9', '62206b42-a7e7-4820-bffc-c22faee2f57d');
INSERT INTO public."BookGenres" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', 'f93f455f-bcf2-4bcd-be47-d34e5074c0da');
INSERT INTO public."BookGenres" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', '02bae706-fd66-4074-9eb6-f2bebaca28fb');
INSERT INTO public."BookGenres" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', '757736ef-7e01-447e-bb7b-30a8e5b1f12b');
INSERT INTO public."BookGenres" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', 'af5d3869-94dd-419b-bdd5-5e312be5d8eb');
INSERT INTO public."BookGenres" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', '1269c52e-ee9d-456c-974a-4fc770a07c66');
INSERT INTO public."BookGenres" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', '99c609de-fdcd-4d97-8f7c-eae2fcee637f');
INSERT INTO public."BookGenres" VALUES ('f73dec77-acdd-45ef-86f9-c32abee8f74e', '21c725e3-adda-4800-bbd0-985f0978dc5e');
INSERT INTO public."BookGenres" VALUES ('86f55ad0-c48c-4be7-aac1-a4162ae7aeff', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('86f55ad0-c48c-4be7-aac1-a4162ae7aeff', '37f75d3c-5465-4abe-ab7d-b58ff45e667d');
INSERT INTO public."BookGenres" VALUES ('86f55ad0-c48c-4be7-aac1-a4162ae7aeff', '1933fc1e-e78f-4707-b357-5d4ec796c2e0');
INSERT INTO public."BookGenres" VALUES ('86f55ad0-c48c-4be7-aac1-a4162ae7aeff', 'c9e526dd-8913-4fa5-b3a2-40be5c13cb51');
INSERT INTO public."BookGenres" VALUES ('86f55ad0-c48c-4be7-aac1-a4162ae7aeff', '86d19aa1-6ebf-4680-8364-f16f54b2dcdd');
INSERT INTO public."BookGenres" VALUES ('86f55ad0-c48c-4be7-aac1-a4162ae7aeff', 'c0508316-f91f-4c0d-8b2c-352291b563fc');
INSERT INTO public."BookGenres" VALUES ('86f55ad0-c48c-4be7-aac1-a4162ae7aeff', 'd46c814c-8ba7-4f7a-9793-ca9059b4d803');
INSERT INTO public."BookGenres" VALUES ('86f55ad0-c48c-4be7-aac1-a4162ae7aeff', 'dcf24125-511c-460e-b243-09da875c741e');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '1986c060-8347-4b45-babf-1072472b29ca');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '0e4117f3-fb00-4bd0-862a-dc4ae13f7b4a');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '622d01a3-30aa-4639-890e-6516118078f8');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '99760690-cadc-41b8-9b65-b0ad2a1f32f5');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '24df193d-0b33-4ea9-a61e-74e9dff351b1');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '93e1eed0-12e1-46dd-886e-bf62a920a8da');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '860834b1-94b8-4bf4-9dee-8050c06ed3df');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '90d54a22-e049-4661-9bf9-7cbefca80d0d');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '19d64fee-836f-4afb-8a9f-dd30a5b55f7c');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '3af3889a-086b-4b38-9016-1634cced1a08');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '954e0572-0f6e-485e-8ed2-012bbd91254f');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '5b5b9dbc-1ebe-401f-bc51-e9620ceb5b7b');
INSERT INTO public."BookGenres" VALUES ('4b5f0663-7696-4255-8971-b1c404ede737', '7bd1eabc-bdbc-445f-ba98-b3c4fd13544f');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '4bfbe8d0-f9af-4bfb-b0b1-80744a7f32d2');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '0e146ed2-598e-413e-aef4-5362e2c277b8');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '10a5a8ff-b7eb-487f-af1e-db9016e0262b');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '69d3b08a-af5b-4b44-a311-345ceed2eb28');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', 'ed77020f-301a-43d7-9e88-31a4938a8193');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '6984f997-1898-4226-8e4b-16401adfc780');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '49575cf7-906e-4969-b811-cc7265fde25f');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '43c22f54-89f4-4b53-bea3-7e348f126d2f');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '26ff5b33-964c-4d36-8747-4fc20a3fc775');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', 'e315eeb9-6e21-46a0-8756-120f2d2661b1');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '0ceb85bb-4289-40a9-a514-c8b4974c801a');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', 'cc4afd5c-3fbc-4d4c-b718-4e0d3ec10790');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', 'abca6c73-fa24-4424-9925-fa2c8bc8d5ba');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '645861b1-3a31-4a6c-965e-7a9a00cbbb19');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('5502fedc-0dbb-4645-a92f-7619bcc030d9', 'ee383fe4-3335-4559-915a-68aa8dbb0704');
INSERT INTO public."BookGenres" VALUES ('14728228-cbb8-48d8-9f59-109402188de6', 'a01dcfd5-3218-49a4-b3fa-be660ef3b2e8');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '57b9e1f2-e25c-4588-9cef-235e29e0e1ec');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '41591a59-e547-46eb-b921-ed61948421ac');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '148242d1-1b4d-4e00-bdd4-4e7a3cd5ea86');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'cb39b600-a6ab-4812-ab5a-d7694e326bff');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '4a0262a8-db8a-47f7-ac3d-e42e6cb7a787');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '06341e77-2861-486f-a48b-c528e00d2000');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '85575126-651e-4adb-a7f0-5d056216c3f8');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '6d7c5b84-1c17-4c2f-97ce-141d36b6bc2a');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'ce44bea2-fdca-4122-9a6a-25c1d1161778');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'f658f553-0dbc-43af-83f7-90602972f968');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '5c7160e2-1b80-417e-878c-4d29efb1a30c');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'cb9f5568-5048-44fc-ba69-82931ca31a5f');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '02668f21-627c-4544-ba65-d4618f841dd9');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'a84e4872-8c51-4500-a841-336deddcb6a4');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '9bb8e1a9-35f5-4dd8-b1ab-f5be90cf8b82');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'e7972953-e32c-4f45-a732-3848824ab0de');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'cde90ef5-2161-4847-b6ad-35da25210db9');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '891af7c5-2723-47f9-9f8b-a32a14b09626');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'f5628eb2-a220-42e7-9ad8-e689c92d6895');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'a9ed3c11-6c32-4f01-be70-a5a7fd29b7d9');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '66237398-d154-4441-b599-62aa102771c0');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'ddab6893-a29d-4a44-b3b1-366f3663045f');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '7e82f27a-4be4-4e81-abbd-7e42b42d2faa');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '4b783ca4-81a0-433e-a48b-01c9d4332c7a');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'c0508316-f91f-4c0d-8b2c-352291b563fc');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '167c06b6-018b-40b3-b3a3-66785f9e6bd2');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '323664a1-a46b-40a3-abf7-42c23439a29b');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '6c44a3d2-3ef5-4cd6-a0cb-145dc435a1ef');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '29e4ca27-c59e-4669-853a-ca57dfd3a451');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '5ad38eab-2547-4fce-94ed-b560fa4e0808');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '9fa3360f-0be6-48a7-a4bb-18651889ec38');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'e6744dd2-b40b-4ae6-9d62-211e626ba4c1');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'b792c483-9f51-420a-b8a5-eee4a7f93a3e');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '68471ad8-3fc2-4961-aa7b-a7562717e824');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '7504bf17-33b7-4d3a-b48b-0eb745b68483');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '3e7cbda7-8a4e-4d89-8fb9-86eca5cfa1af');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '0e146ed2-598e-413e-aef4-5362e2c277b8');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '3a5de281-e71b-43de-872f-593d46cd09d9');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '28abd48c-2cd9-4c8a-8fd2-ec0958c25d61');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'f6dae245-1f36-4ef1-99a6-75707b0397a8');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '7002f150-72b2-4c0e-bbed-7c2f0e2322ea');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '94e31621-1562-4dc4-8821-ce4e3626c355');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '00599d20-8008-4913-af89-f947e8491675');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'abd2955d-a459-4912-a6fd-7e3e2fc6aeb5');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'cfc0cb73-93f6-44e8-9275-4dda3abdbd6a');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '28ef988c-e0c7-4d0c-9ebf-b7b2906b2014');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'f7b7b613-4baa-49f8-9169-f2689b3019a9');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '094a4763-cb27-45e6-9677-ad000ab493eb');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '32dc6944-c735-464b-86c5-b1d226b2687b');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '86589549-4152-433f-9392-cd0565ee7770');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '44856dcf-a680-4b84-bf79-098d8acd9402');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '0ea5aaa2-31ad-4350-834f-d5bbb90abc49');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '2c1892a0-6e78-414e-8303-73bbab220455');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '74f2acd2-b5de-4bc9-b588-e5ab6f0be0d9');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '207d43c0-c24b-468f-9ef6-444f3ef252b2');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'd46c814c-8ba7-4f7a-9793-ca9059b4d803');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '972d92b4-8618-48d1-9783-739070e221d8');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'aa1aafea-7154-4ab4-bb34-4b74d282220d');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'c9c031a2-746b-4fff-baa8-26571e3d27eb');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '30048c4e-ddf6-4bcc-96a1-95ff4b84a805');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'fa6b27e6-35f7-4251-b746-08651f47dbe8');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '85358e03-19b9-477f-8975-1f8685b023ec');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '81542434-c012-4352-b81c-413e95b99c95');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '41bd0bb3-29f4-48eb-8ca6-a1c9a03d5d1b');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', '594a6d50-dc70-46b4-aaad-79d65c9c513a');
INSERT INTO public."BookGenres" VALUES ('92f8c5ef-4171-40d4-9229-dc39ad424ee1', 'e2538288-cee0-40d9-af5a-fbd79d0ffdb4');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'f7fb79af-2fcc-46fc-9ef5-dd6f064b978a');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '90d0e6c2-a1e4-49ee-98bf-c3f124296172');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'e4ab899e-816c-4451-8e33-b704c411b6c2');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '09641f85-c0d8-40ca-aec3-def4c159c5c7');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '3ddcabfc-2e14-4611-893d-ce4bdcd3937b');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'eca667a6-7f65-4e59-a7dd-61824ae65b31');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '74e0ec53-ddf7-469e-a76c-b4fdf4ef317f');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '07c27022-a289-4ba2-84cb-e0722262cf7d');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'cfc0cb73-93f6-44e8-9275-4dda3abdbd6a');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'b78c2c0d-e569-4de2-a872-9ad225873efa');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '86589549-4152-433f-9392-cd0565ee7770');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '05d83a27-ecc3-444b-a901-e9a12782ccd7');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'c40de2eb-0201-4584-9041-d4e51de65fde');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'fc6484a8-1ce7-4c84-b425-b08aeaf3d9f8');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '7504bf17-33b7-4d3a-b48b-0eb745b68483');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'a0be9c3b-6e68-4a9b-92a5-9dbaeb9843b0');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'ab405751-4f92-4f03-b2b5-3756104937f2');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '26eaecd1-a1bb-42a8-adcf-0eff93c79dab');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '2dbd0ae4-8205-4ea0-9dac-005ceb479b3e');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '6e1c4748-9e75-4727-a7f3-f2a47b7821d3');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', 'f6b1995e-7b67-4770-9091-906c8514679c');
INSERT INTO public."BookGenres" VALUES ('faeed4a6-1f38-4168-bf7b-c206dd53fe77', '7057b63a-29a6-4fd7-9807-be642a0eace7');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '4f185040-3a56-4cee-b3da-6ff9146e86d7');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'd954f60d-b8f7-46f7-b6fc-91ddb06da0f2');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'c1868189-aff7-43ec-9f3f-9fa4823c08b3');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '243b2f77-73ec-4526-96f3-4c1093315b03');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '0c45c682-b80e-40db-8bad-29b40274e2ed');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '9faa5813-7b13-4be0-b932-019388e86dd9');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '5b4c5194-86bc-4ba7-8040-ad65d9d0b5da');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '9c0350cc-d83a-4696-9178-7ffe0a4a069b');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '25cc19ce-b50b-4faf-86f0-1dd60b571007');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'c9b729dd-7c15-4b29-934a-0ba1ca54d78a');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'fca842cf-36b3-41de-9275-ebfb3188d976');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '924d2b37-a524-4243-a893-b43193b26eb2');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '3cedd54d-0429-448d-bb80-67d8d6516114');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'c9e526dd-8913-4fa5-b3a2-40be5c13cb51');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '323664a1-a46b-40a3-abf7-42c23439a29b');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '8f27dc4f-a038-4b46-99f6-050be37c8db4');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '1d389d6e-a102-4285-a42c-fc698d2aa3ec');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '5566cd04-d2e7-4967-8a59-67bf84312f51');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '1fa85671-75f8-4bca-85e9-2724f47da87e');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '67e38b60-4bc8-44a7-889f-ee1f6299050b');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '430a2f8b-9e9d-4b98-a011-456948ec7cce');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'b1b85744-91ec-4476-a880-6b42b23ab3ca');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'f869315b-27c5-4390-9f6d-05353bc4409c');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'af9e17f0-3339-42ff-9581-45c6e793f3ed');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '122a99d7-82fe-4ee4-bbaa-a2109fbae4b6');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'c9874d83-654d-46ab-bdf9-3f38505abc6c');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '58631f2b-6ab3-42c8-8f66-25720df5d93e');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'a968a317-daff-4c5a-95ed-660c8df9f61d');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', '5ba29d02-afa9-4024-b3e1-6d7b9c2cf28c');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'e2308edf-8aa1-493c-b4c4-d100d91ccb76');
INSERT INTO public."BookGenres" VALUES ('8c2cced0-b873-444b-a4e4-9228c63bd21e', 'ee383fe4-3335-4559-915a-68aa8dbb0704');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '86589549-4152-433f-9392-cd0565ee7770');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '1ab4bb4d-12e9-4d2f-99a4-045be9543b4d');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'a73c700d-0657-4765-911b-20f3d0c740b6');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'eac00fe7-92f7-4a41-8619-03f7f2df11df');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '3b96aecc-5cde-4ea3-8461-5aca9bfc6176');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '8e07786f-ace8-46d2-9368-39cd9c6cb77f');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '14998d73-dcb4-4cbe-99e7-480da6f5f72f');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '6b3709c4-e8cd-4c1d-b559-033ff8171bc4');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '15bbc998-9d40-40bd-9046-066ea86e8093');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '58631f2b-6ab3-42c8-8f66-25720df5d93e');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'b2bb8458-0f69-46a7-a616-17d09647d462');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '4911e7cc-f763-454a-998d-c939a106aeb9');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '2856a193-de64-4983-b9a4-2b5d5869e669');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '0285ebe3-eb93-485a-81f4-c18da91d3631');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'a579f279-d662-41c5-9bb3-2b2f7c71baad');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'ab98f2be-fe42-45f9-865a-01f950978921');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '16075e32-e239-4d7d-8159-285605fa0c49');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'c974d70e-3456-49d6-9779-bce6f0cc3f64');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'd5a6c453-f9d6-4069-84fd-66689489b3c7');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '0b3df91f-d21d-4fe2-b3ae-db7ce2fdd13f');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'cfc0cb73-93f6-44e8-9275-4dda3abdbd6a');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '26eaecd1-a1bb-42a8-adcf-0eff93c79dab');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '606a6749-80af-4256-9ce4-c5882a6ac399');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '60c24b10-7392-46e6-be98-c098e4490a62');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '680da8a8-93e4-4770-a205-74a406f922e0');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '8c215603-a4bc-42c2-9561-9b0159fe91f4');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '0197ffee-ab15-45c0-9107-1d60d7e67510');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'f8683274-36c8-4686-8251-e0f89d4deeec');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'cf03e527-36da-461a-a1be-76eb6c42e3ee');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '947587db-a60a-4b07-ba78-f52c239e4c3c');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '2711f5ad-6683-4a64-a724-c3b01173924c');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'eb0698c5-64ee-4983-809c-085203e35fb8');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '323664a1-a46b-40a3-abf7-42c23439a29b');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'a2ac0cfe-761e-4617-9a03-b400d1057082');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'ffaeccb7-24ca-4f39-8e84-f805616b40d2');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '2335f487-d8ed-4e63-833a-1c78eb2917ab');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '711f5dc6-3cd9-4e21-a019-22189658a17b');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '11ef4946-71fb-4ecb-80bb-e7f80e7f9bc6');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '8bb53c63-bdad-4358-94fa-928f2a2720c8');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '645861b1-3a31-4a6c-965e-7a9a00cbbb19');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '53665eee-a62f-46a8-99cb-103be1a8b0db');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'f658f553-0dbc-43af-83f7-90602972f968');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '0ceb85bb-4289-40a9-a514-c8b4974c801a');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'fc6484a8-1ce7-4c84-b425-b08aeaf3d9f8');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'cd0c42af-7315-49f9-8f67-0722fece4e92');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '75e71e3f-da54-487d-b184-5c4d089ecc83');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '160938df-4f6b-46f6-8b80-42fd13be12af');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '55c2d220-a1c2-4de2-aaa7-cae674c820cc');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'dad52c13-cec3-4276-98f9-e90dc96fea4c');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '02736c4e-11b5-4af4-a0cc-6106854f2619');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '1933fc1e-e78f-4707-b357-5d4ec796c2e0');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '8d9a2343-2cbf-4b94-8dd6-739362d229e6');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '7121270d-8bd6-42f6-80f8-cc611b39671d');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'c0713a58-0573-496d-8d3a-071cac3c39e6');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'd9dc7c84-977a-4b51-b165-37ed3bca21f0');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '805418e9-05f4-4346-ad07-37f024be2f64');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '4cf94467-9d46-4187-9fa7-3614a7d5b196');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'ab405751-4f92-4f03-b2b5-3756104937f2');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'e171a851-8117-4175-ba34-729cf7a28e52');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '7057b63a-29a6-4fd7-9807-be642a0eace7');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'f91be8c4-de1f-4b97-b4e6-dbf072b40963');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'bbb70d64-c35d-467d-bd71-6153c4ae98fd');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '51096f73-c31d-40f6-8b23-d0a1ea4035c0');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', '3b238394-46ce-4358-89b4-3bc3197276a1');
INSERT INTO public."BookGenres" VALUES ('7b6e0ab6-d10f-43b0-a235-543eb576926b', 'b44948fb-189a-487f-a37e-6e1cafd483fe');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '9f98e51d-e678-47de-87a9-dbe04e2b355a');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '45910fcd-7b80-4af9-b010-9344636f48af');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '93e1eed0-12e1-46dd-886e-bf62a920a8da');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '3063c2fc-5e54-411c-8a3f-b3a0b2b6e9cc');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '45e3b7fa-45f6-4e93-a228-383b8436fe63');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '4f207997-a8e6-4729-83e4-3a1e29a3b123');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '61c09177-7541-4747-82a1-7e05d82c9e6c');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '122a99d7-82fe-4ee4-bbaa-a2109fbae4b6');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '473633d3-5fae-4a8e-ab46-5fae41d5b265');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '90d54a22-e049-4661-9bf9-7cbefca80d0d');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '544b4544-4fc3-45dc-a4fb-21117113a506');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', 'a2c12519-26ae-4fe7-ae8d-f45fff1426f7');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '374cc6bf-7956-44fb-9c01-41784ef6f207');
INSERT INTO public."BookGenres" VALUES ('37c06057-0c8c-491e-8bbb-66966da19843', '5ab7eea5-0cf0-4bf4-97ef-2b634d436c87');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '41c3f6fe-a0de-42f1-b3c5-574a3f4f4074');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'eee68e83-f24e-464b-927c-ce45c499723a');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '74e0ec53-ddf7-469e-a76c-b4fdf4ef317f');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '7676e18d-3f79-4272-a0d1-e58de68d9991');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'a4deba97-47c0-4490-b1af-0e3a4fb5c04c');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'eaeab13e-0ea8-4f70-8e57-e0a8021dde93');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'f18987fa-7217-4b83-a1e8-92d63e8a3633');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '69d3b08a-af5b-4b44-a311-345ceed2eb28');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'ddab6893-a29d-4a44-b3b1-366f3663045f');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '6ba48f42-90d1-44b1-84a6-4639da3837da');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '3bd09897-4af9-4b0d-a6eb-d27c1a1d263a');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '769d3074-f260-44d5-a52d-80c964a94c0a');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '9bb8e1a9-35f5-4dd8-b1ab-f5be90cf8b82');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '471d1ce1-7475-48d9-943d-15e002c40d60');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'da4bd0be-2061-4663-9567-13507067dd43');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'bd170a59-40cf-4188-9495-2b388c21c5ea');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'd0ade6ac-592a-4b3f-97f3-610538acd455');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'a0200d9c-31bc-4cd9-b9f9-688ffa37fc7e');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'c1c7e4d6-18ec-4ad5-98e5-76e2f3831fdc');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '267d9135-9290-475e-835a-3f18ae8ece78');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '5ce6f606-f553-4125-a424-6d6afca78bb1');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '504a9a21-b597-4a80-b3aa-679ac9b2de2d');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'e1e3a89c-0513-429e-89ba-7230337bf9d9');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'bf83e135-b142-474d-97d5-f2834414d1e8');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '1933fc1e-e78f-4707-b357-5d4ec796c2e0');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '1f945f71-0d8c-4dd6-a52f-0422733e4edd');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'a4fb1bf8-c31a-462a-a571-5651fa5a99da');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'e06758e4-5c24-455a-85f2-8ebbcdebd5ec');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'ef815797-86d1-440d-ae10-87cea8dd6093');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '244bf6ed-686e-4662-b7fd-c2e4f4c1b8ee');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'd893496d-e577-4f17-9434-ef9eb9fef921');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '012552cd-7fde-4942-966a-e1c18465ce90');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2fac1d3e-9012-424b-8663-6dc71e4a03b6');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'e49ddbf5-03a4-4226-87a8-6633beae6883');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '458764ec-e641-4b4d-ab3c-9e86827f816f');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'dd7fb395-2457-4832-81f6-cf52a5436205');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'a16e3c6f-76e0-49c7-b039-83e127247d67');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '9b9567b1-8eb9-4369-98e1-409b5f54c754');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '888b50b1-1e1e-402e-8b5c-3189114c5742');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '680f309e-beea-42f9-abf1-d0ec87f69513');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'c0713a58-0573-496d-8d3a-071cac3c39e6');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '93aed9b2-2910-467b-9dae-f9ec1f5be502');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '7e82f27a-4be4-4e81-abbd-7e42b42d2faa');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '4b783ca4-81a0-433e-a48b-01c9d4332c7a');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '91232cc1-9681-4d13-8da1-ab3f9c324978');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '30048c4e-ddf6-4bcc-96a1-95ff4b84a805');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '579f9084-e85c-4ee0-afc7-ca48f7d835a5');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '85575126-651e-4adb-a7f0-5d056216c3f8');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '8bb53c63-bdad-4358-94fa-928f2a2720c8');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'bb8a7cab-5b6b-482c-bdd4-b39e4665146f');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '406de749-dbff-488c-be87-1ecee0932e44');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '00599d20-8008-4913-af89-f947e8491675');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'a4de4682-5858-46f6-8063-85b961625964');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '3798f49d-40cb-4498-835c-ee2476443408');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '814cb1c4-a231-455a-844c-122c8e49f5d1');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '160938df-4f6b-46f6-8b80-42fd13be12af');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'fc53b19b-dc69-4a04-82cc-17a6a5c33c9f');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '5edfb64d-b024-4100-860f-5b3fded96793');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '867d82e6-f0b2-45a8-bdb3-8e32a2c0cf03');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '4a3ad52f-fc28-4894-966e-5cba6cab895c');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'bb18769b-8cf3-4a01-8574-7b93bf44439b');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'b2bb8458-0f69-46a7-a616-17d09647d462');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '427bb752-d92d-4f4e-8864-bb58344778d5');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'de6efc86-7766-4409-b2e0-4402c28b0a25');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '5b94e2ad-8312-4f4b-a9eb-eb52c03532fa');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '3a5de281-e71b-43de-872f-593d46cd09d9');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'ee383fe4-3335-4559-915a-68aa8dbb0704');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'b084e60b-9dba-42ee-9335-a634a1a2768b');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '927691cb-44a0-47f8-9fc1-ee487c81eeec');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '8402ec03-6e22-4e5b-8214-de599036b032');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'd2bbf30c-5fbe-4d10-9484-e149f7624c17');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'ffce3971-9879-46f9-9d2e-a649f7469359');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '669481e9-1a01-48df-962a-392553430839');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '0b3caccf-5af7-4fee-990d-9a76b6b2cf2d');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '28abd48c-2cd9-4c8a-8fd2-ec0958c25d61');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '06341e77-2861-486f-a48b-c528e00d2000');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '5c7160e2-1b80-417e-878c-4d29efb1a30c');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '3bad707c-e101-47a3-a499-11f5946e015d');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '9e826827-57cb-47d5-8d1c-416c2861d272');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'b7f817b2-9240-4fee-80d4-e6a18b2a3360');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'cac45cab-08c5-476f-bbe1-2d17ae171846');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '0e146ed2-598e-413e-aef4-5362e2c277b8');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '9fa3360f-0be6-48a7-a4bb-18651889ec38');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '7504bf17-33b7-4d3a-b48b-0eb745b68483');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'cfc0cb73-93f6-44e8-9275-4dda3abdbd6a');
INSERT INTO public."BookGenres" VALUES ('2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 'cc5004d8-55c4-4234-9ede-5988d8c419c4');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '895e54fb-b36f-49ea-aac8-fefdfbeeeaff');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '953331a8-b2cb-4ec8-af1b-124af191fee5');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'd8f83420-33db-4ac6-8677-c8e8d03e3da0');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '1ee31537-b6f5-43c1-9b35-8e97af70d5fc');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '06238e54-816b-46b2-9ca9-0b7fb5bcef4e');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '2d230270-0c93-4e70-9663-bde3e5e55859');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'd639df18-f98c-45ac-9138-ca38414ce717');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '8536f628-39d1-4d64-a6d3-589ee3b2c897');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'c221320a-9c0e-4d32-8d4d-8d97d4154f78');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'e8070efb-d6e1-4fea-81aa-bc1f9ea0076c');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'c1a1e9f8-1167-4bc2-9e9f-8059e9adfe2d');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '9e92acd8-c4c9-4fa3-9bea-48230aae6e8a');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '0e4117f3-fb00-4bd0-862a-dc4ae13f7b4a');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '91546b63-235c-41fc-9793-9d04b389312d');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '39aec451-86fb-4917-a324-35571ff7ed5e');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '7b88fb8b-a829-46ea-8b95-0d6d0fbc0f62');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '021348eb-a00c-4267-be7d-21381e2c341e');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '20745054-b8b1-4877-af12-2157e46c6537');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'b3602001-5772-425c-bbd6-ad23e625feaa');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '38c46bc3-737d-42a9-b21f-afabe2c86e6d');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'b6d19174-7924-4fc5-8d03-1c235e16ec74');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '01f6b1b2-e59a-43d5-a9fc-d8f8db65f7ed');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'cddb0a26-205c-418b-9408-0c203e5eb4ff');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '323664a1-a46b-40a3-abf7-42c23439a29b');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '71748651-003d-4d32-953b-47574c13ef9e');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'ba98e4bc-5c03-4e9d-a412-8f6ae19436df');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'd69adc92-1c7b-4832-827f-ee4b4b78a5bd');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '6416b625-2553-4f8f-a36c-200cf2ec3f1b');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '411fbf45-327d-400c-8d43-ae98358b344b');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'd1903e2d-d764-4bb2-95de-6b99db78fdb1');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'a901ecff-f76d-4aa6-8e79-2953be47e6b2');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '02ec6670-296b-48a2-b907-1c3fe8a1b5c6');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '1291a351-c0f5-44df-b4d7-bb8f92eaefdc');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 'dcf24125-511c-460e-b243-09da875c741e');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '9bb8e1a9-35f5-4dd8-b1ab-f5be90cf8b82');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '31fbefac-aa56-4213-abab-b2ab0d362b54');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '50910fc0-353e-4b6f-9b95-f5635aea2267');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '907ddade-4fab-4def-88cf-63ee11ce5249');
INSERT INTO public."BookGenres" VALUES ('b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '596750ad-4896-4f1c-b03b-0d80c0bcd113');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'd1f3b191-1adf-4f3f-9ef1-ce8ab465c049');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'aa07364c-6256-4fcc-b1b0-467000cba389');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '66ac7858-ade7-4ecb-aaae-e23efe1f06a0');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '92e199fb-2826-4ff4-9a9c-897903eb02af');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'c20c56c5-610f-45c1-96c4-1ef334b4b84d');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '33c9626a-735b-440c-afa0-b5f61fb3e8d9');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '945fae28-677d-4397-b155-bf11745bb3bc');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '6c44a3d2-3ef5-4cd6-a0cb-145dc435a1ef');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '139d15ac-3887-4ebf-a3a9-13edafdcde8f');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '9dbc320f-0170-47e0-b62a-dd2f57e929e8');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '4936294c-1215-4ccd-b10d-a0c707879d8b');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '094a4763-cb27-45e6-9677-ad000ab493eb');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'b713f0cd-67fa-4b0c-bbad-118eb97dfdcd');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '31c7f713-afb2-4146-af79-27fe5ba2127e');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '07cda38e-8ea9-4f5b-ab4f-d8ffb2b707c4');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '24e87472-17c4-4a7b-aba7-4ad387834ef7');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'fd2ab3e4-ed11-4cd1-8403-a0cf6240442e');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '1ee31537-b6f5-43c1-9b35-8e97af70d5fc');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '07e0e56f-99b2-41bb-8c32-26875583e221');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '3d66f004-fa63-44db-9421-23a7a662fd0a');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '17f5ddf7-e527-4928-8e7d-c123794d2c48');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'e18a9ddf-c57d-43a2-bf27-71f5262f31f9');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '51c9bb03-fdf6-4651-819b-d83989f213d8');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '8eebfcc8-c3be-4384-9292-be0299e8b5dd');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '06a88466-abae-4538-885b-aa75ebae0f5c');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '460eec26-7295-437a-a2b3-9e753b29c422');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '743afa82-3bc1-4348-8562-544465217874');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '6bbe4ff6-74d1-4a99-bffa-2d65643e47d3');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '18e879af-f43d-4708-acf4-94485068d6b9');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'e1c9c4c5-2825-4fb2-b34e-903104981c3c');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'f9844933-9c1d-4c18-af9c-633008454f08');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '51da6f36-3850-462b-bb9f-6044de9a5794');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '0e4117f3-fb00-4bd0-862a-dc4ae13f7b4a');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'b7f817b2-9240-4fee-80d4-e6a18b2a3360');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'b6ae3a21-ec54-440c-8788-b4cb0751c6a3');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '77d212fa-3e49-4f4f-b56d-bf2bad3add4b');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'c0713a58-0573-496d-8d3a-071cac3c39e6');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'c44e9602-4900-4a58-a17f-f9dc2ce00782');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '905aa81b-42a5-400c-ad3a-6330e8372ad8');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '7008fc79-c327-436b-a595-518dcfad5de9');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'f0fdf179-7bad-47da-a9ef-83abb8ba1cfd');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '0fb9f19a-4cb1-4afc-a410-b24112a77ebb');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'f6dae245-1f36-4ef1-99a6-75707b0397a8');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '1e0cb820-8359-4269-a3a5-8fbdf4050677');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '1c5eefe6-2e57-45a1-a199-5730bbe3c062');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '09805e3b-63ca-4ae3-bc50-8c29042c6777');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '69d3b08a-af5b-4b44-a311-345ceed2eb28');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '9a6f8d92-f4e3-4af8-aeed-ebcffc98ad8d');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '1463a20b-699e-4747-ae32-9614110cae74');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'ad70cb6d-13f7-4205-b827-30cb87038fd1');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', '7057b63a-29a6-4fd7-9807-be642a0eace7');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('205b3854-f644-45f9-8c12-2791bbcf9b62', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '205ef3c1-3853-4d75-9120-3e665cba80c7');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '749cf7f2-ebad-4f34-b532-e2c905d0b1be');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'c4613ea6-98b9-4be0-94fb-2ad76c7faa13');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'a8915ebc-05f9-4052-9a2f-a451a2fc761c');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '4d0d1975-0f27-4ef0-8e00-b77788c5983e');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '5025f731-83b7-4e6e-b5e4-544966091f92');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'c17cfe55-9af8-4f0a-a21b-c43c14660301');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '17490108-2fb3-4b11-bf5c-6f0b888bdc31');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'c544958d-040f-428a-8920-ffd44682b1c8');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'b6459003-28ba-468a-a35e-c11d73e202d6');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '548c9fa0-ce09-4116-8b58-bf0aac121f20');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'a9e13c08-cecb-4c72-a20f-4141bb555de2');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '2d230270-0c93-4e70-9663-bde3e5e55859');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '2e04e8af-af45-451d-ab2a-8c60b94136aa');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '42b1e28f-4f30-4ae4-8b56-05bcc609ba2b');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '16fa7aed-5df3-48cf-9c22-e331ebf7af4d');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '86774d7b-9bda-4e25-a5c3-aaaed3a6b1b1');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '396056f8-ff81-428c-b7d2-70d5c18f3ae0');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'c9b729dd-7c15-4b29-934a-0ba1ca54d78a');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'b007425c-7f36-45f2-bf14-7215fdb3772e');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '07cda38e-8ea9-4f5b-ab4f-d8ffb2b707c4');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '50910fc0-353e-4b6f-9b95-f5635aea2267');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '7598d430-833b-4732-a154-1ce6b72e3089');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '7e82f27a-4be4-4e81-abbd-7e42b42d2faa');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '54b28dd6-a861-41f5-8995-ce9a909ef159');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '4b783ca4-81a0-433e-a48b-01c9d4332c7a');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '56d06f24-a691-4797-81f6-df18821f7d05');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'c812b50e-ae99-4ae0-b104-3236dfbd77ee');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'f55e62da-7fd7-42dd-b2cc-56fb36f5cd1f');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'ffae25bf-449f-4f4a-97fb-6ebd2a3a2f4e');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'eac00fe7-92f7-4a41-8619-03f7f2df11df');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '6ddc74d4-51f5-4b97-b62e-7e5034b9c53d');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'dfa9e611-1589-45a9-883f-063a54f69fe8');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '1434329f-664a-4d3f-8738-1f8b7d4d24e6');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'a901ecff-f76d-4aa6-8e79-2953be47e6b2');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '1bfc8eb4-cd99-403d-bcfb-67ca266ce5b2');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'c435896e-d393-4df3-a3c8-3a475c39260a');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'e8070efb-d6e1-4fea-81aa-bc1f9ea0076c');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'c221320a-9c0e-4d32-8d4d-8d97d4154f78');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '157150f0-6055-4608-9faa-fefe890392c4');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'cddb0a26-205c-418b-9408-0c203e5eb4ff');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', 'ba7ecc6f-1159-442f-ad83-0c021065b47b');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '93ba62dc-4001-4840-81ff-1c741b7a4c4d');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '3cd233c3-4107-414a-a662-c03f929a3083');
INSERT INTO public."BookGenres" VALUES ('58380636-2b87-45b0-8529-b4e568eb7ace', '3114fc7c-38ec-4e94-88e7-7d50acc9fe53');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'cab3f6c5-96a1-48aa-8528-67d307b96723');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '5a87ce25-b34c-443a-9da1-d17df3b075b4');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'a503563e-285e-42a4-b893-a8d601f0d4e0');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'be4ac263-0323-4aec-87bb-21cb563a6273');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2c2c26c9-f8a5-46c1-a005-71172d3af1e2');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'b56f73b4-efab-4c0a-aeca-b8e3f208ba9e');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '78c411f8-e4ab-4ab8-85c0-74ddafaf77ad');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2a5e2f89-65b8-4de8-8260-a8fb12a71c1b');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '4956708c-bc25-4367-93b4-3c8cb8a80d86');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'd9289c5f-9ee9-464e-83e8-069fb4377174');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '1e53eb7e-d549-48c4-8f90-832711b2d71f');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'f9967296-c11c-4c7d-9e98-64f2a4eae325');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'ab405751-4f92-4f03-b2b5-3756104937f2');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '1291a351-c0f5-44df-b4d7-bb8f92eaefdc');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'afa55b48-4bc8-4dc8-8e57-95502d23eae9');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '93b244ba-6269-4ce5-b943-d4d08df8b7f7');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '5018ad06-b832-4166-8e02-6f0438491f77');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '1914da5c-2149-4e88-83e5-9b7bf9557627');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'b7f817b2-9240-4fee-80d4-e6a18b2a3360');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'f18987fa-7217-4b83-a1e8-92d63e8a3633');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '3b023a47-2b1e-4a7c-a6a3-dc92c046df92');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'f9a958db-e2d1-4033-b3bb-388432128840');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '28ef988c-e0c7-4d0c-9ebf-b7b2906b2014');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '19e7bb6b-c2c4-4369-b3bb-61a1e56e0d88');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '81044bb1-07a9-4899-a053-63131eb36bac');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'c34e0df6-a40e-4acf-b441-6ec208d16bab');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'e8c2eb0a-f402-4e8e-802d-10357d8c038f');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'c09ec4e0-022c-41e3-ad64-ddc7c7214750');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'bb9b61af-ca90-42bd-abd0-833d7027139d');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '3fe28cf8-9f8e-44a6-aba2-6e564951287d');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '69d3b08a-af5b-4b44-a311-345ceed2eb28');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'a7745e13-8a3a-4f2f-b26a-ce7b580ecdb7');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '90b1db10-a3d5-4ba3-8297-b81e5c1e700c');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '9b863328-3153-4c01-80b5-41ae8835d83d');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '13d61bf8-1c12-4e1c-9770-75bff4bae4c8');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '20745054-b8b1-4877-af12-2157e46c6537');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'f087508b-9b83-4945-a946-b3415f803e9a');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'a9d61075-8957-4823-bd7f-2c041b34d656');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'b2f8aa73-6050-4da6-8b86-ce9f1431b9e2');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'f23d0032-9c17-4b2e-a7fd-7177298b0ac9');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '971b33bc-ed41-4acf-a5d0-6124acce1150');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'f6975dfb-77db-49ea-abe6-9664c52836c5');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'ccc4809c-a972-4002-97cb-efa9014ce255');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '9fa3360f-0be6-48a7-a4bb-18651889ec38');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '6217af07-943f-47eb-83bc-3df759c5902c');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '71748651-003d-4d32-953b-47574c13ef9e');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '8f27dc4f-a038-4b46-99f6-050be37c8db4');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '8069a18d-693d-4b60-a693-e7be3378c462');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '0c79b356-75cf-4e09-b8c0-d4bd438f7e72');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '8bb53c63-bdad-4358-94fa-928f2a2720c8');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'f6bc5474-ddae-4c37-9c15-2a49628a7e6d');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'f658f553-0dbc-43af-83f7-90602972f968');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '70f7c8f8-3384-49cf-8e91-79cc1c20ddcf');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '5f787e48-142e-4ad7-b0a8-e3396ffd41ee');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '71d8b7cc-0a4b-4f88-8272-e011f13fda87');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '3a5de281-e71b-43de-872f-593d46cd09d9');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'ede3297c-9c56-4faa-be60-c85cbc202d34');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '06695aa3-959d-4468-b83a-d5a776053c6c');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'cfc0cb73-93f6-44e8-9275-4dda3abdbd6a');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '4e839033-55e1-4062-a808-50246de7eae2');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'b71d64d9-6ed2-4ac3-bac5-e8832427e231');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '976271cf-18de-4833-ab83-a66fff272132');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'b47d455c-e695-4d62-a7b7-51e1b712c992');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'd1903e2d-d764-4bb2-95de-6b99db78fdb1');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 'fcc7a1c1-7afa-409f-8404-5740a4b763a2');
INSERT INTO public."BookGenres" VALUES ('81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '38c46bc3-737d-42a9-b21f-afabe2c86e6d');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', 'd3e2980e-8f9e-4f17-a789-113d970d8593');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', 'b0e6e7d9-e7d6-4c88-a605-c9fa7aef6bab');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', 'a324162b-fc37-48e9-8d96-c9ddf9f2197d');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', 'b3519fa0-b955-4b0f-bb72-1c99824841e6');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '857c8a88-73eb-476a-baab-b2c249ccf49e');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '421d1cb7-dd6d-44b9-aec8-dd5ff37b16f2');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '25cc19ce-b50b-4faf-86f0-1dd60b571007');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '8d45ef9e-113d-4989-b6d1-c34808ec256e');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '9d25da3c-05f7-46b5-b3c2-0896974a9c16');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', 'a1ddc63b-fe60-4267-914b-594b377ea2a6');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', 'fd957e12-8b88-4dd4-af25-e8a30941ad66');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '004ef4b3-7a52-471f-9490-839ef6cf854e');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '69d3b08a-af5b-4b44-a311-345ceed2eb28');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '59ec7184-c88e-4cbf-b039-02e51f23c8d7');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', 'a0170595-ec26-4bf6-aa86-d1be427c359d');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '74fdb84c-a78f-4954-863c-2f485960a9bc');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '689bedf2-a419-4161-b240-c2addb25f384');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '629b391c-cfbb-425e-a643-b786ffc3d48e');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '67e38b60-4bc8-44a7-889f-ee1f6299050b');
INSERT INTO public."BookGenres" VALUES ('4b111f06-9433-4128-8f1f-17e76b8ad1fd', '9e64f8ae-8ec5-4b0b-aec4-bf45aeb5418c');


--
-- TOC entry 3498 (class 0 OID 17433)
-- Dependencies: 231
-- Data for Name: BookIsbn; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."BookIsbn" VALUES ('71fdb489-b149-4a43-ac56-b54cc9d8212d', '987654321', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('d3b60ccc-223c-4b63-930a-cf64070c8475', '504163355X', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('16e65cfe-8fa3-4509-9c58-f149206aecba', '9785041633554', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('b0fc9901-9560-45fa-8f72-47288be0c0c9', '9781668021064', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('0d18cecc-e4c5-40e3-8613-c2f8ba5a960d', '9781501110368', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('bc7ecee4-fa1d-4960-843b-658658b7056c', '9898800984', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('ba770bfe-2222-4840-a795-0b8cbd5c6c96', '9789898800985', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('5fc762af-cc23-48f6-acde-10e54a77d921', '9781668055960', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('bc9f017f-3464-493d-b754-267c7435e017', '9207488921645', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('14a273f7-b1a1-4f17-ad1e-3d1c5b0fa515', '9781501110375', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('05aa8337-9112-40b0-a02e-7c13e657a72d', '8820072947', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('bcfb4e8f-f6cb-4af1-93f2-ae98e7287038', '9788820072940', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('d0fa62b5-ff3e-4302-95ad-f232449cb6dc', '8408258362', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('7a6eacfb-9e2e-4fec-9dde-c805fc3b24fa', '9788408258360', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('bdd37ffc-b6c0-426b-a23b-8b9255774b8f', '6051739939', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('3307d6ac-6abc-4dd4-9a7d-047480a0ba48', '9786051739939', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('233c89bc-c8fe-4051-a2d2-ea232d875d7a', '3423740302', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('ea358904-1518-4346-9421-15cc09c8ff36', '9783423740302', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('1c748a5e-1d43-4ba0-a196-a3e05fdf013a', '8501112518', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('f13a79cc-8417-422c-8a0e-b4495a0fd2d9', '9788501112514', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('7ac65a2f-e6f0-4c93-9f93-cea772453760', '9401910553', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('a2e3848a-29cd-42e5-be26-a9eadc624243', '9789401910552', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('b181e308-a106-4d1f-9482-4fd987e776ae', '2755637080', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('f5cb1d9b-7b94-4677-8b8f-089a5e412714', '9782755637083', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('eb8767cd-8bbd-41a1-bff2-7bcb412ba41f', '8501113492', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('376907ab-ac02-46e8-8592-e53019829561', '9788501113498', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('15058a0f-2be4-47ad-b30a-a828a93d034f', '1432899791', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('82d9b3dd-7b20-4ccd-9ca9-40f3e6cea535', '9781432899790', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('6940596e-48dd-4568-b128-946592ed4a56', '1501110365', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('1a70f1ca-affa-4761-8737-5456c0f79198', '6070788141', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('22a32ac2-00cb-492b-9ea7-101c20b767f9', '9786070788147', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('8f3870a0-f0b9-4ec1-990e-d37dddebeff3', '147115825X', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('ad6b7578-eb3c-4b43-bd25-828c46a44f1e', '9781471158254', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('e1bee849-0c9d-49a8-81c7-c0d4719b335e', '1804228206', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('c8d1548c-b050-402c-aae6-b77483631f51', '9781804228203', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('30a13ff9-d218-449e-9d68-c760436cd1d1', '1168123011', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('ca0c82f9-66db-496c-9f18-09c6fd251770', '9791168123014', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('22bf0f0b-8859-4968-8372-c33547285775', '1637839715', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('3cdb4442-16e8-4d89-a62c-c7ecf899117c', '9781637839713', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('ddaf1b80-58f9-42d7-983b-fe19a909b1d8', '9781471156274', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('b6825771-0655-4cc4-a965-3669beaabe6f', '1501110373', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('7aed8251-48ce-41c7-819f-ecf504f0b5a5', '1982143657', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('75bfa8e1-bf66-4f06-87cc-f1652af13b50', '9781982143657', '99251f46-c7d2-4392-b160-20340b8e5602');
INSERT INTO public."BookIsbn" VALUES ('6a75f88a-2702-417d-9bb1-378462ad1169', '6555325372', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('deb54602-4fb2-4e39-8567-91f2be21c0db', '9786586733501', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('69164d84-f868-4ba0-abef-65fdee8a2761', '1781103232', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('8e171ee6-b6e8-4121-a848-b15f740d834c', '9781781103234', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('caabfdc5-023c-43c8-a8b5-897b5ae595e9', '9781781103685', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('b246e421-18ac-4d36-9f4a-d54846b74006', '9750802942', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('0b911ed0-6c93-4b7f-b2d0-50db0b58483e', '8204086601', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('f8735de5-445b-4299-a16f-f9c4e07918e0', '9788204086600', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('2bc7e3ab-ba36-4efd-bddb-c7d7b7d4d1a1', '8983925329', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('51ae3613-876e-4204-bb66-896a42fe0447', '9788983925329', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('76bcd2c6-b129-45bf-b5ef-73cb590c9a65', '0807281182', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('b752a55e-54f1-4b07-a901-016999fc3419', '9780807281185', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('d74c0942-d570-486f-8965-30bfdd0b2f17', '9781408855652', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('784fbca0-ddec-4f2c-b6a2-efe69764b26c', '0590353403', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('655e16d6-fc15-4b65-9d7f-e6f4f1b75d04', '9937813700', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('8ca3e5d9-79b1-4493-91d5-9b6f67426d17', '9789937813709', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('f7f61556-ca38-4ef0-9c25-c59fcadd21fc', '9798855115574', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('c99c31cc-d054-44cd-940a-04c112539aea', '9781546148500', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('e3f6f419-d634-42c8-8dfa-bb2828e8f315', '3551313113', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('1ebd98bd-3bb7-46e3-ac8f-763216710b04', '9783551313119', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('455879cc-d02e-461a-a918-907728e9549b', '9129675359', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('04ea80e6-7506-4817-bd75-8365eeaffb0a', '9789129675351', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('9c8fdc23-2e79-4585-9066-fa2a7c1969b8', '9934112248', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('10ef1578-8e1c-4cf9-b530-a0123545db1b', '9789934112249', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('649707bb-aac0-4145-b1a7-3a2303b91065', '7020052932', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('081b960d-e6a8-460a-9372-3629623f7291', '9787020052936', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('226d9835-1d43-4d01-ac11-c12d8b0ed9df', '8372780005', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('2d0fa4d2-f987-4986-80f3-e51cc02398e0', '8380087593', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('2fa5f77b-5d4b-41c3-8b1d-d1a46ddae132', '9788380087590', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('6efb6fb1-9329-4953-abec-40fbbea6438f', '9788382655636', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('0b856f64-d4ca-47c3-98c2-f599d3ed346d', '9783551317254', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('71bff9df-b9d1-49f2-9b9b-a09de4a719f3', '9788000007885', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('0ec04a12-dc76-4046-b170-f0d2e7a966d1', '059035342X', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('d1ba85c3-7013-46d0-8f30-ffdacc4d7502', '9757501956008', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('e8f7f560-e415-4f5c-8dc2-3a333bdaace2', '3551553009', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('12498952-3ac9-4b39-a265-a8a3da996bc7', '9783551553003', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('00efa919-df06-4013-a107-fd6ca8856283', '9780807281956', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('d57d49b7-51d4-4d8e-82ad-162b5e5154a5', '0807281956', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('c231d8bf-a009-4f53-8662-9b998e6bbe6e', '9781524721251', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('77a63e55-fa63-489d-863a-e42f7f12697b', '9780807286005', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('6ca37ebc-de3e-423b-97ec-619291f90718', '9782070584628', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('2880b7ab-0a2c-4be8-93a3-3921a1008ff9', '8498384389', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('dc191568-3043-42da-b640-21015068f961', '0747532745', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('8c6ca826-e6cb-400a-b7ed-082e30f87bc6', '9781781101315', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('bdb60e71-6efe-472d-9738-1eb02bea162e', '8000011085', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('891091d2-1687-4bd7-85aa-d19e1b7cab65', '9798855115550', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('d5d6a219-2ba0-4da3-be57-b3fffd7f077f', '8862561687', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('c473289b-ea96-4eb9-81cf-740b770ca6e5', '9788862561686', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('5e2fe1a8-ed28-48f2-ba31-002a2bd1bebd', '9798890981882', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('60decf63-99a4-427c-a81a-6348de30b013', '9781536489378', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('c6d32290-9d45-465a-9f4a-a2f67b35993a', '9786073800280', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('159aed21-1d58-4a5b-9c66-9bced90f3d04', '8418173009', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('ecc8cf7d-ba50-4da9-bf82-f8958eddd661', '9788418173004', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('fe5adf49-41d9-4c89-a91b-ee955fdf42bc', '9722365541', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('b2a2d0b6-d139-40b9-a55d-162422f86959', '9789722365543', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('f4de3542-82cd-437c-a8d0-8d847610e875', '8532511015', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('b7c38e5f-887d-4593-a638-9e43babc7520', '9788532511010', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');
INSERT INTO public."BookIsbn" VALUES ('d2d6f43d-4561-4ecd-8cdc-df6d4ad8e5eb', '9781398518162', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('cb639a18-ce59-47ce-9b44-778eea14aaca', '9786070796746', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('a764a9bc-2330-45d0-aa22-983fffad3c74', '6559811395', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('446840a7-f773-4078-998b-b034a5596ccc', '9786559811397', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('2270539d-44fd-48d1-a81a-be3ec009c294', '3423283114', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('184926ff-19ce-48b7-b1d7-2149d68f4d2d', '9783423283113', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('50988c8c-e35d-4dc8-90b2-31c02643f766', '9781668009918', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('2a784921-2559-4336-8b24-9c71a79e8f10', '9781398518209', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('9c2d0f8a-4820-48f3-a105-5b1c32567dd4', '9798885792202', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('ce56d653-96f3-4099-bf2e-75ecc6186084', '9788381352079', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('8712d864-b7ab-43a6-9361-8f49d1e4b994', '1668001225', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('4d6b67ea-f4d9-436f-a776-b500f62ca8e0', '9781668001226', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('b0406aab-7063-42dd-a762-ac868b28bd68', '9798885780513', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('13fc2454-9d8f-45dd-be89-1e825931dab9', '179714510X', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('42710c85-0922-4ed8-9871-40e3029e1f9a', '9781797145105', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('f07ee9ae-13d3-4e20-8501-7a191d2de0b6', '9781398518179', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('ac896ca0-2414-45f5-8d0b-31fb48d24dc9', '9781668001233', '548b7c15-2d60-4ded-bc9b-7261432c2e05');
INSERT INTO public."BookIsbn" VALUES ('da75dd0a-5959-4486-a95b-428b41a0f674', '9786070793677', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('d1bba913-9bd4-43ce-9aa7-a6482e523866', '8408260502', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('6601ec3b-a4c0-41bf-9fc1-3a869b2b2535', '9788408260509', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('5de6b7e5-bb0e-48c1-8c31-8f0c4a9c7a11', '9781735056654', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('b33d6a75-5ab0-4d51-8239-8c12021ff046', '9781728274867', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('8b117131-cd65-4cf0-a27c-ac9be6362a09', '1957464038', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('e614e979-ac69-49de-b849-c012da44d97d', '9781957464039', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('554cdc0d-2bf4-4c8f-9b91-7fe1f7812043', '9781087939278', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('589f2543-80d5-45d9-a86e-94ca0fd1e9c6', '9780349434278', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('98b015b5-e667-4a65-bcd6-ebd822285cf5', '9781735056678', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('0f8a2a74-6372-4c41-b16f-459bb893edfa', '1735056650', 'd0b0c6aa-de2f-4024-be19-5634f878b933');
INSERT INTO public."BookIsbn" VALUES ('b82c99ba-f287-4952-b21d-92c805071608', '9788418196508', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('de6902b6-2584-42c3-af0a-37a106110ff8', '9780006479901', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('d8d44c68-5af9-446f-893c-51c61053a0c2', '8556510787', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('46a1e615-4679-484c-858e-0d7fb20ca048', '9788556510785', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('6343e788-73a3-4167-b739-7fafe4171110', '6051735755', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('389ea394-e1a4-47cd-8ee6-bb65d7a1918b', '9786051735757', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('8fe357b3-10d0-4953-8752-8d8905872708', '2756408522', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('7ac4eee3-2d86-4ead-ad98-954d0a070c4d', '9782756408521', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('d96f3a0a-1dce-4322-be47-a7f746b3cdb0', '2290107093', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('933a812e-0c21-45ff-b79c-ef812cf14537', '9782290107096', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('59e85224-e14b-4ec4-b678-c1034f353749', '9788401032424', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('21a83884-8cb8-41c2-8c34-5472cf2b7dd8', '9781514256220', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('16457358-a0b7-418a-b837-220394594734', '6073107749', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('bfb78028-73d1-47a0-b4bf-c0361779a3ca', '9786073107747', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('523b3c79-b981-4316-a83e-e83d95b6e93c', '8496208915', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('58ec6235-8f0c-4e81-8a00-597d6aaa1edd', '9788496208919', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('fabe98cd-fdc8-4f73-bb79-69fefd83a877', '9506442274', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('cf622de5-d630-4cad-ba50-d57281f6d96a', '9789506442279', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('a7450593-c4bc-42f7-a0fc-1462433c2fff', '6073150474', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('7f30bfeb-12fd-495d-aa74-e3ad18a2dea4', '9786073150477', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('4fe8ac5f-a6e4-4ce6-a000-c791c49870d4', '9588886430', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('95d23b72-9759-41eb-aa06-3d508aea9434', '9789588886435', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('a3eae36c-7e7d-4b6f-881a-13bed4dce129', '9788496208490', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('606c19aa-d1cd-47e5-90eb-07422060abce', '8496208567', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('e2b5ebd5-515d-41db-a185-c5169d929c6e', '9788496208568', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('2782dff4-3cc3-49ff-80c8-51250f7fc47d', '9024558859', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('2ee94ef2-2ca2-4705-87df-4559e88b5418', '9789024558858', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('e3c2a97a-6172-43d2-944f-516294cbc36a', '9024556430', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('c6a75b10-af9f-46ff-b849-7590b8e8edba', '9789024556434', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('0bcb1cb8-7127-474a-8c08-2e90de532e0b', '0593158202', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('6546548f-1200-4883-857b-066d6ae21c49', '9780593158203', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('5c3539c2-dad4-465a-9553-c4eb6dcf8066', '9780553573404', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('e20717c7-6248-4fc2-9b7a-dbfc43b9497f', '6175381785', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('59ef4dc1-89ab-4a2d-9be4-62c32c44f036', '9786175381786', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('41c6c4e3-f648-424d-8c72-271796b40980', '9789669482716', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('99c797c5-847d-471c-8555-5ebf6e61a188', '9780002246576', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('dc2302e4-1965-4e1a-89f4-12f45054fdf6', '9780007876440', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('5f54f4cd-528b-4b8a-b707-44e27d07015e', '9780008147785', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('0d7d9b66-7d7b-4a88-8bd7-1dbff739ffe4', '275640215X', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('d725d6cf-9344-4e56-a2d9-ce052eadc6ee', '9782756402154', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('c73a7fcf-f2f6-462e-8c6d-4552c78b9eb8', '9782290208878', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('919a496d-68ad-4ee3-a5f0-c3cf1b362441', '9780008226343', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('2b852a87-b885-4650-acbd-8af5c2bffbfc', '9780007445714', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('d699869b-9135-4051-acbc-1918d48bbd41', '9780007491575', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('7f49b13e-b09c-4079-8a8a-a2add249d54a', '9780008220587', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('393d44d8-4aaf-422e-bd58-0d5d73555e9c', '1644736136', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('27946a47-bce6-4356-a243-9d9f9b24775a', '9781644736135', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('3532b754-c772-4098-84c1-6af0f19a7fd7', '9944824356', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('64c5a1c3-2df1-4566-9b38-112353dddadc', '9789944824354', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('c9ff0f4c-b1b6-4326-a0f5-36738372a463', '6073128835', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('4f7158bb-2022-43fc-a7f1-b6e36db1ee43', '9786073128834', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('ffbdd1a3-8d45-42f0-b078-effea9295f82', '6055069075', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('0e4013c0-f598-4b53-a7ea-9cc6d6b69c8f', '9786055069070', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('8c0011db-9f18-4c8d-ae4d-748e51fafe61', '6055381591', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('d2906774-43af-4f51-af2d-83fe303a64a2', '9786055381592', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('1eba581c-2010-4a6f-a28e-a90e2ac3eff3', '8804478020', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('98fc6c4b-293a-4c40-bc65-38a9fccc960f', '9788804478027', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('c1143753-6e17-4865-a7e3-7d667b50fc68', '9788377852101', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('29076003-c7aa-4d56-88b8-627c9f6d9047', '0006479901', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('eb346687-efd5-433c-96e0-947a87148315', '0553573403', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('c2bc4730-f76f-4b6e-8ab9-bd5a0bb3f481', '9782290019436', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('ad09e545-1c79-47a7-9a62-f556cac169aa', '0553381687', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('913c351f-f403-4f17-b34d-3c309cf1cf5c', '9780553381689', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."BookIsbn" VALUES ('909eb999-9703-4ef7-9451-31ced9383d77', '9752121764', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('3da37d60-624f-4f86-8717-627dfbcd452a', '9789752121768', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('1d8421f1-f789-45cb-88d8-914780272125', '9781473666931', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('53304f69-abc2-4a0b-aa83-db6a677cf3c5', '9781848940871', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('7baf9217-b136-4a98-8e84-b4b00877e9af', '9780340951644', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('291f0431-4bc6-420d-92d6-0df85f8a6f6a', '2277069043', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('7a103981-a7a3-4760-bf5c-e62f4133b95f', '9782277069041', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('d9f084a6-d0b5-4f33-927d-012ff6919e2a', '0451159276', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('47311ea4-3540-4d50-a02c-e0232db11150', '9780451159274', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('351b1dfb-70cf-47c8-8809-198e1160ccf8', '0451169514', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('cf63e4df-378a-4ea0-a00a-212f9d979e5a', '9780451169518', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('9bb57e5c-87c9-4650-9612-3bed24ab18b7', '8378858510', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('0c13176c-bc42-44ea-96ef-6d18424243db', '9788378858515', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('b8d57d0d-2543-422b-ad76-346b03d0c39c', '8466357300', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('b7e0c9d0-527f-4e59-a936-fe936647c83c', '9788466357302', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('8ea2a93b-4970-42f3-99bf-71b0a21dcc6e', '6073157061', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('d1192cb1-a6a8-4757-9ee9-63aba13e6ad9', '9786073157063', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('4b4e073a-762c-42a1-a960-33160829516b', '9669931754', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('408f7f83-8ec2-438d-be73-902946b50d71', '9789669931757', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('ff3b4101-7ff8-4617-97e7-07f366f70316', '1623300894', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('22479ac6-1c6e-44c9-b36c-919f4e61240e', '9781623300890', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('97d8e439-f423-4876-9c46-e39b201fedc7', '9877253194', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('0addc2f0-4893-4aa5-af51-5a6e9b37112d', '9789877253191', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('cd1cf5c3-015d-49e6-9219-ec1b7c784ac4', '9783453129542', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('1db4219c-fab2-4fde-bbc8-0b9a8e651c0d', '9781982127794', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('5ff937a1-c403-481b-9aef-fd2cf907b37b', '8868365626', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('8eb0c92c-0811-400c-9fcb-a188f4634a2d', '9788868365622', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('4a6a2c82-e531-40be-bba1-0f78ae68fe21', '9788560280940', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('28363950-bb69-4f72-a48e-898636f48578', '2253083364', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('74d16eb2-666c-4b01-9854-d94544fb55da', '9782253083368', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('528b5d9e-fecf-436c-a42d-63448c9cf2cc', '9788873398639', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('7e6cb98e-c14a-4260-86ff-6769bef61103', '9752119271', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('9f8af9e5-0e8b-4802-826f-8a15165fcb46', '9789752119277', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('a6d9e747-1783-4ec5-9eae-e0c76052bd30', '8466345345', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('e3cd6bfb-6138-4a22-a3f9-84d1d8589a76', '9788466345347', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('fce2096e-34f6-44cc-99e9-8798279d4af9', '3453504089', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('073a6f13-4ee0-410f-b9ab-48e49f266907', '9783453504080', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('c92ce594-3bce-4f82-9b38-344a06f57976', '8466347925', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('ef73e4b1-bb97-4c5f-aa1b-5e2567934266', '9788466347921', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('28649b5f-d12e-4daf-8c48-465b39a1eb99', '1508297126', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('f5823663-9fcf-4d2a-9c66-a0ac6aa8b9d6', '9781508297123', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('ef346dbd-c428-468f-b9ff-22201aae3a96', '150824412X', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('7744bbac-a6c6-47c9-a299-da5ca37f167d', '9781508244127', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('0d7501ba-e513-4799-9f9a-3e0247a55a6f', '9024516137', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('d0f14aac-56c7-4348-b35d-37a97d07b48c', '9789024516131', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('4cdd97c7-47f2-4600-94c8-fff1bb56a673', '9877250241', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('d842e600-369d-4c3a-9eb6-4ec0e157cfcb', '9789877250244', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('45a3e0ad-0c43-459e-941a-1f147069f739', '9781501142970', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('bfe3b9bb-0cad-4c9a-9a35-d11aa230150e', '9781501168895', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('44d74439-07a4-4d1d-9461-6dcd02f125ae', '1982127791', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('582ccf1a-587d-4384-ab5f-26d602bd4f13', '1444707868', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('3982e1ff-b6ee-4b4c-9f83-77b6fd1baf38', '9781444707861', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('7000e432-84c3-4ecc-ae13-7d2f6ca13840', '9788497593793', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('b530da15-08ad-4e26-852d-d287c08eb7bb', '9500406977', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('37a60963-f655-41bb-b395-ecd9d90d5149', '9789500406970', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('1e392d1f-3ef8-481b-a283-595c463c8b19', '1501182099', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('a26756b6-d256-44ed-9f71-d5d0d3c1ad19', '9781501182099', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('f7766af1-38c8-46a8-a99f-acb87c1172d5', '345343577X', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('51dd0ed9-a274-49b5-bbe0-2e8d67823d72', '9783453435773', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('978b1179-b853-46ce-a903-ba15866b6c6d', '345309994X', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('3ae994de-e591-428e-baa6-10849d8c2a72', '9783453099944', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('25129190-a6a4-41d7-9b99-00096f8e1242', '3548256112', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('0bf9ea37-af55-46e7-b85c-eae237bb3d2b', '9783548256115', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('f67df299-0e20-4b44-bfe9-0159268bb0e6', '0340951451', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('1b540642-5468-43aa-9366-d35f827faa30', '9780340951453', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('3863ca38-c8c8-4045-bee7-dfdcb2d1e8f4', '1508217114', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('d22c249f-dab2-4013-8923-0da99425afd6', '9781508217114', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b');
INSERT INTO public."BookIsbn" VALUES ('7aa3fe68-bf0a-42a3-9e19-57996c3bb9f4', '9781957635002', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('3636c3ea-a604-44f1-8027-d4006e8b7c0f', '9781638932918', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('6e6dbaa2-56cd-44f5-81c0-fb86632fdab9', '9781638932468', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('1b3ebac3-37ab-4e7f-be9b-37c7918213ab', '9798364882387', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('2fcd3c38-9432-4c8d-9443-a2aa61c29d6b', '9798683546595', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('c21763e6-62a7-4745-86c7-d93bcaf0b90f', '9781957635101', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('af2b7c86-82c8-4c58-b7d7-ab6a1fda6855', '8419421898', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('fdaded42-df8d-432f-855e-d43963debe5e', '9788419421890', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('43a71fe8-b841-42c6-b433-61b011c0d41c', '9798454848842', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('153155eb-bbe6-4e11-ab94-f17f3a802e40', '9781957635088', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('c36db378-254c-4591-b1de-7a8da9d4747f', '1957635002', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."BookIsbn" VALUES ('578b9326-3ef1-4e58-a94e-89060a080c5d', '9044364855', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('8fee5ad4-7db7-4497-bc25-4ea160e5c79b', '9789044364859', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('e410e683-d4bc-4dd4-b864-785bedfd5f68', '8418945508', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('216da9d6-b8b0-447a-9861-118e3407ae69', '9788418945502', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('0e8061ec-dabd-4cd0-a241-50ab5f3f4580', '9789899096486', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('d1fbe808-8cd2-4440-a34f-a0ec70922864', '9781408734254', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('61585838-6ee6-4691-a74d-5a2694e083ab', '8820074052', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('47690179-eb56-4879-940f-5ab5453148f9', '9788820074050', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('7bf30b3e-07fc-4f8e-afde-fecdfcf3ed88', '8418945184', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('50590b61-7c26-4576-9568-3834d61465f0', '9780593336830', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('0eb26ce6-bcc9-4f37-a421-4da3b6a71990', '9781408725764', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('4956a69c-596c-4ffa-b36f-8e035af5ac2b', '1638082154', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('9f923ac0-b3d7-4d73-a3d6-f637bfc76a68', '9781638082156', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('b407edd0-d9d7-4b65-94ab-6bbd633be0e2', '0593336828', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('5393c9b9-bce4-49d4-95df-3d982df50181', '9780593336823', '961f3c72-1485-4d78-bad0-20a54e8e5c88');
INSERT INTO public."BookIsbn" VALUES ('cd6bf879-7da0-4e75-a742-3e48bc8d8681', '9504953387', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('cd67c289-b32f-42b5-8ec2-ea16168e8e49', '9789504953388', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('3766e4e9-8fed-4554-ab11-39bb96d4dae1', '9786073913195', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('d89bb873-91fa-4655-bccc-22e8dc1173dc', '2732485217', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('38ca5545-9337-4f33-af8c-3c7b5ff5b271', '9782732485218', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('eb156de9-23c3-45ad-8b19-80de20233d8a', '9669822750', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('f95757dc-da97-4cda-a77e-f65787d3f5b8', '9789669822758', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('da003707-1e06-49c2-aa4e-b649d0a20dd9', '8408257110', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('a9469707-c06e-4f18-b343-51d39462b0ae', '9788408257110', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('41e3789b-b10d-41ac-b291-5631525dfbcc', '6050940622', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('96a8a9f6-d02a-4544-9425-35858c761f28', '9786050940626', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('f332fd32-befd-4885-9566-2b3bff15065b', '1804225568', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('eeaf4eb0-c417-4afa-af71-374ad637ab3b', '9781804225561', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('6f5c46e0-10ec-47a8-909e-c6df491697b8', '1681192713', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('01fdad6a-d6c1-4791-bd48-1b3f4daf85d7', '9781681192710', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('449dbc5e-edc6-4408-959f-da75a99d28be', '8328021757', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('0c84b717-e167-4786-805e-be75fb18dfcb', '9788328021754', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('cc06c4a8-92c4-455d-a127-45daf2b035b2', '8408170007', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('4e66054a-9d43-4b4e-90cd-31bde3fd6711', '9788408170006', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('a45d6319-467a-4a4e-abc3-94869b31bf0d', '1408857898', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('90237f70-0c01-4442-95c1-5f3b08bd47d3', '9781408857892', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('5e51cdb5-1c3c-416a-84e8-1efa70d07d19', '8501076600', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('1d58050f-80ed-4fac-a0ee-72fd12f9f907', '9788501076601', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('b6822f3d-20cf-4e58-9ae9-86e4ed84b03c', '3423761822', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('2539e542-7ca8-4d2f-a99c-7fbdf7d897df', '9783423761826', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('10d90431-e25e-49ce-affa-0615f8cf67a5', '342371879X', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('98f0867c-9d15-416d-ac2c-090d208057a5', '9783423718790', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('a226efc8-3cd4-4083-a5c0-dbfe6566ecb8', '1526634252', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('c1d3e268-5c86-4ff0-8a9a-9e2b3fe8d167', '9781526634252', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('4e4f95dc-6694-42bc-989e-00a7b4e4f990', '140885788X', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('effbbedf-5b76-496e-9ea3-c9fd82bee573', '9781408857885', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('d9637d48-fcfb-4768-83a0-cf0387f417e9', '1526617161', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('47cd164a-0024-406a-80c6-c2f7d0463188', '9781526617163', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('7bcd3dfc-6bb8-41fc-b4c3-02d18505b150', '1664434445', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('370144d8-b91b-4785-9498-6425fc638564', '9781664434448', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('11737024-5eb4-4074-9b1d-426c12dabad0', '1635575575', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('66f5817c-4706-4702-bf12-d6f419cbf23b', '9781635575576', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('131e5cd1-3d3b-4e45-87d6-ed25aabe7efb', '1619635194', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('97448fe8-740b-46a7-9991-a3c2af8082e3', '9781619635197', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('7542531c-db60-4153-b3df-30c619509e9a', '1635575583', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('9e8429da-ae50-41d7-a243-0b19cf7273b3', '9781635575583', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('99bf8ba4-522a-4807-925a-7c1c57a0c734', '1619634473', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('12479e8e-9441-477c-8d18-90b9f4f2615c', '9781619634473', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('6c0ff4b4-4288-4bda-9423-76214e5518c5', '1490638210', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('05c3c630-1854-4905-97fd-711a7c39eadc', '9781490638218', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('5c4112ae-4d0d-42cc-ad05-3baac0067474', '0606405623', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('165943d7-7acd-4a2d-8e60-0cc86fc4ce2a', '9780606405621', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('254bc4ab-bd24-4a68-8a19-810e761d1f63', '1619634465', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('80c8b9d1-09d8-429a-9070-13e47a240efa', '9781619634466', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."BookIsbn" VALUES ('61dccdef-a44c-43fd-8792-bd014f2c5caa', '9132160496', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('e18a7524-0aab-4ff5-9eca-30fb5931d7a7', '9789132160493', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('6a26e9b1-63d0-4150-8f9e-7d0c9b52f8fa', '9020679864', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('b393f24b-b79d-465b-bee2-02a550ab5b50', '9789020679861', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('6a27f879-34de-464c-8aa1-02ad2c3622e1', '9781742378206', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('abe6ed46-032c-42fa-a75d-07112fa481bd', '9781283363501', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('d365e3b0-48dc-4c13-a380-92eabe21fa47', '9780008660239', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('9cb23e8c-a4e0-40b1-90a6-4f72eff01ad6', '9780008673376', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('91d3c9ed-6921-4047-a300-0dc49871715e', '9780008700133', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('e6eb029a-4511-4d59-8935-420b0db04c15', '9798885798532', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('80add752-4a3b-4468-b40d-e1f3d1a9a698', '1761066730', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('610d0010-d56d-43fe-83a2-c3fc64197527', '9781761066733', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('b818b32a-a12e-4e0a-8ac5-94fb366990c3', '9780062184788', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('d6317629-77ce-494e-ac9e-e2c3a1364258', '1982529210', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('60c7d994-36a6-4d15-ae3c-1c582d90665e', '9781982529215', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('b5722675-0320-493b-8d70-825b3b3baea0', '9780062942128', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('c35b2da5-5117-4b36-ada0-b9df5d018c70', '1405291753', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('d7f00436-3495-4133-88ee-60449a80e03b', '9781405291750', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('e23dc95d-5476-4419-a600-e7d756ceb8b6', '9781484481097', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('cdca6160-5e00-445e-a40b-63c5f892cb95', '9781780318684', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('75e32f35-ce51-478b-bbfa-39b61f8717f7', '0062085514', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('5ebeb249-5846-435b-89a0-2732be6d25b3', '9780062085511', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('bd438f79-535c-4733-9004-cdcbbf9acfc4', '006274173X', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('19f6a3e5-5065-42e6-a7c7-c03b86a57466', '9780062741738', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('23b4ae60-cb3d-418d-af05-b7726c36adbc', '1982529202', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('badd73ef-0448-4b14-8b2a-cf089dc21073', '9781982529208', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('dd46bee7-52f2-4cdd-8ed4-7eb6fec074ab', '0606268685', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('d153c141-771d-4475-8c1b-bcf9a98f130a', '9780606268684', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('6ddfce12-d583-4252-b6cc-a821de760855', '9780062085504', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('52e83fb7-e504-40bb-803c-d82f5e2bf2dc', '0603580653', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('325f3e46-28d0-46a1-9956-d3e20ede4d1e', '9780062085481', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('e72d433e-bc14-4aab-abf0-a15f5f794b72', '9780603580659', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('c7c24be2-c93c-4fae-a8d9-46af28fe2a08', '006211123X', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('b9bc75ca-8e5e-433c-9569-4a5359084303', '9780062111234', 'c533b55d-0907-492a-817b-a6a889ac13fd');
INSERT INTO public."BookIsbn" VALUES ('8e896609-ccc4-473a-b29c-e8016c26245d', '9788845269110', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('f89d7635-7563-4050-bcb5-7e9991cba953', '0062502174', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('1d78d34d-6c51-4a54-a3d6-bd89c71e7334', '0061122416', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('361bb10a-11a6-437e-a8c0-7c3a73d65e2c', '9780061122415', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('2f462582-44dd-4b37-8d08-4cb3671cb29f', '8477201447', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('2f7aaab3-2858-4ca5-becf-710627981690', '0062315005', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('cc712911-5535-4c4c-9892-bba0e9ef9028', '404275001X', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('d4e6eaff-07ac-455d-9fb6-621d1d893f01', '9784042750017', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('c9734931-0cc2-4fe2-afb2-9689969ffe54', '9781869409258', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('d3a03af5-f351-4326-802d-ad60b139e29a', '9781776710676', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('752028f4-10ea-40fd-9bcd-11e9933adab4', '0062439995', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('8131b44a-93b3-4f9a-b90e-522e31d64d04', '9780062439994', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('a45fd7be-a7e5-43ea-aaa1-719ada3057c7', '8845226573', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('35daa83d-3833-49ff-9a35-bd25618984b9', '9782290258064', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('ff336e28-cb98-4000-b8ce-0f8aac1bdb85', '9708103004', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('d060ff2c-3824-4c85-a568-d3fe698a8e96', '9789708103008', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('d9acd62a-9e6e-4d12-85a4-8b2ceb9dce58', '9029511966', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('b9c5031c-ccc8-44d5-adff-1b8bf1b80576', '9789029511964', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('eb086f5b-5042-482c-be51-fa83bb2d079d', '9780007487943', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('5bbe0e4f-de8d-4d68-97a5-4f1b2f43f191', '9780062502537', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('e1442ef2-62f7-4727-a0f8-36aeb1c5f837', '1616570288', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('72798aa6-db13-41f4-97ec-3ff33cc1f637', '9781616570286', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('74f836d3-89b1-49e2-a680-8ef453452ed7', '9780062416216', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('56fd20e1-ac57-4148-a8f3-b4ae59f43ca3', '8126401907', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('990eddf4-9280-40fd-b926-b79366c71e63', '9788126401901', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('721fcb0f-0f59-410c-a5e6-54c0c4bb30cc', '9780061160646', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('046ae52a-0b03-4858-a557-fa4ba1c45eac', '0008140235', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('87b3c65c-15f8-46ad-9e61-6480b871e609', '9780008140236', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('aa725b4f-919d-4657-88f7-391e4e6b25f3', '0008283648', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('a51468df-350d-4e72-8a99-ef373a5432fd', '9780008283643', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('db1e3ae5-3292-49e2-b3d8-3b57e2e9c89a', '162765657X', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('8103eb7e-8fc2-4251-8e46-acfc1105c863', '9781627656573', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('c6d5df57-f0fe-49fe-acdc-4c4f08b67e08', '0007529481', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('ae8b1922-6df9-4739-ac7f-14358befd3db', '9780007529483', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('02061ad7-70db-4588-9220-b5ae3646d675', '0007492197', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('a6e76d76-6258-4d91-99fe-25a5d3aa36e5', '9780007492190', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('8973c874-d6e0-4e4b-9e85-47139988d18f', '0007233671', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('3ec6dfee-dbfb-49c3-a148-fc79e1fcb7c2', '9780007233670', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('fdf69f1b-afe6-4395-aefd-e51f2e021a7b', '1547099003', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('4efd901a-f62c-4571-a041-2d7b4d864fe7', '9781547099009', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('422a260a-6611-421e-8257-f6abd14d6f6b', '0007835396', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('d729759a-d0f9-43da-b105-6d1aa28801f0', '9780007835393', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('0f134276-b213-4e18-80f8-87029360b83a', '075697271X', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('eadbbcdb-43b0-4960-adfe-1b2db5bfe864', '9780756972714', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('7d684e69-67b2-4317-87f3-adc5f51ebe9d', '0007227655', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('514cec74-d4f5-4485-87a9-de4a71d7cfc3', '9780007227655', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('3c2135b3-acbb-424f-acec-cedd1ceeb2c2', '0007174365', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('cafbcc0f-578f-4f80-944b-2af883a7caee', '9780007174362', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('5ae19d7c-df02-42eb-a5f7-7ce69ac6925f', '0553476580', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('eca42a4d-e54b-4dfc-aed9-95d0066e121f', '9780553476583', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('5e59cc51-1d02-402e-847a-40eaee8ab932', '0008172641', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('83370eda-77f1-4b7e-8d21-977f1277255a', '9780008172640', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('504407c0-6b6c-4e0d-9c2c-fbe3a3db52e2', '8584390677', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('268c3a5a-003c-4a46-bf44-74cd4f8dd32c', '9788584390670', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('e50e5de1-3db3-4586-84aa-e96a3657f305', '151900611X', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('9b016013-7b98-4ff6-8988-49a69366459f', '9781519006110', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('622c7820-9bba-4e37-822e-e279524da954', '9700514579', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('bfe65a98-8a84-4b32-a775-60c27bd985a4', '9789700514574', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('42618f11-53a4-4b90-8f48-51bc75a2b4f2', '8422662558', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('321cf910-4314-4f30-b197-43cc5f203287', '9788408045076', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('08aaacbf-ea90-4119-aad6-fc8a99249676', '8423964485', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('ccdfb871-2995-4fba-b6bd-c384445f6af5', '9788423964482', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('a4fec57f-f1fb-41cd-a5fb-17058ef77526', '8408144758', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('7ad4f9cb-1de5-432a-9b96-084e2132dd9d', '9788408144755', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('0630570e-864c-49c3-97c3-7629505f60c1', '8408130455', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('8a8e5ebe-454d-4dc1-830b-1186c38873d6', '9788408130451', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('1ad59a93-ea41-43e0-a0e6-3d56e5528282', '8408080660', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('af6d8c72-6724-4b2f-aada-aae9aa402d4b', '9788408080664', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('bfab4bff-f7e3-4dbd-9aeb-e39acb72891a', '8172234988', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('329609c2-e063-4e54-8fc6-44e842dc6a36', '9788172234980', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('9ab9f1a9-d8fe-46c5-8a30-8e923422c0e1', '0008144222', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('681c3800-424c-4e03-ada8-39ec2df915cf', '9780008144227', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('cee8ff8f-fca6-4b3c-be1a-d8255779750d', '006019250X', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('2765311a-d3c7-4bda-8d8f-dab425d3538f', '8390423022', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('5bc390a5-c3ef-495b-88db-5a0723323546', '8391723917', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('97a739dc-6e17-4bbc-bd57-829070b42d4f', '2910188132', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('232f2b73-8c56-429a-abb8-a55bcbe901cd', '9782910188139', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('42973457-7280-432b-b3b6-1e8388b25a42', '2290141208', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('c1d2ffc3-4e89-4ecd-b993-6e4c05e50e2f', '9782290141205', '6045772b-8f73-4558-ad45-f58632352975');
INSERT INTO public."BookIsbn" VALUES ('11a06d35-4b26-4538-b4bb-0a91ef1f405e', '9781976304699', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('bc0b2efa-6449-42a6-a595-3fc832ab843e', '9781987679359', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('5bb29d5d-2930-4718-aac1-216e35d05459', '9781517514181', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('62fb4de3-dd8e-43d7-95ea-b1524fa5d1f7', '9781717012890', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('eb8e6b8d-e4b3-4fbd-a33b-cd2ce5da03cc', '9781530044351', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('95dd32f2-405c-45ca-ae77-3da9774dbcbc', '9781530043927', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('c295be70-0525-4e4b-b70b-13d229a392ab', '9781535061766', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('4aa08f8a-52df-41e7-a65b-fae90e09e84e', '9781986607766', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('ed230418-3276-4b0e-8107-602ab16c038b', '9781987598384', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('5a833eba-5773-49e8-b798-a8c43de1ddb1', '9781537775050', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('a66285cf-692b-47f8-a715-e9997550cb78', '9781522932376', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('2d0b0c85-a36f-4249-8a34-8fc44bece646', '9781530644049', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('15785d44-cb90-4dfc-8a3b-794b178ad515', '9781517277703', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('c1d0568a-a5b3-4af2-9a8c-baf259c755cb', '9781979644358', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('ba746243-df09-4192-8383-14098ffa5380', '9781964960005', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('a857cef0-d673-4442-9dd6-bcab48705e5f', '9781964960050', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('4962b499-f044-414b-9655-3546e51cfe94', '9781802633900', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('e99bdd97-c459-4cba-a8f0-f4312c0e7315', '9781477550380', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('c35a532a-a304-4e0c-9122-2612ff2d9ec5', '9781477550182', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('c7c5ef43-be82-40dd-a951-b559f053248c', '9781503241312', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('60bc6606-920c-48e1-9dbd-c2bc481d18e9', '9781717012227', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('b1c895db-a0ad-4e31-bba0-8b794a4ceb24', '9781530036097', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('3daffc44-b1c3-4ed6-8a9d-d5b8d06eca16', '9781514223000', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('8a086d30-ba5c-4468-95a5-ada68d7b356e', '9781512393934', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('c757bb19-eb6e-4a0d-91eb-6cc7227107d7', '9781979898614', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('8c77f08e-a917-4c00-b1bd-ca2a1f175494', '9783962725297', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('080ecbc5-2dfd-47b8-ae86-e7ae8f8c2633', '9781388730925', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('ee301104-781b-4db4-b36c-41450d1051c7', '9781320829731', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('9a688587-caec-48ac-99fd-1ccef4cb99a4', '9798485404635', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('a89b72df-80df-4bdc-a8c0-7557c5f392a9', '9798594919693', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('78355612-ca39-4b59-bf09-32e56e3f3e70', '9798732781649', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('af8fd2dd-cbc0-4670-9036-78b9afd45733', '9798528164908', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('1630ea7a-7a1a-4be2-87e8-65a7c7d74030', '9798599858768', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('b0913a66-bec4-4177-b80c-4fa872ca93ca', '9798589924183', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('b237a5fa-b47e-4aad-b273-317e255c9999', '9798528142388', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('2d6d571c-25c5-4fb0-b8e8-80be7a6eaaca', '9798664304275', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('aa74a8c4-153a-41ae-8ae4-20a19e4e63ab', '9798747349483', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('0c0e390f-be76-423b-8f45-1d9c9d6a0dce', '9798468865927', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('0695e8a4-588c-40a5-8041-e0dbe9442674', '9798472370790', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('80003d46-dab0-4162-9335-2a12bc7d0ccf', '8804719133', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('c5b90f67-f88e-4aa3-b2e7-e591ed576a8a', '9788804719137', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('cbefcca2-7a55-41f9-b56c-1355d6ba8f90', '8441440670', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('90cd14a3-d304-4dfa-91ea-ec2934f9aed2', '9788441440678', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('3e0fcef4-5516-4e5f-a278-6cfffa97ae89', '8429753214', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('d4190615-9715-4fc0-91e0-a1ddac093310', '9788429753219', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('a7682d99-0bf8-4c2c-8a0f-89c6cda3b377', '1606406981', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('54c4be62-0024-42c2-898d-f0d0392e0425', '9781606406984', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('56cbfb60-f779-40b5-9f42-319e5993b266', '8412270517', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('cb70b988-b84f-4dfa-b7a7-7992035978a6', '9788412270518', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('3862f6f7-109f-47e5-a9d9-44a7f4ed0463', '9798443126265', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('4ee6f42a-82e6-4f43-a7d3-ea41a4d95d34', '6586077699', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('615620eb-6601-4103-b567-3b74179b2977', '9786586077698', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('5f218d1a-5bc4-44a4-8df2-860ef080966c', '9389053730', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('42729fc1-9fe6-4b31-88e5-028df52f58eb', '9789389053739', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('3b1aab74-1a15-4003-8bb6-502d08ca7003', '841825226X', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('69bd0ec1-751d-4ea1-b2a1-92d3e1987649', '9788418252266', '405d86f8-9b88-4b15-b164-dc2fd1b10476');
INSERT INTO public."BookIsbn" VALUES ('543807b9-05a9-4545-a8df-7e2bcdcf16c7', '2380821313', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('dddf7ea1-5586-4fe4-af09-808d00339ec1', '9782380821314', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('7319658d-ab99-4ff9-b63e-a3ba34ce6caa', '1460756126', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('504186da-9a5c-4fa6-981d-92cf334d6f1a', '9781460756126', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('b641a9ba-ce0f-40fa-bb9c-3dbcc0153c76', '9781101934722', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('7ecf7961-64bf-45e6-8a7e-7866a16c47ab', '9781101934746', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('702ee130-c7ee-4bb1-9c1c-0718a134b537', '8542209338', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('b2af11ce-e7ee-41bc-b6cb-27df94c7e16a', '9788542209334', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('35d7398d-9819-4bd7-b6a0-641b67e6bb3e', '6051866108', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('55e76235-6b49-4669-a524-3057248701ab', '9786051866109', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('cc79c2e4-1119-4888-ad4c-e9bbe33a99d7', '8490436517', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('0dc6c127-7a20-4bab-845e-be7597454561', '9788490436516', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('ae29cd38-2a4f-41c5-b99b-3876d90f4fb4', '3733504151', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('83244af4-6fe0-4342-bfc1-4c8c6056ef03', '9783733504151', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('02881853-f2e8-457b-95f7-14b3b4b3b966', '1101934719', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('9e581591-df10-4a97-97ea-b931c0bc22e8', '9781101934715', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('885b1d3b-195f-416c-9a4d-4e4c30af5025', '9781536439458', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('5296483b-f413-413e-b1c2-ae7715dd5984', '9781786071392', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('c87d9b7b-0e35-4140-b407-b40d64998500', '1780749457', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('c978e829-d8dc-475a-bed0-276b3534f7c5', '9781780749457', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('51ea5b67-84bb-48a8-b47a-53961e9ca97b', '0735209103', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('067bfce9-f4fe-45c5-9996-0157d345c6ce', '9780735209107', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('2016a101-2c6d-4681-b5cb-b5d257566832', '1524700800', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('a2770d56-0f96-41bd-9226-1d850495a768', '9781524700805', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('94c380b9-4168-454a-99a7-c68f8acc3696', '1101934735', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('e5d36a64-36a2-482f-9993-2f9ad362d85a', '9781101934739', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0');
INSERT INTO public."BookIsbn" VALUES ('c3f6eda9-d886-4b01-bd70-0c8dfc11b837', '1116090011532', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('16f79018-4ca6-44ed-b720-6c22e9e3819c', '9781536908336', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('107b2b81-23d6-4d10-be52-3b1c6e2acdff', '9868484707', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('9b996588-b3c3-4769-922b-40838bd4d011', '9789868484702', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('f7e6be4a-eae8-49cb-aed1-7f650702f440', '9780810993136', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('ac3fd536-70d3-485f-bc94-143f95832340', '6074003343', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('33972fd7-310d-43a8-91c6-78993264e412', '9786074003345', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('c5163d5c-6584-4bf8-ae6e-b48b1c606cb6', '1906907994', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('24bfaf36-7ad1-4891-a273-5c34da475594', '9781906907990', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('c883f6b2-0add-487d-a075-215216afd4ee', '8702126753', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('5aac2d98-39f3-4e22-8cef-54c0d96604f1', '9788702126754', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('a9d65834-2466-4d12-a107-1f8a3e2be632', '8498683378', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('3693172e-5492-4167-8483-ff4e520c371b', '9788498683370', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('1a1a3fbd-bc67-43b9-81c1-e2a9fe521fe1', '8427218931', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('64b704dc-df64-405e-b227-b4d6b19a947c', '9788427218932', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('2dd5bce3-9c65-405a-b72b-a527ba42a50a', '141971631X', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('bcd6e532-9d24-4271-b991-4d8dfa5764c9', '9781419716317', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('20199841-92e5-4228-ac90-2e3680dfd8da', '1419701045', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('b6ab2301-90a2-4863-8836-738dc62d2249', '9781419701047', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('ab7ccb85-5579-4d3a-926f-ead7434dc616', '8427226241', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('0cfc2a9e-14a3-4af8-8b6c-f1c4d5239053', '9788427226241', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('dd6726d8-d626-4438-a19d-93193453ddf1', '9548396386', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('49372c52-fd73-47d8-835a-73e44cd9ca34', '9789548396387', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('3839e196-62c2-407a-8e6c-9c3384edf4c0', '9789655522839', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('4d455996-9f19-4d9a-87cd-940189685d0e', '9789655173949', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('069d7a6f-8aac-4604-be1a-c4af26028ade', '9026125690', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('22f82cf2-0539-4fbf-adc1-554176d15d55', '9789026125690', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('1233e50e-d3d0-4ec2-a5ac-4f0596e1ec6d', '9781644735046', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('a058379d-38d0-4d7f-b405-4d8cb4076729', '9781647007508', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('6bb315c7-327e-4714-a187-cbaff62c24da', '2021011968', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('428557a8-0fb7-40f8-bc39-050b6dfd9afd', '9782021011968', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('d0313a7c-3618-4ada-83c9-a8a42060a30a', '8576831309', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('a4d9573a-a697-4c0c-b671-05a6c1f3d4a5', '9788576831303', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('1f2013c4-5067-4916-8560-ddbd421582c2', '8491870865', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('5d8eb860-05ee-4814-8cca-ed35b26d7dbe', '9788491870869', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('a8f4c67a-8d92-4b5f-9503-c3cd1af07131', '994482111X', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('29a5e996-1d8c-4354-9b23-d91decdcd2e6', '9789944821117', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('c9d6bbc7-5b4a-4d4c-acc1-b96e730e9a77', '9788427299627', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('982ae287-29cb-46b6-9c2e-39378464d898', '9738898846', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('e1ef2629-93e6-4b8d-9080-abf99b2683e2', '9789738898844', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('6fc66235-c64d-4156-bfb2-7fc3047fc41e', '857683393X', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('da3f609d-b1a9-4971-8bd6-ed87fdfd12f7', '9788576833932', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('41f41378-e4e7-4dcb-8567-caa4f138c62b', '384320005X', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('89a01f3e-f3a1-42a3-9c0b-56ecdd826bc3', '9783843200059', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('c1980535-e438-4fb1-971a-a0b0fe7c29b2', '9780143774266', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('ac6a18ee-39fc-4a8b-82c8-d32766b41a2c', '1419719475', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('c3ad9454-e091-4d0b-88bf-5a26da0a342e', '9781419719479', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('808b1a2d-b8b9-4838-8bcf-87b440288db3', '8880334395', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('cfb3d25a-a509-4427-ab7f-86ba6dcd80a9', '9788880334392', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('700e90e4-215b-4cce-9cd6-0a237a38688b', '9026137680', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('b7ec77bd-c573-406f-b384-14151ad49ce1', '9789026137686', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('d6342dde-5084-4f99-ad22-2febb7af1dc5', '9788467230857', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('18f05d48-ffe2-4818-a5b4-74a2f3cae0bf', '9788498672220', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('7caba399-e837-4c74-a995-bc080a89c722', '9798855069013', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('12befdcd-6ef5-4e3f-8015-0c4e62b651fd', '9781484473597', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('38560229-7455-42d2-b1fc-90fc58a6dc44', '1445846535', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('63f10450-e44f-4a93-9f85-6e18fd5321da', '9781445846538', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('f79882f1-c801-4fb3-9197-6ced380b1b67', '0810950480', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('077b6e89-329c-4590-b09f-87eb79f4d7ce', '9780810950481', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('00772512-2790-4b79-82ec-6c1f8db2450d', '024133571X', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('f5c3420f-f674-4f74-a296-0297e559cf67', '9780241335710', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('df5c6991-1ce0-422f-902a-75b2befe2b61', '0141329890', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('7589b7a5-848a-4184-9091-ef2cea06e281', '9780141329895', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('89cbe784-8d1a-4824-a4cc-06f4f562f06d', '0141360461', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('9c4c7bba-588d-457b-a997-49565e24c369', '9780141360461', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('9fcce221-2734-4161-a270-0590140e01df', '0141339446', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('9e783dbb-8f30-4df7-a6e3-ec12d35b6abd', '9780141339443', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('36bbbe27-e42e-47c1-88fd-ea09c6be9784', '3833936320', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('ae857b93-594f-4cea-bb91-7d7be4c7d3af', '9783833936326', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('1b19dc49-ece4-40dd-b7d6-35694f741ef1', '9955222727', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('d8cd87b5-e330-482d-9d5f-3dac61e29af1', '9789955222729', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('a4176114-eafb-434d-b786-76611e240bc4', '9781849677158', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4');
INSERT INTO public."BookIsbn" VALUES ('b94fb566-2431-465b-877a-0b1ccb42cee6', '8501105732', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('e1c899b2-3312-42a3-8db3-652094d16703', '9788501105738', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('d26cb7a7-cabb-45c5-a7f9-9884c3e633c0', '9786073911030', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('1fdd59bf-ac37-49f4-badf-3b48db48f9be', '9782755671544', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('49aba52c-9ded-46db-b62f-6a22d6970a7e', '2266263951', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('14b78863-d8b0-4144-ad6c-b19e89689671', '9782266263955', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('4ef20f22-9bdb-4391-b70c-ed5c3b4984e2', '9798885787567', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('63ba6dd8-7049-43bf-8881-51562d65d5cc', '605173029X', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('7d21bfc9-5cf7-4f7f-a36f-f26964d8f18c', '9786051730295', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('a9a5a0c9-c67e-47d7-b107-8a210b996a8b', '3423740213', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('418d437c-7398-4975-a809-80a2a1296c42', '9783423740210', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('063a1904-afd4-43dc-8a77-464de858b88e', '9781471136726', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('c6cfa819-149d-4c9f-b412-26686b79d0e4', '9781476753188', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('26d712ed-0b48-48e0-8b72-662569ca8697', '1410480127', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('06d8582b-fcbc-44bc-9554-07e2d0376349', '9781410480125', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('cf550830-c63d-4c04-bb5a-ae86cb289dac', '9781476753195', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('6740b544-f82a-4718-b4e6-7a4988658133', '9781471136733', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('20302b82-8aa1-4aa8-aae6-16304f2236b0', '9788375154207', '29bba103-a874-4340-9f88-25059ec4a2b4');
INSERT INTO public."BookIsbn" VALUES ('30a12326-a567-4694-8ea6-f213981ba23c', '9781009432580', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('378faca1-d6f1-4e18-91fc-885085954c6f', '9781382052344', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('a2e694b7-2e5d-4c78-9107-c7508ed30d12', '9781648337093', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('771e43cf-0ef4-4dbf-9452-74f13e5c8829', '9781283474832', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('0af956ea-64ad-4049-b8e6-920ea0fb6954', '3730606492', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('61f09005-519e-4fce-ab62-e1e204a97e73', '9783730606490', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('604e6e18-c744-43f0-b9a1-5afe33155097', '9788990324788', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('dbf49189-6bd0-44bd-9575-b5c6591b78e4', '9788854165052', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('f64d179a-8e3d-4b8d-a901-63fba9ddbc86', '9798667127451', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('273b8334-20b2-4bee-97f5-89b7e5c7344a', '7511024831', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('09df53c2-441d-479c-957b-73c2de276c54', '9787511024831', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('24acfb16-d89b-456e-a6ae-350e1037532e', '9781509896370', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('cc239ce9-1ca3-404f-8982-f04801ff5094', '9781312324619', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('b4a3033e-49d6-4824-b1f8-d6bcdb945df8', '1405862467', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('b08f6242-867b-4d99-8c4a-3d83baea10c2', '9781405862462', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('17632f71-0318-4b7d-8377-d5bfa916211e', '9388333063', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('244272bb-00c7-45dc-bc63-746b6ddb826f', '9789388333061', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('ca673981-e2b0-4bb5-b4e0-ed88426798a3', '9780359374564', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('d8ab6355-794e-4e1d-894d-ae658fa5571a', '9782322156337', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('bc42720d-d1c6-48c0-a4ad-9ba36ddb3c8c', '9783750436978', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('72e6002e-d07f-47ec-836f-0c3dcf854927', '9781716833595', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('1f5fd462-a28c-420d-8cae-b1ddfcb56023', '9781257968190', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('1b774d0d-562f-402f-b3e5-68a4d8417c32', '9781365964893', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('c56fc209-d161-4eb0-b66f-1457759b49a6', '9781365964886', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('c7a46247-cf11-4934-8058-8cd298694a06', '9780244617783', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('2b267ceb-ba9f-4ef9-b31e-0d119dd3ebf8', '9781716833724', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('799ed219-0fbc-46d5-8658-8e65c51cf733', '9780578280943', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('e59c8fea-8794-49fd-a2ec-b1693d36c709', '9780007874699', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('299ce304-13ce-44ec-8bae-8630e003c81a', '9798618899659', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('abc8f8dd-1cc5-4e1a-aa8c-f2a2d79e28e9', '9781522002154', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('ee5dab3c-4a91-4c79-b2c5-ada72e05909b', '9798844238420', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('34532123-5878-45d5-af0a-491b1dd657bb', '9798543183663', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('7a34f929-6d46-4b24-a866-916f7a8604d3', '0330106899', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('6ef0e5da-690a-4c3c-98bc-31bee39b4bf5', '9780330106894', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('9f3c4957-d9c2-4297-be1b-58ea45129741', '9781478107163', '4503d7fb-4b27-43f9-9e65-89f2c430b527');
INSERT INTO public."BookIsbn" VALUES ('8425d23b-624f-4792-bba8-b5136d8aaa43', '9781523849918', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('18d7519f-246d-4c75-bb82-67f23f18057c', '2709642522', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('2ad58a35-e01b-4d99-a9db-e47544eb5da8', '9782709642521', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('c32bdc14-5e1c-4bd1-8c75-cecd56a97490', '9780099579939', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('22ee0bf2-2edf-4cef-b727-a5cf9a4d2664', '8580572185', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('4be458e5-dd8f-425d-a70b-ad518ea176e9', '9788580572186', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('d8e1f20e-68ca-4f31-bcc0-9d2b6ac57d67', '6054688448', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('0ba909ec-40ea-489c-b7ed-378fe45bc052', '9786054688449', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('1a9504b4-9afd-4215-b134-26dbdf3e8004', '6053435147', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('32c9920c-97ba-4aca-90f4-ad0250a120db', '9786053435143', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('44748b6e-f10c-437d-9a2f-60d168c73c26', '605343468X', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('43db6fb6-503e-48d2-b7dc-e107d3674440', '9786053434689', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('0b517fe1-ea65-42c5-8fdf-30748e518a3e', '6050933391', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('53a1be1a-a7a7-410d-816c-1aef8646fbd3', '9786050933390', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('8520a9d1-276d-49d1-859a-243e41eb2337', '6045901185', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('277103c8-72e0-4723-8d64-e2c849096a5d', '9786045901182', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('4fac4e88-f936-4ffc-ac6c-3dc034f5067f', '8490629986', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('9858b544-b958-4113-bc91-2d6b3effc8c4', '9788490629987', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('9bf64ed3-bd2d-4288-8b57-7a01e9eeeeb3', '8490623759', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('706ea59f-b99b-4d3d-841e-9706849fa958', '9788490623756', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('ae30a4c5-7a12-4e18-80c6-39ac11181f11', '8401388449', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('8ea42c92-a4a4-4e62-af6e-b4e18e807356', '9788401388446', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('505189b0-ea00-4d0b-ad67-ede6185ddfda', '8425351472', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('d4793155-f4b9-4d6c-8c9b-7ff97fd38f5b', '9788425351471', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('bc75cdcc-6951-4307-9b45-3b1e1336e8c7', '9877250209', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('6eaae978-96d5-41a1-95ce-e799d3e3bbdf', '9789877250206', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('bbf83c22-0ac6-438c-8c0d-82a2539ad7b5', '9781299091924', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('258da9c9-9389-467e-83be-e47bbd0366b4', '8490629994', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('2d1ed940-da59-445b-83df-3cb3ed826586', '9788490629994', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('ad34765b-f8ca-4225-a3fb-25f115676890', '8490623740', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('6cac07c8-556e-482a-b96e-491ea1653775', '9788490623749', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('1cade4a7-62fd-4db1-a5b3-fab5bcd8cd8e', '8466358390', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('dc63f3ae-82e8-4de3-b51d-211e646f4a80', '9788466358392', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('fc1becf7-d7e0-43d6-80c9-56572cae2c32', '9789588618760', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('4bfb0c04-7133-4197-8099-b96c87111875', '9788467251609', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('3b18aeac-7334-41e8-8f8b-440d5dce3dca', '9789588820835', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('40d9512c-e2a4-408a-a0d9-c4e38172d934', '2253176508', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('6b5154cd-d4b7-48a3-8289-89dab9d8b6ec', '9782253176503', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('edf6690a-1552-4d6d-b50d-046cfdc6c65f', '8936037746524', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('238b3769-a87c-42ef-ba4f-00776722362d', '9789655456318', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('88284181-151a-4e95-a40d-7f1e2666d0fb', '1471305023', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('0ac8e4a2-9219-4964-81b1-601606ec3dcf', '9781471305023', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('c4b1f0ac-d33d-4996-b3a5-dd9dc5ab3c14', '5699780025', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('afc5a25c-ba73-4271-bb9d-86ef1d30fa98', '9785699780020', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('d1e093ca-d5d5-4eb1-b6f7-a16f47d31ca5', '9350835614', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('d9089387-642f-412d-9c7f-8d12cfa746bf', '9789350835616', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('8c728369-ae1f-430e-8a1b-a6352f70a515', '3442482453', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('60a334a7-47c2-44ce-aec0-9d754e8bbdf4', '9783442482450', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('e383cea3-b1ce-4ed3-88fd-1552ea2d2b17', '6055289830', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('6d4053d0-bcf1-4ed0-95f5-d77d654853b7', '9786055289836', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('9b9d7a42-81c0-4125-bc29-27e9982524c4', '2356415114', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('07a52ca7-34a6-47f9-81ca-57b62fd29b8d', '9782356415110', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('dd4ffd21-6f5b-424d-90ec-ddd7096a8d57', '8375085561', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('524af2f1-16b1-4527-8e5f-b67ba7a51f23', '9788375085563', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('5fc9efa2-4bc0-4434-a11d-3d44ffb75db0', '9780804172073', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('f278276c-05cd-4401-90c4-8c0ec50619da', '9781612130293', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('e550b4d8-a7b7-4513-a602-ef17342d8648', '9781784750251', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('82475e99-6545-4c53-99fe-d5fcafe88cfc', '5699586997', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('3aee5172-9603-4c2a-be54-19a2c0c0c49c', '9785699586998', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('c5f80a67-9863-48df-8aa0-5fc74aae225b', '3442478952', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('098921ef-fbd2-4ac3-bad7-3d2ee2d3862a', '9783442478958', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('f42b660f-13c3-4c47-93b4-2c0c9dbc3d79', '9788425348839', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('f680c49a-2b43-4df5-ac94-74bd5ba5d90c', '9788425349942', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('16714c0f-95be-4518-92c8-0a46e91a6d4f', '9780345803672', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19');
INSERT INTO public."BookIsbn" VALUES ('124e219f-2aee-4e4b-ae36-14ef7bde846c', '9789862131367', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('52f414df-5bef-4f1b-b312-6820e49a8bc6', '0439023521', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('89a2d1bd-1b2b-4fdf-9809-9b76c846fc2b', '9606665801', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('b3068943-eba6-4267-9f5e-071734217b36', '9789606665806', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('5530c86f-fec8-4e3f-ab7e-aea99151732a', '618012275X', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('e388beed-d4fa-4c6e-a92d-7e11d2d08531', '9786180122756', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('71911117-5946-4a23-afee-274b3a57e433', '750636851X', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('39e0e1b7-509e-4fc8-8e06-96d84eeba7a2', '9787506368513', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('d695d072-6f18-4b4d-b476-fa181783642b', '8702094193', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('c616421f-22a4-47a8-be86-d7de6adc9ddf', '9788702094190', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('c50b4fdb-f0c7-4cc6-9905-7c58cac250d4', '9789710254545', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('997fe2c7-3a0b-4a71-a7fa-fb59789e4b05', '9780439023481', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('cdc8c1c7-6a36-4a7f-91d9-6c5fefebb84c', '9786555321449', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('80fbde4a-88e4-4fb1-9df0-4295d248369e', '9000399289', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('3620ec94-0e67-4078-8742-81c90cf1ee15', '9789000399284', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('75d0518d-f132-43e1-8ca5-93043364115e', '8427208391', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('19fe2d45-cc38-40a1-b40f-4716458bfa58', '9788427208391', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('45c36263-1ae4-4b4f-9d32-431d5d89ea2d', '841314485X', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('d2437e7d-cfc5-4650-ab91-33270fff6289', '9788413144856', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('ff360ab3-307e-416d-b9c0-3ba268ade983', '8492966807', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('aacfc957-f801-47d3-b1bb-a3f476cadd89', '9788492966806', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('c2ace664-b376-4d97-82e2-befc290956f6', '8499303323', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('239f7adc-3c5e-4d38-97e8-b54166b6df75', '9788499303321', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('fd554451-ade5-4a78-b876-935d83f38b1a', '1407135392', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('1f0a203b-9eb4-48b8-9df3-b127c8512840', '9781407135397', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('d9e59c2e-0bb7-4c4d-ad77-01c7ef2afc9e', '9000331951', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('f0209443-0031-4c23-a092-3d9ea569a2a8', '9789000331956', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('5a80681c-129c-43c6-9709-1a3434e5d4c7', '9789655177183', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('08c003bc-d97b-423e-be70-1c0c841eaa60', '9047515978', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('bafbfd01-1fa1-4921-851c-21011c42a356', '9789047515975', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('a00383f2-1334-41eb-be63-e3eeca75f25e', '9175030349', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('47db7c07-03bc-49ea-8e43-afe0a8d1e427', '9789175030340', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('3b18de35-8ee5-4e78-9bcf-240242772cb9', '3789121274', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('6bf1e579-e86a-4f74-858f-1c21e0e138e6', '9783789121272', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('e6775562-cc90-4453-a6dc-5615d6b13dd1', '6064306165', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('33c9b474-2095-4f5e-ade6-9ba696b9847e', '9786064306166', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('278cf219-dd96-4cba-a7ce-f52ab53d54a2', '9780702333026', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('2b9b815b-a2e3-47e1-9b66-92c27b29ef36', '9780702332982', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('f4b1b4ea-2cc8-4497-8f62-07006dc1da14', '9781466185999', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('9dd94a72-51d2-4751-91bd-606d23aa06e9', '9798855026139', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('356c1155-501a-4e91-b11b-039726a8a9fd', '9781477409572', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('5dc6daad-aec9-4f27-94b7-efb943bfc554', '9781481903219', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('4b7b977b-e995-4e55-9a3d-36bf61b1ec50', '9781519480026', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('7a23df92-7590-4a19-b14f-d7edf521aa39', '9798212979986', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('fad28716-143e-42d8-9ed4-52ac6cee7d70', '9798212982115', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('d2eec853-9509-4425-bfb9-2447e5895977', '9781339030609', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('792380ee-6164-4620-b080-2c4f9927fc81', '9722342398', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('34dd589e-243c-48ec-802f-08d9a7dedd82', '9789722342391', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('55a26eeb-5156-4498-a5dd-9cd061b5d6b8', '9780702342387', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('ef6c08cf-e059-43d1-9e5f-711495a9a512', '9788427246003', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('e000fb59-09e6-4979-a277-460952431456', '9788427248465', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('211dbd55-9566-4373-af7e-cbca8f3366b0', '9782298079715', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('52f86a6c-d9c7-4098-a9bd-e4366aaeca08', '3125781531', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('02acab2e-34c3-43c2-9a0e-4de3f380d254', '9783125781535', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('e9b1a8bc-c079-43a1-9eb0-18ced887034e', '8498680611', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('3befdb1f-135d-4092-a2a2-803e42d3faf4', '9788498680614', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('def38e3f-c1c3-4ced-9076-d10c4b77778a', '0545114071', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('9da19dcc-a38c-439d-802e-3cd5f8368d25', '9780545114073', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('9b672d98-ba98-448c-8349-96f305dcfdec', '8804632232', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('14f21ba8-db25-4270-84b6-1ad9dd3765c2', '9788804632238', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('94e7a4cc-1084-4ef3-b4b2-c373d699ad46', '8579800242', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('fb9f0065-5133-4755-813c-18a14a3abd3d', '9788579800245', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('cf4078ad-6a7e-4ea6-93ee-764f22299804', '9781536425512', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('dd7edc5f-e544-41bc-bf6f-f46cd7c84d9c', '9780545471046', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('c5d3acee-c112-4a5e-9d81-a1a684a64ef4', '9781411471047', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('177a1663-65e4-4b50-b2d7-587e24efdf40', '9781407129044', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('82640a46-079e-444c-a5ba-e68f196f5d16', '9781407133171', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('cd6dbb83-09c5-4815-a689-1c9a235d5c9c', '9781407136189', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b');
INSERT INTO public."BookIsbn" VALUES ('803dc6e4-31bf-4590-ac89-1d24a5ef49e8', '3551359601', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('8e599bf8-3859-4357-8c26-fea95b3e877d', '9783551359605', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('a659cb7d-dcb0-407a-83e9-f2d89809b9ad', '0141333227', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('c5e39f67-094a-4133-af6f-467b39e79399', '9780141333229', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('456c3eba-57f3-4ff3-83db-bc7a33c77be6', '3551321973', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('453654a3-f65e-4342-8aaa-79fc7d493427', '9783551321978', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('44c0469f-6170-4df6-9ac7-a35ca05af941', '3551356939', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('b79f160d-98f9-45d0-bedf-e9a89bdb7d01', '9783551356932', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('f940f353-7832-476d-911c-e80bf1654b41', '9798855113020', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('a8da1fda-7d81-42ff-a787-a2ec58c7231d', '8416310033', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('bf516f89-bdd9-41b1-bd1d-229f26e95b97', '9788416310036', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('a8c5e792-bdd6-4a1f-9dcb-c1ba7de857b9', '6050946523', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('31d296e9-8a45-4ad7-9239-1e6862106eb2', '9786050946529', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('8cddb8f4-0ffa-4059-b7b2-f5ef6ca33eaa', '6051110453', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('fcf26aae-410b-4568-b48d-a08968069032', '9786051110455', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('b98187a9-a48e-416a-86fb-097ec9cc6b9e', '8804664568', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('baf717f6-ea9c-493b-98c5-b1857631fa45', '9788804664567', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('e1eae069-024d-4135-a094-3edb73a888b3', '3551554374', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('c4ea2b37-e293-4afb-b675-1fc1d4b19634', '9783551554376', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('926fb716-e21d-4b17-b323-b5e80bd40663', '8580575397', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('dc707c15-974f-4ef6-abe1-d959406023ce', '9788580575392', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('c5e0b0e6-2cf1-4ac1-b743-7eeec7d2fe84', '3551310580', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('e6d8e480-5647-4b03-9c60-25eedb44a9c8', '9783551310583', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('0f3e131e-6acd-4037-a0aa-57d2d493de2c', '9724619370', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('6e4ee774-bd98-4606-aeca-3f1e8629388a', '9789724619378', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('04a6283b-0a67-4741-b698-3745472e0194', '9788392883791', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('dd8fd2c8-967d-4829-9734-31a8028cf842', '9788392883708', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('8d6aba00-f697-49af-aa45-bf3cc4449664', '9788364297793', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('68fc31a5-ea85-4e2e-b0be-3dae26463e78', '9788498382365', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('a286aa06-a724-4aa5-bdbf-ab8fc8aac83d', '1368051472', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('eb6edd12-0b56-4457-9c85-9838888e6336', '0241672031', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('41ae992a-76c0-40e0-ad59-fa20d47371f9', '9780241672037', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('1b83008d-b320-4ed2-b7c6-fcf909395b47', '9781536486735', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('909ee325-61a7-4fc7-8f1d-13cabfa94e89', '0241723396', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('20654f39-fa12-444f-a3e2-1bf27baeffef', '9780241723395', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('68252a7b-2389-4721-886e-0127b1f47642', '9788419275738', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('b7de3034-d54e-4f66-8e6d-fee864463870', '9798890980830', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('5f6c082a-b3b9-41b8-956b-36c9d4c040f5', '136810102X', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('47399318-985a-4343-a8d3-300ae43ba946', '9781368101028', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('d5e9325b-21b2-48b3-b276-10aef9c60dc6', '1368098169', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('0c4df3d1-63e4-4f7e-bb18-c2dce87bb10a', '9781368098168', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('4ee28f51-3e9b-4598-a46a-a210eaa980d4', '9781423131892', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('9efd1683-809a-4a84-9e40-83980f4309f9', '3551319470', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('88e187ca-82d7-466b-b855-b2c3d908ae15', '9783551319470', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('a4c18770-7c30-4668-a3ef-9dab03463e77', '0141376880', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('8f384757-4959-4de5-82ec-d6e6b8e6a913', '9780141376882', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('38b1c9c0-d8fe-4b99-8fd7-f027ffac24be', '9788498380392', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('8a633a62-97f6-41b6-b7d0-cec568c50cfe', '9780141381480', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('95c81817-54c6-47c9-ab4b-eef57673204c', '9781484427361', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('cedae98b-7b8e-4aa0-87ab-f39f9ce5d6b3', '7544812464', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('72bb8edb-8c40-499f-8785-9fca4221fdf5', '9787544812467', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('b7166f4b-bc5e-421f-b28b-6d084bd049f5', '9781484458754', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('be321cd4-1aa7-4eee-8411-8a408a83ab73', '2019109956', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('a332ef3e-ca57-4a24-9595-72eab06f8c34', '9782019109950', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('3cbc770e-cf7a-4e95-95a7-809b6047fb5e', '9782013228176', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('17df87bb-bb05-46a2-a27d-dc44ad0ea101', '140566438X', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('274be9f7-73d1-43ca-8029-82646ec3b5c0', '9781405664387', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('8f3cde3e-78a7-495a-a690-9ecc67bf8b5e', '3646920009', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('0129ad4b-e91d-4567-8aac-20e1ece1171e', '9783646920000', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('a32faa00-87b9-452d-8e3e-50d74b926450', '142313494X', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('c3e29a67-ed10-477f-b2a7-49319206fdff', '9781423134947', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('576f996a-96d2-49a3-ae1f-ee5c2c175b40', '0545241804', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('2a5f876d-3f07-4b3f-9ef9-d096ea32106f', '0786838655', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('8a4beefa-db22-40e8-8e4e-1e80fc9b6b3b', '9780786838653', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('ab828f66-199d-445e-9b32-d85ee89fb2e0', '6068044424', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('ded56e91-4c52-41ef-9e8d-7cb2827761a8', '9786068044422', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1');
INSERT INTO public."BookIsbn" VALUES ('82e6a53a-5204-4de9-ab22-91a86de24f76', '0397001517', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('e6fdcee1-7977-4c44-80b8-2fb624df72b7', '9780758777980', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('3df4ce5b-3f91-44cb-9d7c-8fcb14c8cf6d', '9780847910779', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('bcb0ee8f-d403-4e1c-9467-60e6a495f65f', '9780062423337', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('9a68ca63-9042-4b97-a741-089451d1e10a', '1572701900', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('11869d63-cefb-4a9a-9d6b-557f5bfdb2f9', '9780061808128', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('a5186978-aefd-44b5-89f7-66a251ebc564', '1428113517', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('a24210e3-a898-4602-99b0-22959b0d914f', '8401492041', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('3ff5e920-0cac-45ff-8dde-cc4f2566d60a', '8484508552', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('e303adc3-a155-45a9-b47c-ef4bc8822978', '8499302017', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('e34ca4b3-b9b9-4882-8a4d-6f3cd68bdf75', '9788499302010', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('883aa6ae-2ed8-4d6a-a03c-50808d2b3111', '8429774491', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('5d3364bc-2fd6-418a-9b43-aa4700e8eb3b', '9788429774498', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('f8949fbd-200f-4eda-b049-ff4e91eeffd1', '8417247211', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('f8d696f6-a5e7-41a8-afc1-e3067e7acd77', '9788417247218', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('5a246b16-a222-4bc9-8fc8-888c9c98066c', '9049807011', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('e5c9661c-193c-4a4b-b419-08aa7520edcc', '9789049807016', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('04a2e343-d4c6-419d-ac7c-765d23464a5c', '9781473556812', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('b24531e3-bbcc-4ccd-be45-0e1ae7b46557', '9780063026032', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('e78de7f9-b816-4c23-b440-615e0dfd05dc', '9788417247201', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('58fbeeac-dda2-46b4-bcb4-c853fecce28e', '5170585306', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('06b93ee4-afbf-4986-9a63-4c5c866ae9f0', '9785170585304', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('90f7d89a-ecd2-43b9-8469-9c1abc8b050b', '5289002014', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('f82b16ee-19d2-4f69-b7c2-54751b201929', '0718076842', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('ae77c0ae-7d5c-48c5-ab18-bc827ec83e1f', '9780718076849', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('e3dc2a3f-8491-4e99-bc7d-3250f7608f86', '9788417216948', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('98ba3997-e7d9-4974-9562-3ba7d1a338fe', '9780062877772', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('e0d56cb5-9d24-46a9-9112-391492edf479', '9780285643864', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('3f56d3b7-69a1-402f-837a-d33cd74c1ead', '2877065502', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('d2d26854-f88c-41a2-954f-f8baa9dea45f', '9782877065504', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('176f6c33-b4f0-4abc-ab0b-ecfb54563672', '9788490701218', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('f02322c5-b2e3-43de-905f-2eb1e0b7d999', '8496778282', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('ed3203aa-55f5-4798-aa32-958e60aa5cd4', '9788496778283', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('b624031a-5331-4507-a5bf-2b43a6b8734f', '8491392254', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('9b78c205-06bf-4432-b58b-7acf1c88c62e', '9788491392255', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('8c00ceab-27d3-42ba-9fd0-926aa6af0b0e', '9992262443', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('ccc43aa6-4017-4928-91e1-c2753d644d76', '9789992262443', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."BookIsbn" VALUES ('64ff6d0e-2e2c-463a-9cc7-32ca49187c53', '9798217116775', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('54822ca8-37b7-4627-abfe-e2f0544a8308', '9781405293181', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('d88353f4-2c29-41e2-a406-f831176e56c5', '9780008687069', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('b40cb9a3-5ebc-4b5c-a263-dac10c77f696', '0008653143', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('a58ecc0d-4aeb-4254-a32b-b84a5dd9e0f6', '9780008653149', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('c58015a9-4010-4de5-8280-d0a5dc7a43d3', '9780008621704', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('423ed704-d1ce-4e4f-870c-3267e6378870', '3846601594', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('8b8a539c-111f-47ab-aa1e-5f9f10051adc', '9783846601594', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('23d82c15-3aff-4542-a130-83aff1f2e86f', '9781536474466', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('404daff2-4f39-4ebf-99a0-4e06ef4cdd83', '8408223127', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('235312a1-c2e1-4e33-b643-05e5ba813a3a', '9788408223122', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('004e67fe-ce80-4bf5-9892-f1a2a15bd29f', '8381541956', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('9a725e46-91ea-4f61-bb85-886daf489fa8', '9788381541954', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('9d8e5e44-0391-4a30-bb6c-db67768c0cef', '9781984896377', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('23cc0581-8773-4374-90e7-4356803b3775', '0593340477', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('ecbdd63b-a061-402d-ba95-f31a5c2dce2f', '9780593340479', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('0b6e9290-6824-408b-b51d-96798f50c809', '1984896393', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('68a66b92-f617-4214-a57b-7c6dde0d0aa2', '9781984896391', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('05c4672c-9595-486a-885f-1c6394f45c29', '9781984896384', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('38a6c063-c452-41cc-8226-178060f0b744', '9781405293846', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('e7c1d0c0-e368-4652-ae46-7a8b8dcf6285', '9781984896360', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85');
INSERT INTO public."BookIsbn" VALUES ('cf554f0e-a152-4647-961f-237305f4bb7d', '1728274893', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('4ccef72b-e6a1-4992-b9c9-9fe88c6c090a', '9781728274898', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('24ae058e-4cd4-479b-9f96-1bd363709d9c', '9786073913133', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('395efe61-5e18-4437-959e-a1b7fc86ccab', '8408282956', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('e667056e-d1e8-4cbe-86db-4476177e77ac', '9788408282952', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('85f6b086-64b4-4b25-b8b0-261d2d247a55', '1957464046', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('67dae11c-40dc-41e7-bf3b-049bf16067f2', '9781957464046', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('6945cb84-289e-40a3-8a93-ae937b5052e4', '9781957464107', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('bc220468-019a-4f34-ba0b-ade712511aef', '1957464054', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('688898f6-1791-4413-8972-cd8ef52082be', '9781957464053', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('a354185f-5b78-49f8-94ed-b6a3fec65e79', '9781957464091', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('bf865a83-92a8-492d-ad0b-50f5c89f6548', '9780349434285', '508e7941-37f6-449e-bd2f-4f266edd6da2');
INSERT INTO public."BookIsbn" VALUES ('e5963d15-9a77-4f8f-a4b1-26062a004971', '9780759529892', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('330cecdd-e863-4b36-bf07-87439dd2edd6', '9780316213172', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('4e9805d9-4948-4c03-a5e4-97f4a90ea63b', '9780606264686', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('f3b7646f-8c08-4acf-a99d-4c95d2941810', '9780606264693', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('02da1c77-471d-486b-8c16-bfea3c5a61d8', '9781306770354', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('02f1c90c-d59c-45c6-9ea8-c4677650d002', '9780316007450', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('35edca1c-4607-435b-b509-a24ee1cc8614', '9780316007467', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('91700b03-7e1e-4c90-9d94-21b7f9ae3b9e', '9780316007429', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('eed72189-10ae-448a-8961-ef1889d4cf32', '9780316023597', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('26b1065b-6709-4259-8cd1-cca3bfdf8ba7', '9798855090963', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('4b419bae-5248-4ebf-94eb-f4ddc8c61d93', '9781514233689', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('bafbf2e0-2227-4215-a620-3ca5eced2ac0', '9789895572700', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('dd2360e4-14f7-4dd9-b450-ef70d945e67f', '1417795123', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('4899de1f-3267-46cf-8056-72471cf0a82a', '9781417795123', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('79fd010e-cb64-4621-b617-2773f4124938', '9587045076', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('a80152cd-c181-43e7-b5bf-ba92040be94e', '9789587045079', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('f3497628-f613-494c-ba71-f06b2a19961e', '8934974080336', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('ccaf9829-8cb9-4c39-aed7-5f41a6354717', '161657917X', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('bdf3bd74-645f-410a-9bf4-2f7c86b444bb', '9781616579173', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('5f91c6df-098a-432a-b400-ce4510be4259', '0316065455', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('602a47d0-a2f2-45af-82b4-592b66c92f74', '9780316065450', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('c0819a0a-a3c0-49ab-928e-9e9bcbede0d9', '1435245008', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('0b5a914a-6ac5-44b6-9df4-85794e7bc3dc', '9781435245006', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('2aa189d1-45af-4e8e-aa1f-a16a6751a938', '9047510054', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('b4b3e6f6-5d43-4c33-be2e-3b7ee4a6bbbf', '9789047510055', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('72fd689d-57ac-4947-ace3-ad6dcc48b272', '9780557717187', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('cf527303-184b-4896-bb5f-d16ef877e856', '9606665240', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('d814293d-493f-4ca1-9cce-5293bdf66e3a', '9789606665240', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('35986482-a8e6-4a55-a902-a7447db35e74', '9788420469287', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('4f06acc5-cbc0-4ab0-a137-f16e9b315450', '9870405266', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('099418f0-53ba-420a-b0d0-8ffabf25b910', '9789870405269', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('cf1b02d7-e87e-4bff-8813-563d5fdb05f6', '9789571039640', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('c112be52-090e-4a81-a2b1-09b30e224810', '9780316160179', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('3b3ec262-b027-4b34-86aa-6050c358fba1', '9781408428351', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('e916f69c-c1fb-46c2-839c-d9a68d3cf057', '9781536400205', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('93d545ec-48f5-4036-8d5a-e3083ded8db8', '9781804228098', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('0e2dab51-6c28-4f40-8a66-720f32a095b7', '9953683980', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('d41bbb19-c25d-41a1-b1c4-5cbd7afc3047', '9789953683980', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('0d2d1980-73a7-4520-bf47-f2bc6e40e517', '0316015849', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('3dac3a5e-a86b-420e-a6c9-83aba3ef07d9', '9944821098', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('5730df09-9d67-4bff-88c2-f9fe5c225754', '9789944821094', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('703b21da-0fa4-43a0-b445-6bc9122bad70', '8580570484', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('ec6b495d-f79a-492f-bb0e-0c6b10c50445', '9788580570489', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('128fed14-dde4-44e2-8bd6-8c3a1efbc55b', '832458823X', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('5b122670-0801-4f99-a566-fe2fa55e3b04', '9788324588237', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('de810765-5437-41c4-95ba-32d6e9b1366e', '8324589155', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('910d2476-f82d-4f92-bac0-562bc463b44e', '9788324589159', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('8ce9cc40-3ad7-4060-bb7c-35d77bfff271', '9788373846326', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('e0633102-1b91-4cbf-a51b-5c78503a386d', '0316160172', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('e2ab9054-6f6a-4722-91c7-fe990bfedd7d', '6071104823', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('d9cd066d-b7ab-4c97-aec0-ed010078d9b4', '9786071104823', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('ff632cad-b170-47b6-aa57-fd5a6e3a111a', '958758368X', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('506495f8-79ac-47dd-a529-8f4a2a6b31c3', '9789587583687', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('f9ff9401-c45d-4c53-bd8b-d6554193df64', '8420409855', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('19237ac7-9eb6-4887-891b-da8d01d4ffe8', '9788420409856', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('0f96b538-6e16-4114-97a0-54d6b89ac9a4', '9895572700', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('a31b7a7c-2468-4a28-91be-dbf1e8d7969f', '8598078301', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('4977679d-40c4-4a83-bc9d-5a06fd6e4835', '9788598078304', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('d98cb943-d476-44d1-b7e9-56a8fd0e654a', '8420469289', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('370251df-eb3d-4ede-910a-36e99185caca', '9788420484273', 'd0c01d19-f647-4443-b173-8fb6db6c62d6');
INSERT INTO public."BookIsbn" VALUES ('556c83f1-107f-475b-97e4-0a46f8f5885a', '9022589579', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('94a745ac-bdc4-48db-9bce-eb63bbcb044c', '9789022589571', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('4fe60752-71c5-4aaa-a3e8-adbc9fc90625', '9780316461252', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('085aefbb-3834-4e81-a2b1-90076dff8caf', '9781955876162', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('a69a1cdf-e6ea-4cfa-b0ee-6a861865dbcb', '9781536450286', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('00c0fc0d-8394-460e-bf69-2af869a255cc', '154914006X', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('3a8ba66d-4db7-477d-a881-cedef6662d65', '9781549140068', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('a4f67c14-7156-4997-b59a-1b7a01d694e7', '9788417390617', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('2a239348-dba0-4e14-a3cf-b818c7e6fe3d', '9780316310277', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('8bdc31a2-be89-4a07-9df5-4927f26c5008', '9781478923732', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('1c56cd4e-e1dc-4fda-a909-cb3a856cc5cd', '1471407276', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('f0927e76-0747-4a59-9094-b77eca546351', '9781471407277', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('a94364c3-bd9c-4dc6-bcdf-0b01e9d0f65c', '031631031X', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('ebf07fc0-bba4-4c8c-bf61-e94f3f428b4e', '9780316310314', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('6e7190dc-9a87-47f7-a14a-bf82bc154fda', '1471407039', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('13151c75-7c8c-4afe-bfd3-c433f5f094b7', '9781471407031', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('427e2d4a-8002-4a0f-928a-1a7d6259bfd0', '1549140078', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('b5680458-9e05-4628-b0d3-d7179fc5bcdf', '9781549140075', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('50b39300-08b1-46f4-b826-2ff9d0355605', '1489416668', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('09a0c275-c635-4164-8180-b5d11fdfc26b', '9781489416667', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('c5e4d2c0-6398-4fa8-8701-94efd8fa616e', '9780316310284', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('0147d1a0-5f48-4296-aaa3-2282b6b591e4', '9780316310307', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('06a4946b-e2df-4aa9-b090-15423fb9bcb3', '9780316480208', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('e8823f66-c645-4508-a8b6-300f22bcb53c', '9780316416948', '720f9c4f-a47c-43e7-b6ee-0d7204482734');
INSERT INTO public."BookIsbn" VALUES ('cd2ad9d7-dad4-4224-89ec-51e398001a3b', '9788466361903', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('5b95b2c3-5899-40c9-a105-d6d97ce91524', '9788419951182', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('f226303c-7ba6-43de-8a9f-67ff554fe273', '9781911717263', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('99a61f91-2a9b-4ba7-a0b8-51165c605f59', '9780063387423', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('6f027129-9bcf-493a-8055-36cb2b893d42', '9780063387416', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('04572958-2de6-4d6e-9e5e-94cb40408d94', '9780063387430', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('5e66d5e1-c7ec-40e0-af93-125440b98a82', '9788419399717', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('8cab2528-c161-48e0-9a7e-9c06ba3ef930', '9781529913934', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('29e4a080-7679-4de2-83fc-abb35293d96a', '8490277303', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('3e99b7e9-ae96-4285-8b4b-638741ba97af', '9788490277300', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('b65f9d2d-6806-4421-8211-07c349b5104a', '8466347518', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('e3918509-0fed-4853-bd94-be9d2a03bf57', '9788466347518', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('c3c3879d-a8fd-4558-8a68-bde38e810a34', '9388241177', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('70617cf8-3fab-4bc4-977b-a39ec11ac839', '9789388241175', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('96336991-d4fc-419b-8964-78ccfd538616', '0771038747', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('afe96fe1-98a7-48b4-b8a7-ee6ab75cdc5a', '9780771038747', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('1aee5c66-4044-4dd2-895a-1061bb142f32', '7521721403', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('637849b3-d4b3-4809-a4a9-e4efed627ef9', '9787521721409', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('2bacc8e2-0f18-4399-8e98-71f57d9c5727', '9788535933925', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('5e34da78-801b-46a1-bf8e-134cd032dafe', '2226445501', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('ec533589-3c6d-47a3-83c3-a0d64455832f', '9782226445506', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('d3b15893-8d05-4a96-a4ad-3a5896f48e4e', '9788429779776', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('21884e03-74fa-467a-ab07-1d5c364c2c9a', '842977517X', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('1b8c69be-09ad-487d-a32a-421936e458e4', '9788429775174', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('e071fc50-e57c-4f6f-a3a6-dc1bd545511c', '9602216654', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('d1b8d634-4ce8-4706-9cd4-b0e02764e5d9', '9789602216651', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('645a6480-88ba-4076-8c71-64d8c8ac565f', '8466342281', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('2305c34d-4006-4835-9d2c-c3cab444d6fa', '9788466342285', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('20bc676f-7e7a-4fb0-a4e9-089ccd2fb844', '8525432180', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('dc958a9a-79d0-4675-a107-cad4eb06e66f', '9788525432186', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('d4c67514-4929-4a5e-a423-5a42cd077fad', '1494506904', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('01c5e3db-0e31-4fd9-85a3-17d745c0228d', '9781494506902', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('040ca7bb-f6eb-44e0-9594-43e52a111782', '9781784709044', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('2df592fb-3be6-4235-a93e-263845048d03', '2226479821', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('902fe53b-4d22-4918-ab2c-f47fe9828c72', '9782226479822', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('2debda99-9c31-43b8-b767-4a9f4e0350c6', '9865258900', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('6352b05f-3fe4-4e4a-bbc4-97f4196e0ab7', '9789865258900', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('9c806ec5-6941-41c6-b2b9-b4d8bc79d6b7', '9781473582910', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('f7ee1812-3b45-4bbd-a7b5-624039c5a8e1', '9788418056925', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('93741f93-6cb8-45d8-b9f7-ad8c36de0063', '6559212998', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('a6857fb8-aacd-47ee-8629-3dae00d8c4e8', '9786559212996', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('03c2d67a-799a-4cb7-9479-d78938771419', '8535933824', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('3bee0c38-6b40-43c1-9ec8-061cc6dca5cc', '9788535933826', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('928e394d-f322-4c2c-af80-f8198444aadb', '6052205695', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('27adbd7d-d694-4de7-9747-7ca256aa1200', '9786052205693', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('2a6181dc-08fd-401b-8810-0b42dcbc64c0', '0063212226', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('804155ea-ff87-432f-bd61-9604898f6b79', '9780063212220', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('8ace7017-5102-4371-9ab0-2cacca425691', '9781787333765', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('be8bd017-0dfb-4c90-8a16-0a50ad889391', '0063212234', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('7f3e2deb-a43e-4922-bddb-d8a9e7bc8c86', '9780063212237', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('a59d4045-8791-41b4-9205-0b8e88181177', '9780063212244', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('dda21b86-3447-4d3e-9a40-64e665cf80b6', '9781473598140', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('00d96d51-9846-4a29-ad4e-c9103efad923', '2226448454', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('83adc775-adf9-43f4-95b7-8e04dc327e27', '9782226448453', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('e924a6ce-e34e-41fe-bc4b-d7ddb35f097e', '1787332810', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('fa5cc7ba-5c82-487a-8a4f-994ba6618e63', '9781787332812', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('8ea3c5a3-0a36-4308-967f-f18a3d5bb186', '9780063051331', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('b4379f0a-1ed1-4991-b9f8-a587dcf4b5ff', '8418006811', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('5b971810-2a55-43ad-b8aa-604f06c6e4e1', '9788418006814', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('6ae0cb55-81ba-4839-a51a-70335eb2da08', '9780063055087', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('58fbdadc-5f40-419b-8d57-24ee455d9a10', '9780063422018', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('7e268f79-eff3-4839-8f6d-4aa68de7d593', '9780063422001', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('def14946-3d91-4336-bd40-bfc3030d7e21', '9781973896685', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('dd481bc6-bcb1-458e-89c7-9f453fc19375', '6559213013', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('ace08f99-d915-4d89-b9dd-4c00dc07fda9', '9786559213016', '662e31e1-a71d-4ec5-81c7-85915dd52fa7');
INSERT INTO public."BookIsbn" VALUES ('5dc2c57b-2fb9-4900-b74e-abd84bc7d160', '9789897546136', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('23748646-d61c-4c2b-b875-b2323539abed', '208121301X', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('c3c9765d-b82d-4704-ad81-d9e5d11ab483', '9782081213012', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('bbebf822-efef-4d3d-b5f8-b13c29bf779b', '9783868205947', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('e1dba784-598a-4cac-8e72-b9d4f88544c8', '9781719046329', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('8cb772a6-5ddc-47fb-80f3-3256ce93b120', '9781981281978', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('43e7baaf-4615-4517-9136-4634880c77ea', '9781982051754', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('b1e16f5e-a2d6-4df4-b8ad-33f9741a12b4', '9781979307840', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('b128fade-3b84-4458-8e8a-6195ca638869', '9781537658377', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('b19e8132-97ed-4209-a3ff-49be46e0ce40', '9781974604951', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('7b223238-2864-46f0-8bd7-b31aa5b888d4', '9781979851688', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('edaf981b-aa82-49fa-99ee-d27257b48841', '9781979466967', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('a9f684ed-747f-4998-9a0b-16ea68107f4c', '9781548096779', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('44bc81c0-0b45-43cf-8fe6-b3598e9d8a81', '9781542901840', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('a2ee87e8-e00b-43e4-ae0a-3b922e9a595a', '9781974338368', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('48edab42-3139-4f52-8e80-4b2e60803297', '9781726448437', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('805f9ba2-0b2c-4988-b4b4-120edd810997', '9781727421347', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('feb8e721-bfef-47a0-be46-29c926d96741', '9781537163673', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('71104471-4096-4bd5-b928-3eed7a8c1b26', '9781542927017', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('311bf1f8-d0bd-4ff8-836a-f83c276419c8', '9781535449816', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('a30ad4ee-e3ba-4090-bbee-a527d7ae0a03', '9781539159667', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('b467d670-8d33-494f-9fd9-aafebaea5620', '9781544228785', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('06d10415-fb9e-463f-8305-cd7f4395963b', '9781978124318', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('ad316013-6e78-4095-978c-d3519bf3378c', '9781544159423', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('2631ed0d-8e3a-4eef-b1eb-c43e64120a5a', '9781532878732', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('6a72a6f1-8e3b-42f8-8303-54bc4da86d00', '9781539313397', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('32b32d2b-2b42-4624-9cbc-2aa58e61c205', '9781974422456', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('dbc085ea-0649-4d9a-8edb-30b6019b5a0e', '9781974172108', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('30adc51e-b314-45e4-88af-a0f3888218f3', '9781542617888', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('632d7d83-63f9-46dd-862e-4e0333a9d207', '9781537038254', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('815c99cb-c35c-42b8-a533-1f83b1bdbb44', '9781537011653', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('704d7b90-2e14-4ae9-8c93-75934194ded7', '9781975859756', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('f23842a4-2670-40c7-8662-720c5d2b6e85', '9781979954006', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('3eb69eb5-0145-4839-8ed6-4921a02d4982', '9781536987799', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('c36da988-5407-4695-9f93-20d765c70526', '9781544147512', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('74c809fd-6492-43c9-8e85-2ef44610c309', '9781533016898', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('a85ebecd-836e-43f3-b58a-137774843b81', '9781545210635', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('27d8132d-142f-411a-94d1-f5458d0f743e', '9781532704208', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('205d2ae2-b2b9-4257-97d5-4b44deb9daac', '9781983684760', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('ad9dcd63-7897-48b4-8be7-9ace9d611c2e', '9781986218382', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('3341e355-e359-49c5-b6d8-12fc10fd3a46', '9781986634076', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('5af3abac-72d6-49cd-83bb-dfb146678746', '9781534793187', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('370e7f8b-8766-4a1a-aab7-1d670fe39cef', '9781541345928', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('9955675b-7ee8-408b-be80-9f5cd9033e1b', '9781537452975', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('e4a1c1ab-e781-4c4a-b6a9-6cb07fc421ae', '9781537675350', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('19397d7f-ae32-498c-9575-316e6510086b', '9781981233564', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('c9a37896-0346-4c8f-9149-04933689bebb', '9781985845008', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('95163406-0212-4b03-abc7-a90ede4f1d25', '9781545155240', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('b503dc89-3e4b-4df3-8ded-ad5a4fd6d6cd', '9781546665991', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('9fdc0cc5-222a-4604-864a-e882560920ce', '9781981240661', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('f0ee15fd-445f-4bef-ba25-ccb577dd6530', '9781981829064', '53f9df57-43c1-4a4b-a465-80cf117d5568');
INSERT INTO public."BookIsbn" VALUES ('11327238-a417-439c-bafe-2f26f6336cf8', '9781464235498', '19478760-1c0f-4d20-ad9b-c96ac3040c08');
INSERT INTO public."BookIsbn" VALUES ('03f8c3cf-795a-436a-9875-7cb35ed54ba9', '8408267043', '19478760-1c0f-4d20-ad9b-c96ac3040c08');
INSERT INTO public."BookIsbn" VALUES ('342564ca-3d91-4dcc-9406-7ab607999e1b', '9788408267041', '19478760-1c0f-4d20-ad9b-c96ac3040c08');
INSERT INTO public."BookIsbn" VALUES ('2bd080e6-41c3-43e5-932e-fc64eb991e55', '9786070798146', '19478760-1c0f-4d20-ad9b-c96ac3040c08');
INSERT INTO public."BookIsbn" VALUES ('c7e1990e-9bad-4e43-a9a4-3d62bfdf28d1', '9798533983518', '19478760-1c0f-4d20-ad9b-c96ac3040c08');
INSERT INTO public."BookIsbn" VALUES ('8bb761cb-3482-4acf-8d7b-6a4b71128b05', '9781087886657', '19478760-1c0f-4d20-ad9b-c96ac3040c08');
INSERT INTO public."BookIsbn" VALUES ('6d84f359-4a87-414b-a841-9e36a96ba487', '9781957464060', '19478760-1c0f-4d20-ad9b-c96ac3040c08');
INSERT INTO public."BookIsbn" VALUES ('1910a733-4c7b-4813-a120-45c1ed74a3ce', '9780349434315', '19478760-1c0f-4d20-ad9b-c96ac3040c08');
INSERT INTO public."BookIsbn" VALUES ('93e5cf01-8a03-4054-8795-5da57e7ecb20', '9781735056661', '19478760-1c0f-4d20-ad9b-c96ac3040c08');
INSERT INTO public."BookIsbn" VALUES ('8518f25c-bab8-4ec5-8296-2eec198ac2e0', '9783426453964', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('03b4a661-babf-4dfd-8e03-97f869627137', '8417918035', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('e3f28614-7e75-49b9-9be3-0c3ec1f015a3', '9788417918033', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('5a319ccc-5de3-49e6-9757-b0066627b216', '9798352274934', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('4adffd60-b3aa-48bd-8df8-b7b947279b9f', '8501116432', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('f90b2a68-3bfa-441b-9960-a6441e6db5e1', '9788501116437', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('01fc7f09-1470-4aa3-8942-7e3d4ee86c89', '8466367330', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('0a2cc06f-097f-4b87-8122-ded2b873d698', '9788466367332', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('635e430a-8d7b-42c5-9c9e-c74ca79d949a', '8466351930', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('d1eb894b-a403-485f-83af-7c31e1326d4b', '9788466351935', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('878e6257-17f1-474c-9130-7355eabbf5a6', '6063336060', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('189513eb-e78d-4e92-a7da-c5145ee77d7a', '9786063336065', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('1eb01211-7674-4bc4-ad6f-652c5a5841c5', '6051981489', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('562a3586-a3f2-4bb5-a1e7-341581c23d4e', '9786051981482', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('8d180ebf-c3e7-47cc-8002-f84685652d13', '9782253258193', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('11ec0d86-939b-4339-a673-19edbc65a8b2', '3426282143', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('c796a62b-e3b1-4c3b-82a1-3abe78bab38f', '9783426282144', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('e6340f85-20b7-4c79-a641-2dbaf960c8e6', '9788420435503', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('123b5af5-5647-44c0-914a-48286e6979c1', '1250238420', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('7e6950d8-5585-4115-9713-42c80190a090', '9781250238429', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('7f72bc0f-f1a5-4cad-aee9-f67f554db220', '9949681138', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('0d6d9778-6a4e-4c19-83e9-49d464e1aadc', '9789949681136', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('0b3c6796-52fd-4eee-9b24-56a3e29f45df', '9781250237170', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('665aa1f7-171b-4f9a-94df-ff807bcde7fb', '9781250301710', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('86b55be5-f689-484a-999a-a2924081b234', '9781409181620', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('f54757d5-f9ab-4dfc-ae55-136ac976ff2d', '9781250230782', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('c99d0179-e7c9-4346-a553-61e433716854', '1432858645', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('eda574c6-9865-4b39-8d06-16b8d77a842a', '9781432858643', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('08a10d2a-8aae-4bb3-bf72-6e936e0533ed', '9781409181613', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('0f94f130-6e57-44ac-9141-de40f97c52d1', '125030170X', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('4315e12c-2cad-4753-b9ad-4b7b64fa9e0b', '9781250301703', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('cc125571-dc47-4650-b85b-832dc87afb19', '1409181634', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('f5b581ec-cd5b-4671-8b2d-6836f946a5fb', '9781409181637', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('ada8c55f-748a-4ce6-82fd-89800e0e75b5', '1250317541', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('9d54243d-bd57-4bc0-a83c-4a91893ea694', '9781250317544', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('e8318381-6e43-49da-808c-f198f5bf14c3', '1250301696', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('2b9b933f-fc93-4624-b0a4-58d46dac3bbd', '9781250301697', 'feab4aba-356a-4608-898d-c115a9c1ee6c');
INSERT INTO public."BookIsbn" VALUES ('d9b33d40-db89-4ad4-93b8-16cc41bdb9c5', '9026352875', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('81fe6f7e-8c33-42d3-bd78-046f7fded787', '9789026352874', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('45555e8c-0c9e-4335-a7a7-bdbd83d20517', '9781398542143', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('b8884c6d-4e94-4422-b6e2-2c10ecfba662', '9781668081785', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('4fdb23e1-8e93-4b5e-92ad-b50e3f8a825f', '176110294X', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('a18fb47c-5e00-447a-97a2-75e763f4f3e3', '9781761102943', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('676e3465-af51-419d-83af-4d20320a7f7e', '9788652145218', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('105c536e-2cfa-4306-bc54-eafd44fa6d03', '9798212645027', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('a6f37433-3804-40f2-8b06-132eb4396955', '9895644515', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('27b8dc82-f453-42c0-b232-cb124b33215e', '9789895644513', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('b1aefc3b-8bc3-43da-9574-cccacc3f2ede', '9798212224604', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('592687b5-a538-4b79-b797-2637f449dc54', '3548066739', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('f04c84d1-b66c-4582-a87a-dafc79691807', '978-3548066738', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('8e749058-cd98-4f25-b2eb-9b616940488b', '9788416517275', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('3d7a9a3b-ec9f-4d1c-a8e0-866cf4a3ddbe', '8584391509', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('eda4355f-bf16-4003-9d36-a9dea3647d46', '9788584391509', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('4dff80fb-6691-42aa-8e22-a01e96f509a8', '6257973031', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('41582aa4-811b-4ae2-b642-eb85a234807c', '9786257973038', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('9cb6a58e-35a0-479f-bb63-c20e3afa3b8e', '9788417981006', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('950fb3ad-94e2-4c07-8361-88cc68aadf8c', '9781398515697', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('80505744-a95d-4b17-82ca-2523d318c13f', '9781683244646', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('d0ede7dd-68b5-4c26-8137-d7019143b1aa', '9781501139246', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('a82e6f4a-cdff-45a2-b90a-c0802bb83a0b', '1797106325', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('5eccf41d-d474-4dc6-8dd3-17530429cac1', '9781797106328', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('d7dfc6dd-16fd-4371-9fc3-c8391bb69d52', '1508236623', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('613e1042-a7d4-4728-9456-fedb16e0ade1', '9781508236627', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('77813a72-cd3c-42f9-a189-8020834fe7fb', '9781982147662', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('2e50f66a-cc93-4147-862c-be86b7720f10', '9781501161933', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('049473ce-5cbb-4846-a133-cff6995978fb', '1501174827', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('151c74fa-b0d7-42fb-b3b2-42f3cc23d233', '9781501174827', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('7fe25a2f-8dc5-42d1-9cc7-54188c97fce9', '1501139231', '256a01c4-207b-4d86-b74a-a1757e98667a');
INSERT INTO public."BookIsbn" VALUES ('6b4f4a69-a18d-4905-bd2b-a5b6a464ba41', '8380082230', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('9f020de5-e772-4515-b98e-f05a634a9b78', '9788380082236', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('aff8ef62-c548-45a9-82bc-c3af57567374', '9771442058', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('86a2a900-5b3c-47a7-a984-ee7d8da3515c', '8532522610', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('7569a15a-3c6b-402c-bd02-7d50284ec062', '9788532522610', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('0ebe9ee3-e35c-4326-9340-684ba11e8416', '207061803X', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('cddaea01-1d4c-451a-b067-fdecb8da774e', '9782070618033', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('70d4a8d8-5fac-4b12-8ae4-d220c88044ca', '3551557004', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('71f52638-9133-4d0a-9126-8cedd4abd0b6', '9783551557001', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('c9600e65-e893-4b5d-9139-408d84013388', '1547904127', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('bd3cbf3c-951a-4620-9dd3-1a6ca3640e3f', '9781547904129', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('c3cf0eec-f518-4708-a817-94636c36d131', '8867156012', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('f0a0fc91-a096-41ca-885a-dc253e6ca8ce', '9788867156016', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('d4ce094f-639f-4f4a-9f2e-cc3f41e14a2d', '9785389077928', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('43092e24-05e8-4c3c-bd89-47814dc5f42f', '9787020063659', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('bb48e66e-d2f9-4b96-b39a-24a7f6685ef6', '9787020103355', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('e7d993a8-dddb-42e2-88f1-50710ca5b7da', '9780606379298', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('5c396f03-9292-402b-9176-943a2265930e', '0545010225', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('1f734203-84e8-47d3-a122-638cfc0f2cd0', '9780545010221', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('6dbdce0f-1736-40b0-a2b3-f881d69d83c9', '9780739360385', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('1a852b6c-eee6-472a-a41d-23eef45f3c98', '9573323575', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('fbea15b5-abe8-4339-9216-1b309f9130e9', '9789573323570', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('c4068267-0cf5-41eb-8d88-ad4738789f97', '9781781102701', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('d943cb2f-8d73-42d8-9804-01e602740d03', '3551313172', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('3eb51b38-feba-45f1-b573-d0fa943d90c8', '9783551313171', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('86fd779f-a535-405f-bb57-a622b93d0aaf', '9781408855713', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('3f4a4496-dc08-42b6-8c27-6273653e2611', '9798855115499', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('60c646a7-646a-4295-9c4b-756990a5d0aa', '9780747591078', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('3971c604-a7ea-4cd0-837d-0eff347e3cff', '9781408865668', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('39aaf0b1-ae68-4c6a-a187-7c3b0c23a819', '6780135010221', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('4f29af75-15bf-4f33-bac0-16cc7c6ff810', '9781435762596', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('5084e911-70d7-452c-b644-3d693bf6eb96', '9780557746309', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('b290a02d-90e9-4b9e-8bb5-b3424c178a9a', '9781781101094', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('d8b14da7-9870-4343-8f35-041d5d250048', '9780747591054', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('ad37b1a5-dae4-48d8-be56-a5f03d8ca14c', '9781484474129', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('1c77f50a-18bb-4157-bec5-2c21c6d1b32f', '9781338878981', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('32cfe006-f50d-4921-906f-b07788f43900', '0606415181', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('f5f896c4-7277-45a1-a46f-d4ef5b1f5a3a', '9780606415187', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('67a9c294-2517-4919-b722-2d791262ad56', '9722338358', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('d20da511-251c-4a42-9b52-05d8eb7ffba5', '9789722338356', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('d35e7489-066d-4dfc-9c53-26e132ee8c70', '886715818X', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('1971da25-36f2-4292-9b36-c6b14b2c636d', '9788867158188', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('6fba8b5e-bcaa-4855-8411-209bc5571b70', '9781484481073', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('69f3fc16-db99-4608-9f5a-d4c412b2cccf', '9781536443783', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('93e096df-3b46-4914-9d8d-a5795878cacd', '9784863890886', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('fa03c437-d4cf-4016-851c-45e9c5c3dcd2', '8498386691', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('2bb7be3c-45b5-47df-8c8b-672cfc0de021', '9788498386691', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('124dbb62-3d88-4359-9240-fb20fc33f1b1', '8532531822', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('f54aa172-b7dd-43d8-86d5-396c413bc8b5', '9788532531827', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('7a171379-ebd3-49e0-a0a6-a60dbbd61fba', '3551557470', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('7e0ee559-e27d-4216-9f64-9833bde8f0c5', '9783551557476', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('96a942aa-9c75-4be2-a911-fee6b3489188', '9750812980', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('10427964-a613-494c-b3fc-b7949917df6b', '9789750812989', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('49e974be-1d63-4597-beb7-6ade8487b5d2', '8498389151', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('30b9f4ba-82a4-4de2-b97a-f432fcbd54ac', '9788498389159', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('f5a988fc-794a-4066-b303-a301bbab52ce', '8862562837', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('9cb58323-d79c-4d9b-b733-991a05059fb7', '9788862562836', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('101a130a-6405-4d8d-985c-4d6b3fd154a9', '2070585239', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('a27b7656-8f09-461d-8cbe-f6cb299ee45d', '9782070585236', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('055d0c82-ae31-4163-8faf-3ceff2cc3cbf', '8498383641', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('a15f4b9b-7780-494f-807d-da494da940da', '9788498383645', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('0299784a-e988-4b9b-adb0-7a44bb07a87f', '9780545139700', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('ce79fcb5-9c25-49e3-aeb5-eeadee8627a1', '0545139708', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647');
INSERT INTO public."BookIsbn" VALUES ('6886fdd3-fd22-47e2-9ab8-cbde239dc328', '2755692766', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('9efa7f78-96eb-444b-97cf-43365029a06b', '9789655740400', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('a0be5bf1-261b-4509-bdcf-794b2b1d0606', '9788408269755', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('5a8e952b-f792-44a6-923a-2581ffa29dac', '1538724731', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('6ba80a83-8adb-4b24-8e27-d66a788f30b3', '9781538724736', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('ea173888-89a0-40d0-8cde-44266a2b1421', '9788501117847', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('90c06974-7f1b-4a8a-91c3-e9175ab46484', '9786070799396', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('3f72c19a-3b39-4ff3-93e4-52c740c17642', '3423230126', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('c39665da-7d19-4e50-bdf5-ef5c80a91031', '9783423230124', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('6fbd15b7-b4d1-4f04-bcd5-954cb8395c37', '9788381350013', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('dbfb3a9f-1d64-4e17-a05b-ebacf2a65ee4', '9798885854863', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('ced134f0-1f76-4f42-a57b-f16242b999c9', '6254140705', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('247b5d7f-e292-4cbf-b63e-e6f127b237d5', '9786254140709', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('41d221f1-2dfd-4f4f-bfff-11cba8a63de2', '9781538742112', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('dcaa1d40-2ca8-4a9e-9c21-8d26b23ab74f', '6070769252', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('00dd2f94-1c35-40c9-8052-16e383f43845', '9786070769252', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('a4516ecd-6dbe-4e10-85b2-7b128cbbe661', '8408225626', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('a8e99734-2ee4-4b98-b277-91eb8c2a593f', '9788408225621', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('aacebf28-cb62-4c25-946c-35e5e66547ba', '9798673617151', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('b7975be4-dda6-4438-84da-eaac587529aa', '9781538739723', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('36e5ed7e-cc56-4bc4-a0a0-7006d9a7a23a', '9781408727034', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('58354fe5-dff4-4fbb-9319-687a2555c9ea', '1799719421', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('8738bec6-0d1e-4e7d-a4a9-f557928bd208', '9781799719427', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('45eb342f-9e61-445d-8140-0046a43e4a48', '9781408726600', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('d2671ad7-1020-477e-aaaf-636dbbc28b21', '1804227048', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('0e956477-f06b-482a-b8a5-3a53152025bd', '9781804227046', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('cf928502-b510-4ea1-8f7b-1ab2271746c5', '9781538724743', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('f8db6331-2670-43ac-a8ea-25affe8f9769', '1791392792', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('b4ae960f-503a-4850-a1c8-c02f3753ec42', '9781791392796', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9');
INSERT INTO public."BookIsbn" VALUES ('0ce6e0a1-c000-40a7-a283-887164a106c9', '9788555340949', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('e4b97547-b941-456f-b1e7-b433ab517fbd', '6073808321', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('c6b50fb1-f294-4d24-a95c-f20a50ac509d', '9786073808323', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('60799239-ee92-4bff-ba7f-be42b1352011', '9781250881977', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('54562b85-e082-409a-afe5-d191dbf42802', '2018055526', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('f9e7a66c-c08b-440d-a411-cb90631e13e7', '9783426530597', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('c1b6cb87-51fd-4eb8-a5df-f183d4397647', '9783426526156', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('5c617409-6c64-4ce8-b20c-e0f2a0edffed', '9781035028504', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('018d896f-da23-4b21-ad48-c443dfc9e5d7', '9788427218697', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('75f98942-575d-44bf-a592-bc1c0ea16757', '9786257382991', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('c9959fc3-cdf7-42a2-bfb5-95b60318a94b', '9781250905703', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('8583c662-b9f2-4573-a8c1-00f690a7cf0e', '9781035003891', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('7ef67f52-a3f4-410b-a9ba-47989ca8c840', '9781529099461', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('ccee98bc-6cf7-4e36-a03e-7654c9e1be55', '9781250856036', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('12c16dcd-255a-47f2-95f4-4ebdbc97f7f0', '1663617651', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('620b2643-7ceb-4d2a-a61e-5acd10fd13e7', '9781663617651', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('bcef9e26-b8ae-4eed-adeb-6591ad40f574', '838169308X', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('dd39a0a3-42fe-42ef-9d61-5b77e957cf64', '9788381693080', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('a24fa9da-e641-43b0-bcff-15cbb7faf45c', '1250260183', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('61d81e56-f539-4a2b-a6a0-65aa1180e8f1', '9781250260185', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('5abcb128-d90b-45e1-8a19-ff1fef2c56fd', '1250316782', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('8014671c-c9cb-41a2-9ffe-aa87cbf26d42', '9781250316783', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('8f0c40b1-e794-44e5-b45f-c59e9b47b13a', '9781250316776', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."BookIsbn" VALUES ('a4be119e-7b5e-4bb5-a127-62c0887b0ead', '9789460923821', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('2910b376-fdf1-4f71-bece-3f6d42dedbf3', '9783730614860', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('4b620a4c-eb2e-4ce5-86f1-d13c09ef02aa', '9784805317723', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('84f600a0-9a0e-45ab-8878-3182ad29c9b6', '8574482447', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('db41fb1e-b919-45c2-b791-eee66f733125', '9788574482446', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('d122753e-3fa4-4f3d-b7a3-885fc7b3b7ce', '9781689795937', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('ef315b40-d943-443d-ad1f-af303b50a9c7', '9781712077108', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('f526a184-730d-477a-b5fc-06bdc0cf6746', '9798647142559', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('a64fca01-9efb-4f79-a094-ec5016099962', '9798464122093', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('2d1583a0-907b-4a7d-9acc-5f05b3ac22b1', '9798407060338', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('4d7d1983-6802-4753-a349-c7cd8e92592e', '9780811220071', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('31e42d5e-6cb5-48af-bb8b-6925dd71a45d', '1665283505', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('9a58b1ba-bbcf-4e7b-88ff-cd839157d719', '9781665283502', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('42118241-78cc-46f9-a0f3-4031ae14c562', '9780143137504', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('8e932756-cd6b-47c7-a070-b32dad60d16f', '9798413451076', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('e08148bc-20a8-48b3-8115-f6d49d172ad7', '9781105035708', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('ae417b85-89c8-4133-adcd-a33f0673f789', '9798792755093', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('2c23c149-0daa-4cb4-b772-892bf4259d32', '9798408030026', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('1d93b88d-df32-4057-b045-dc75734b6523', '1647291569', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('826e8be3-1d66-4fe2-a22c-313c978d00d4', '9781647291563', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('7cb2080b-667c-4c5d-a9cb-cc8e59d0dd40', '4569672396', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('c9d27b0a-14a3-43df-b6eb-698eed5a6226', '9784569672397', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('4f731f9b-bd29-44d3-8104-a816f4406e43', '9781935654223', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('1837e8af-300b-4fa4-a4d4-4747f57016b5', '0811204812', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('b548f21e-abef-41b8-a9b6-ff754dfbcc60', '9780811204811', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('e4c5b4a2-82d8-4ec1-8c25-e5ab745a38f4', '4805304731', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('749cc3ba-5292-4fd9-b717-d3a8eb7b33c7', '0720658632', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('5996285a-15a2-4614-9065-b860bcd778ef', '9780720658637', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('71cbbc20-bff8-4757-a1c2-c83f1c909ba7', '1515916197', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('4c5fe647-9456-4412-a25c-13eaee307d75', '9781515916192', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('e01ffa15-9129-4349-bcda-7bd7e54cedcf', '7505738143', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('30229f51-81ba-4935-b8d6-ba8b4ba45cfc', '9787505738140', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('bdc23f79-0ab6-4fad-b542-a56ee420857a', '1974707091', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('d751b0e9-13e0-4eef-89d7-6bd931f802a1', '9781974707096', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('d31aade4-8b6c-41d1-b8df-8368ca8a667d', '0811232433', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('16b4e416-f823-4c42-bdbe-1656ddabd8cb', '9780811232432', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('0e123678-a6f2-4b1e-b52c-5de2a702cc19', '7514346406', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('fa4b452c-9fca-46c6-85f4-ce719242344d', '9787514346404', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('aa43857b-8a5c-43d3-bb9e-cae0fa704366', '9786586068108', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('b9a3cb58-b870-4f9b-ac99-0609f012765b', '4101006059', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('e3468cd0-13f0-4d87-af63-d74d8dfb2e74', '9784101006055', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('a2071dbd-971c-437f-ba88-0f98e373beb0', '893746103X', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('77183899-9402-45d8-8904-8826806522a8', '8937460009', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff');
INSERT INTO public."BookIsbn" VALUES ('4663d68d-7a93-4244-9dd3-ba1d8b394ad5', '9781728274881', '4b5f0663-7696-4255-8971-b1c404ede737');
INSERT INTO public."BookIsbn" VALUES ('a67b8a3c-9207-4306-b2e9-bb6d7b19dd34', '6073908636', '4b5f0663-7696-4255-8971-b1c404ede737');
INSERT INTO public."BookIsbn" VALUES ('7785f5af-e0f7-43a0-a7a2-46be71e83fae', '9786073908634', '4b5f0663-7696-4255-8971-b1c404ede737');
INSERT INTO public."BookIsbn" VALUES ('2b614c49-2872-4fba-9573-535ec9355119', '9781735056685', '4b5f0663-7696-4255-8971-b1c404ede737');
INSERT INTO public."BookIsbn" VALUES ('f6dcc46d-3125-4873-931a-67e22eef50f5', '9780349434339', '4b5f0663-7696-4255-8971-b1c404ede737');
INSERT INTO public."BookIsbn" VALUES ('b1adaddc-fdb3-4836-bb1b-d8aa73114017', '9781957464077', '4b5f0663-7696-4255-8971-b1c404ede737');
INSERT INTO public."BookIsbn" VALUES ('1c592444-97ca-434f-a2c7-3117ebb00c42', '9781735056692', '4b5f0663-7696-4255-8971-b1c404ede737');
INSERT INTO public."BookIsbn" VALUES ('460d1ec2-6a7b-4914-b520-c21f327fbc57', '9789655525984', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('ceca3252-d532-4453-8145-1c081e337179', '9798885795975', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('5db478fc-aee8-4239-8d1b-b836a9f04256', '9786070792281', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('9781f400-8ae4-41a6-b1d8-b2cea1f2f2e2', '1440729972', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('97a38e94-5ec5-4afb-b590-ecedd1eca1fd', '9781440729973', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('2c8755e1-c80c-4305-868c-675f8fe875a1', '9780141956749', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('101607ac-0bb4-466b-a7d8-141048bda1cf', '8466128255', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('b8ffb27c-18fb-4a6b-b712-f4dd77e32e60', '9788466128254', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('dd474d2f-6dd3-436c-8429-7ab9b182d8ed', '1416968296', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('e61bdcc3-0f13-402c-afa7-ccf42a2f3937', '978-1416968290', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('b9c266c2-3450-4cb6-8ba4-2eb5318dea81', '1665927194', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('d76976c8-5bc2-481f-83b2-48a3c724def3', '9781665927192', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('a1796e2a-8c5c-41d9-8ae8-5d0ba2f7035b', '6053040916', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('e4ec0bf8-b8b6-4c22-b1b1-17d4e0f0440b', '9786053040910', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('0491f43e-7df0-46d1-813d-d0f17378706f', '9786070722165', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('00193336-ab4c-4f82-8857-a46414a4905e', '9781665922074', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('c8ac83ee-89ad-4ea5-b7cf-b3bd186dd16b', '9780241599198', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('0cf4c89b-7319-42f7-bae7-a8bfe895a909', '9781416999171', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('abd06c54-2078-4183-9261-2b2ddeb9b900', '8551004441', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('7b6c44b2-1a94-4441-8e6f-910aeb6aa0da', '9788551004449', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('3cc02b4a-9ea7-4c2f-b402-7566df9ce705', '8408208535', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('250c5bd2-d4ef-40d4-a66a-e47f61d9a53d', '9788408208532', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('080040eb-06c3-4a20-ae9f-187dddde0f02', '517100160X', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('74f8fe53-3f79-4e49-be3c-16e6180ca957', '9785171001605', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('65ec07db-c0e5-46aa-ad92-358b56362821', '9781416968238', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('39e3a59a-ae96-4b7e-9fc5-ccfeb7162aaf', '9780141330532', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('75198d7a-b1df-484e-b9ae-a1c9c8ea9128', '9788408111528', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('85956cd3-6cc3-41bd-a5fb-fc333606fb4e', '1416968237', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('929096a7-84ff-45c7-9f5c-2572b0dd0144', '9781416968290', '5502fedc-0dbb-4645-a92f-7619bcc030d9');
INSERT INTO public."BookIsbn" VALUES ('f8af8409-4552-4810-a4b1-b69ecc95c062', '9798897248889', '14728228-cbb8-48d8-9f59-109402188de6');
INSERT INTO public."BookIsbn" VALUES ('d7518471-4877-4963-bfb9-4a511f66c6c4', '9027400431', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('1525ac7f-0375-47bf-8ef8-1041b73238c9', '9788595084742', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('c6c5bf20-b62a-44a8-a927-1d8015137224', '9780063417069', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('5688873e-2033-4fdf-abcd-6e9634f77862', '9780063396203', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('3c950576-1b05-4a01-b5c5-4171f9491cf8', '9780063388468', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('b6af8595-2300-467f-a12f-d118aa5854a4', '9780063388475', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('a4af1122-ca7f-417f-b3f5-4f3abdadc34e', '0008118043', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('26e43d05-0c04-425c-8bc2-5cd32089c852', '9780008118044', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('eac9fc34-3728-48b0-9c9c-353378be457e', '9788845271403', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('3e723c32-e18b-4576-95e2-9bc935519ab0', '9780063347540', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('9f5a7cb0-8021-4277-95b0-633f48c97c79', '9780007172733', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('316109b5-4287-460b-b08d-64d55312fc7e', '178201120X', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('082c85e4-6332-414a-b768-344f540ea36d', '9781782011200', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('5b4185c0-938d-4fea-a502-f9f8ed4c3690', '2356414916', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('3da00554-e9af-418c-aff6-2fe7f25bfa01', '9782356414915', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('ba6e016d-63ec-45b2-a037-6a76f3006c14', '5878600129', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('f21bb289-2113-4a9a-9bbc-9ba69b7b0e91', '9785878600125', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('a0679bcb-6a28-461d-9a9f-1a3cb7e21e70', '5170075308', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('a415ac08-eb16-43a4-b874-bfac6cb729fe', '9785170075300', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('c0354879-bfff-4967-bb3b-1c33db2d6e98', '8595086087', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('46cc8460-7e17-426e-a2fa-6d91bf992901', '9788595086081', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('93f564cd-e5a2-4cbb-9992-8f67967b5ab8', '8320717507', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('2e9d46dc-a4ad-4d67-976e-ba15d3621b29', '9788320717501', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('a4529bfd-df76-4cea-9535-711101b85011', '1782010890', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('16fa1096-d0bc-41a9-ac7a-b922d5f9b9dd', '9781782010890', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('fd07acd4-50ae-4b13-a3da-36fe77c0ed24', '1782010912', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('4c9164d1-3351-4576-87e8-715663265bee', '9781782010913', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('7655dd16-1115-43eb-b566-a0e2d4f2b85c', '9780007485949', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('9afc18ef-8a17-43b7-acb2-277e44e02e2a', '9780544120020', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('5bedb8c9-f6cd-44ac-9667-301608a6fde9', '9780007488513', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('0b0fe184-726a-43a1-84cd-8ca95fa9e2d1', '1904808905', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('6d38f9e1-2edd-457f-9a23-a03981753472', '9781904808909', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('b53b1991-bc5d-4517-8225-e53e6079f37b', '1782010335', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('3694f067-b164-4c8d-9917-354588a43f7c', '9781782010333', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('3fd9e090-6d07-43ae-8658-7e0ed12c67a3', '6066093681', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('0fdd122b-5a7e-450e-8f7f-4bec67f82047', '9786066093682', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('35a89684-ce5d-446d-a76b-5453efdf4b9b', '902254320X', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('cdb0b4a0-036e-4bd3-bea7-7d13f4e78a4c', '9789022543207', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('0e81523f-4898-406c-ad2b-e9bc479f5f8f', '054792822X', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('c53f19c0-205b-49fd-91dc-d4e64ba6d7d5', '951022359X', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('7f77aa9c-390d-4bda-ae57-5fb4123ce497', '5948490904', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('d04cb470-0d73-4767-8ab8-60df21f8a0d3', '842261586X', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('da9669e4-7eb0-4d73-8bcc-71cd45f23d9e', '9783608938180', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('41c63453-9a71-4642-b909-f2620a04c073', '400026463X', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('d4eab820-699a-4716-9faa-d042de109118', '4000264648', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('8181fe68-c1fe-4a3f-98de-f359bcb54b26', '8020702628', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('790c7fd3-a153-4de8-9555-aa4f71457fff', '9684460368', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('da928a4a-d7da-4151-852c-6c21380ac7c1', '5170104936', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('14e56d14-d4ad-4344-acbc-44f0433d3b37', '5271000249', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('1a8cc965-4210-45ef-b3e4-f5cfc849f1ac', '0785922059', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('a5eea9b0-bacb-4a70-9a01-ba6c119f9777', '9780785922056', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('c6e68684-c5a4-4c3f-aa28-29f8243cfcb6', '9505470630', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('66735b0c-70bd-41d8-aa01-7030533018fc', '9789505470631', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('05eb45e4-fd54-40af-b4fd-09bb5cbe7e75', '0606244263', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('2ae1ffd3-14b2-437b-abb1-14e42b64736b', '9780606244268', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('edaf36a4-839c-46ff-b43f-1d267d72ce59', '2010147804', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('00bd63c4-9288-4312-a0ee-e1e6e44a1c01', '9782010147807', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('0d4ee451-5a42-44fd-8645-e44eadec03d9', '2267013177', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('349de016-1518-4951-a742-0b8649ea83a8', '9782267013177', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('fb5d556d-1c1b-4935-a1e5-d5e994a51079', '4001120887', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('e06bb546-66c0-49b2-bc96-ef52d8697c68', '4001120895', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('acdbf66b-2b7f-4061-86b9-901f13c17c1f', '8445070371', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('0af0cf6d-91ec-42b7-8569-0f820c4b1f59', '9788445070376', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('fdf14dcc-51bb-4488-acab-f8dd483e3b32', '5699006001', '92f8c5ef-4171-40d4-9229-dc39ad424ee1');
INSERT INTO public."BookIsbn" VALUES ('11c5e13e-6e89-4661-b7b8-8340eb16f464', '6073913222', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('3bc9ec54-51c6-4fcb-b57d-370eb7b3bb50', '9786073913225', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('6f3f6aa7-76b0-4e6a-bcec-052771887838', '9798885797085', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('ab94b321-65a5-4a9e-b0df-5f520b4380b8', '8408268198', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('fb12788e-d3cf-442c-950f-aace1a9c9b10', '9788408268192', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('d7d1db80-9e07-41ed-b873-38b0f3aea8d0', '9504948626', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('db71cf24-053c-4d9c-aef8-7e64205013e7', '9789504948629', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('0149d0e9-a500-469b-b885-de79de289687', '8408257102', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('365a56f8-8fbc-4467-a559-49877b7ada1c', '9788408257103', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('8051f52d-db0d-4eda-94a2-22dd1af9aeb6', '8328098458', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('85cff701-e496-42b7-bb0e-5bb80d62eaac', '9788328098459', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('20efe77f-e5e7-4a82-97cb-2cb066a8a0bc', '9781490676623', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('539c5860-bef9-445d-89fa-bc0f96c5e15d', '152664116X', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('5bdcf9bb-41b4-43d9-a2ab-e699b557c56e', '9781526641168', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('ee3e558c-5c3c-44d5-b472-f02e10316f28', '9897545352', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('673ecd52-ab42-4c13-b365-1a579761c635', '9789897545351', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('65159eba-a2d9-4e5a-b804-d4379c36cc23', '9669821339', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('075199d6-19de-44b5-89f5-dd5756c488ff', '9789669821331', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('f04ffdb9-9f77-4748-82f6-9682c3c3f1e5', '6050935440', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('5374bf60-1869-4da1-8024-aee777178733', '9786050935448', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('dfb7786f-ded6-4a9f-a2be-5513eaa2713f', '2732487597', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('c0753de4-883e-4e3d-8e37-9c3a31b4b503', '9782732487595', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('c4bba48b-6ad1-4a9f-92c7-44e78e214860', '2732472301', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('4c03cbb2-f7fa-40b8-aaa6-e94a55e59d5e', '9782732472300', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('23e03cf5-2666-4a53-ab87-9e0c3d890f51', '8501107115', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('bfeecbc1-370e-49f9-810d-39cd4df7d0ef', '9788501107114', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('36ddb5a2-c991-426b-8242-829116a81b24', '6559810720', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('0f90771e-1b12-41e1-adcd-a6221574c30a', '9786559810727', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('d3129fae-ba7a-4578-9a18-5ee16673228a', '8408155083', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('2d3218ea-a663-4488-b493-37cc6726bb39', '9788408155089', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('47340151-96c8-4b02-a30a-7bebde0a0cae', '1547604174', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('6fc26e1b-d4fb-4382-85bf-d64f0197c6bb', '9781547604173', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('32bc9ef1-328e-4081-93b7-8657d0ee8d8a', '8328021412', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('502ce1a0-b28b-4e14-a7c8-a9865841c7c9', '9788328021419', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('19358759-a21c-45c4-ac46-f7690f5e481e', '3423718498', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('8bf3180c-108d-4af9-8987-50bd36e28975', '978-3423718493', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('6c6e4fe7-b725-42ff-bd8c-efeaa7443d38', '3423761636', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('6c0abc36-23de-4dee-bef5-9f8480cc0011', '978-3423761635', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('8883b6ff-6b39-4375-96c9-3a95e8f63c6c', '8501105872', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('22d1754d-614a-4a27-a241-476a817b7a4a', '9788501105875', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('38a9d1f3-a213-4ca1-aedc-26fa26695a7b', '1484481747', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('ae2f2b54-88e9-42ad-a1f1-b3624e7bc0d2', '9781484481745', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('ee7779fd-4c10-49b9-9e6b-9df04552d3e9', '1619635186', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('2e90ae98-fbc0-411a-94ed-025e3648a86c', '9781619635180', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('9375df59-843b-476b-b1b5-1459891ab353', '1635575567', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('a714100c-a261-461e-9bd9-76225be86e7a', '9781635575569', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('bb072947-b9c7-471a-be73-1fe3923e8e36', '1526605392', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('fa3fa0ab-d287-465e-9f19-30565855314f', '9781526605399', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('58561ef1-861d-4227-8376-1d59d4515926', '1664434453', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('b307033c-b1e8-4aec-a074-c35c85a70f93', '9781664434455', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('293cc74b-4977-4d3e-b11c-5b7e19025b9e', '1408857863', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('a43adde6-c5aa-4619-8bab-aa413e41e4a5', '9781408857861', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('c08f1c59-47f0-48c3-ac0b-b98e0f4bc258', '1635575559', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('260d2568-e3f7-4f5b-8900-1d4872c73a26', '9781635575552', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('783c3621-b396-445b-a325-0850b641f952', '1619634457', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('eea8c2b2-ff3d-4051-a455-465b6017e9dd', '9781619634459', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('256e87ed-d56c-4e9a-b6d8-cf42b73bb6f5', '1619634449', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('00f4c392-19ec-4c47-aceb-3c488d07b6f7', '9781619634442', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('3f11567b-baa5-40f8-a255-93699a71853b', '0606385487', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('bdb61e70-85bc-49ed-a6b0-b36dca55db44', '9780606385480', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('8e8cecab-7622-4952-a61f-87601bc245d9', '1490640738', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('87207801-1a95-4535-b71a-7e9b96386c7d', '9781490640730', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('2d5e94a3-26fd-46cf-bcfb-05d26f5ae1d6', '1408857871', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('bd0cc46e-355f-46ce-8c24-17eae0785863', '9781408857878', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."BookIsbn" VALUES ('5247935b-7317-4b09-9c0d-a39616b3522e', '6073148127', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('66fa3724-f44d-421d-a0fb-c0abc0574cd2', '9786073148122', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('9bc531df-797f-4473-bbd6-c18eee4086a3', '9781509822690', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('1cd9541e-ec51-40ae-9402-e6da395109f3', '8952776364', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('22fa3764-32e1-40b9-b0d8-7629f8baf028', '8952776372', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('28d9c280-4402-46bd-89b1-dde9b565b119', '8952776380', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('d1db9d0a-7185-4259-b038-c0f6c3f20d55', '9788952776365', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('cc15745e-dab9-4ca2-9f76-29183615383c', '9788952776372', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('effd528a-0a30-4195-9f49-ad4d5b3db3ba', '9788952776389', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('5a677f9f-73a3-4963-9a4c-287320fdbd83', '9781529077216', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('7eb3b51f-4523-4cc8-8876-1e54f732d158', '9781447294849', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('cdaf354b-41d8-4e44-8f3b-f83db3614245', '9781509818235', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('17eaa3cf-4773-40ca-b7ab-03c57745352f', '1511363800', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('666cdfd8-b112-4147-bc08-a69454ced00a', '9781511363808', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('8cd41953-aa54-4dd4-88d4-9041983cc4dc', '0385539258', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('2bcf83ec-4081-4cd7-8967-e2eaf2720132', '9780385539258', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('d3af2a79-1218-461c-9095-2f6022529f19', '1101972424', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('321ae40e-1214-4dfd-a19c-47821f6c6139', '9781101972427', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('1ed1744b-20dc-49a6-a682-08a58381a4e4', '6050949883', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('8f939434-bfba-4b04-a252-6a1bb6e0b654', '9786050949889', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('853f6fba-1bb8-4285-b6cf-f1402a20bf9e', '8328026481', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('a67df7a7-9c89-4653-91bb-a3187fdb4c7f', '9788328026483', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('843c20ee-4b28-4dcb-8246-5abe5274661c', '1511358602', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('e113a187-a5b5-4ceb-900e-3a2f5193eb93', '9781511358606', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('5aebe9dd-7969-4977-96ca-a64184f973e3', '9783492308700', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('a8099960-e63d-4a0b-a8e4-b73d6d959fb3', '1447294823', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('2980e2d1-192b-43b7-bc2a-d4ea72817d66', '9781447294825', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('9074b9b1-46a0-405f-9ee6-144503a032c8', '1447294815', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('1ad9c384-9c08-4c6d-a99e-7a67929649ef', '9781447294818', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('38e819ca-67de-4039-bb67-aadc4957a640', '9781529061246', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('f27319c4-190c-41a4-9a8a-aa0c9c7f3682', '5170971192', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('6ab8b2fc-4589-41e3-85c6-f9059ca3a22c', '9785170971190', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('011b2b4c-6b6b-4066-96ad-b1c298d06339', '0385539266', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('449ef22b-5e00-41ae-a0b3-a1ebd8bbcd75', '9780385539265', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('2209191a-1c9e-4b02-988c-014b6b5443eb', '9789513196790', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('4faf8d7e-05c1-41d8-9d3f-5c44472f7171', '3446254714', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('e18df0b7-2ab4-471a-9886-bc9d9cc7278b', '9783446254718', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('d00d3d1c-58a5-4939-b45e-cf35f69f75cd', '8501071544', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('2e1cbf45-c8e0-47ae-afbe-9b4f3177fb64', '9788501071545', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('df26fd2a-85cb-4e69-947a-3870ed406c11', '9046820319', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('4104047f-16d6-4702-b415-c2e0df702cbe', '9789046820315', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('14ca0e00-4525-4359-898a-21ff6557f992', '883893584X', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('72d008cf-9ebd-4f5b-8cb1-865fedb879c0', '9788838935848', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('5f6522c3-58c9-47bf-8fea-a682fc059dbf', '1447294831', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('aaf074ee-60a3-4348-84b5-6e2170545d66', '9781447294832', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('e35a96f6-d54f-46af-bb18-0ef8623984b6', '9046820327', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('675af9fd-3bf6-4d08-99e1-d55bbf64874d', '9789046820322', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('86dab1f3-ec2f-4eb7-9c28-9031d4000caa', '9780804172707', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('c5d04066-5a91-4d55-9e53-dc111a21dc21', '8426403271', '8c2cced0-b873-444b-a4e4-9228c63bd21e');
INSERT INTO public."BookIsbn" VALUES ('5e717714-2a3b-4fc0-a306-4b368f9864db', '9780141345642', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('ac095c2c-2a91-45fc-9a2b-659ce481c85a', '2092556738', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('9b17c056-5bc2-4b95-a2dc-118d61090342', '9782092556733', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('3a3a32f7-01b4-44c3-bff7-2d0ef9979d22', '9871997051', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('d3a76882-287e-4da9-bf17-a692f5081be3', '9789871997053', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('aad5f722-e896-4238-b305-d355cf5ff19c', '9163873664', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('98255864-352e-45b2-a901-c26942e3c7f9', '9789163873669', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('a3c443d2-e383-4215-a6da-91a5e0064cde', '1491510706', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('feeea5a1-655e-4b65-9242-1f0e35b63de0', '9781491510704', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('8139869d-65e7-40b6-abdb-757ad64e3200', '5170867123', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('e0e50d41-94a9-4b15-a63a-bfa5d5e5b776', '9785170867127', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('3ef85b0a-8f4d-416c-b69e-36e8b330c5d5', '0525426418', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('9d408627-5c5a-4f0f-8779-ad39c1a86a66', '9780525426417', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('621c9107-4786-4f83-8cf7-5c916d283842', '0141353678', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('0f0cad01-aebd-42f8-b447-272ac25f5046', '9780141353678', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('54986c67-c843-4f57-aff4-7a20a57e5c08', '8934974127192', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('0032f27f-ff8d-4bc7-a6e4-651935877095', '6073123191', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('56878f4c-3048-4c51-9621-be3125744b3a', '9786073123198', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('938e93fd-04d7-455e-8daf-d18e33f0f34d', '9780141345710', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('8dad1f70-b3be-45c5-b2ea-e57b377eb0f6', '9780141345635', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('b4483e10-c229-42cd-ad7a-a18a8ccbcc50', '9780141359151', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('4b294bc4-5e5e-4304-9cf2-69e76a76f280', '9780141364247', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('ab1990e5-7a53-4551-a957-cbd89cd90b4c', '1455869740', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('5f4b10d4-b171-487f-9280-e12034567aaa', '9781455869749', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('6d9a9745-bcf2-4d91-8aa9-f66fab31bb69', '3140412886', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('d6603bb1-b89e-47c8-9763-258f8bf2f9d5', '9783140412889', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('7e1df371-e99b-4374-96b3-11be41272aa6', '2266283308', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('49e7e01c-2016-4804-b386-981d8aa466ed', '9782266283304', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('66bc7d3b-64e1-4fde-96fb-98c50f382dc0', '8580572266', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('bec88c77-7dc0-4f57-89af-f75904d7ca91', '9788580572261', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('5c4445d0-93dc-4011-831a-93ec42f8f7cb', '8466335366', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('d7306f3c-aefe-4213-b373-e66f42f36058', '9788466335362', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('b47031bf-ca47-4ee1-82a3-79d26d9d7ca2', '9871997000', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('e32ce8df-2386-4996-9205-b2b390c29346', '9789871997008', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('19b7c594-fa57-4489-a65d-dd0b09ae34b7', '9789585783010', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('bcee253b-1312-4d94-8be0-6c4b06238e58', '6053430935', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('2502eaab-5877-4f2a-8119-740fece0eb80', '9786053430933', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('8f9272b0-dbdf-4fd4-9cba-0413f43c7906', '9781484434949', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('1058cbcb-a1a5-41ef-bf66-36515a3ddfa9', '9780141355078', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('81bd714e-3f02-461b-a6b0-081a55248ca2', '8415745796', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('e06c150a-4cd4-4f17-9f82-4effd3fec1d8', '9788415745792', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('9cf6d5ae-5934-4a6c-91a1-9346156ce8ce', '0143571621', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('d4f23001-8714-4e30-8ef3-ce3001d638e3', '9780143571629', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('b52e5bf2-118f-4165-ae39-b19244ed8a07', '8364481177', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('36de0650-981a-41d9-9eed-c3aa1ce8e8a6', '9788364481178', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('4ccf9f90-2fe0-4a34-a342-08f18ad39f82', '9781484423820', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('e2857958-64eb-463b-8a6d-839f2854cfca', '342362583X', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('acfc37f3-5bed-4d50-bcca-438a021f9134', '9783423625838', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('403f8fdb-d128-4f19-a3ce-67532d8823d0', '5170867131', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('2fec0361-9bb9-4a4c-96b1-7d29729c91fa', '9785170867134', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('50130e79-7b5b-4f05-88c3-2576efeade60', '9571052051', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('5370db69-998f-4b53-9e3d-cad691970e70', '9789571052052', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('b7f84dbb-1810-4d5c-ae13-7abafa8e72e5', '0804171084', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('b12955f4-0091-4f2a-a7af-b944b1800f76', '9780804171083', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('11f80736-7b2a-4349-901b-324013bcb1bc', '2092563963', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('a7085766-058c-4c7e-bd82-62ddab1c9e5e', '9782092563960', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('2bd33fd1-939c-4ba0-bcf3-f8dba6e299ba', '9788362478897', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('60423640-7a6f-4502-bc8d-1d4fd04d99e3', '9782092543030', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('6bb84604-c3ca-4982-abbf-47257f97ee18', '1627653627', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('0db57334-dd1a-4adf-b3b4-50d1ed170882', '9781627653626', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('b91f7aff-6118-4b72-957b-53ebc9c744ce', '9892320948', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('e995fefb-0ade-48a1-bef5-db31e7d9d83b', '9789892320946', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('ae963c4d-ef10-4ce5-9546-214191fb8ed8', '8817076333', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('58889f95-861c-4b89-96c1-e1ece0a0ee4f', '9788817076333', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('f94d2ef5-c160-4aff-a272-695121250f24', '9789047706618', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('4f657f68-bf12-4c80-89f0-c92a1d163e7b', '0525426000', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('75663533-de68-4850-8fac-730c46165a8f', '9780525426004', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('dc350f73-3987-424e-85a7-06457a5fecf5', '3125738504', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('d0861143-36bc-419c-9397-e71748dd674d', '9783125738508', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('cb4834ea-0f79-406e-9ff2-96a48c32cfb9', '9789670374949', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('8f792935-8f4c-4ec0-b292-a0f485deb102', '9780141352589', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('fe4d06aa-3a12-4d99-be05-c4f41d8f2ea0', '0525478817', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('e34c43c1-f0e0-4757-8a09-4739f4090c52', '9780142424179', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('09c1f7b5-e9bb-4d93-8b6e-9fb352d6be4e', '893783376X', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('9aefab66-b74d-4884-9a80-3329463911c5', '9788937833762', '7b6e0ab6-d10f-43b0-a235-543eb576926b');
INSERT INTO public."BookIsbn" VALUES ('554eb522-df86-4362-bf85-ba78ee4458b3', '9781638932925', '37c06057-0c8c-491e-8bbb-66966da19843');
INSERT INTO public."BookIsbn" VALUES ('0002d610-2965-4bbf-bfb6-c6b9ffb588f1', '9788418483912', '37c06057-0c8c-491e-8bbb-66966da19843');
INSERT INTO public."BookIsbn" VALUES ('f51a7ec8-6c9e-4134-bc09-72db8c8453fb', '9781638932475', '37c06057-0c8c-491e-8bbb-66966da19843');
INSERT INTO public."BookIsbn" VALUES ('d9f34362-8fdb-4e85-9327-2dfd27a3e98d', '1957635010', '37c06057-0c8c-491e-8bbb-66966da19843');
INSERT INTO public."BookIsbn" VALUES ('427e60b9-9591-4fea-90f8-5fbd836ca3d2', '9781957635019', '37c06057-0c8c-491e-8bbb-66966da19843');
INSERT INTO public."BookIsbn" VALUES ('df781459-d3da-4212-ab70-9444df3ba181', '7020086624', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('0d786794-f8ee-4011-aa78-e18ce92a3f56', '9787020086627', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('104c9f88-89ff-471d-a82d-666f90d96912', '9771429841', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('25a495e1-ad34-4d17-bdf2-fe596f5d6a0c', '8183222072', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('57217acd-f20e-4b97-86de-8a5014136623', '9788183222075', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('b025789c-de4d-4446-9757-b74b5f949187', '9994030671', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('fc65fd90-d114-423d-8f8c-12d286445d51', '9188879046', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('fe75a3a0-aaf0-4792-a595-1e45ac91081f', '9789188879042', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('dfac88d1-fa43-4d30-92c1-a2f3fda77952', '606788254X', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('af3d702f-b4ff-4020-a098-cbbc24755d33', '9786067882544', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('d3bc98bc-098d-4922-b4db-5a11353dd97c', '8983921455', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('fc1e9368-de56-4487-8509-9788c943179a', '043935806X', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('92014310-f4e0-4b80-b3e6-3e91a4827219', '9780439358064', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('1388a963-a5ca-46a8-b1cf-235308effd43', '9780545582971', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('faff30c9-2564-4821-8a36-9e80dc9d19fb', '9787020103348', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('bc4174c2-a7c7-4e53-b00a-00ad49d9b727', '9787020043279', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('233ebf67-a8be-4660-a586-3e0bc1c16391', '9780329379278', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('88235f2b-81af-49b9-825b-8ea2ce426901', '9788183220712', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('ad0a3846-117b-4cf9-b5fe-ca9ae0daa644', '9788498384468', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('23bbd2c3-3792-4fb8-b9f8-2f6fab6629d9', '9781408855690', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('9682674b-fccd-48f3-a06b-2320288cea74', '9788478887422', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('faa71dea-d71e-45dc-bba4-d2825d19d6c0', '9789645757746', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('15ce31f8-8a7e-423a-9c07-cb5adfba2ae9', '0807220299', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('2d0e1a61-f75b-4b6c-99ad-4e641cb040ce', '9780807220313', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('be1aeb97-8808-43b6-9b67-083107f911b6', '978-1781101353', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('f1a66c25-c144-4078-9731-9f807813fd39', '074756972X', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('9d36bab1-92b6-40f4-8cab-29c2ce77065b', '9780747569725', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('25ab9843-3faa-4293-9f61-8fce536baa1f', '8000012944', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('9ae36e56-d091-418d-8d1e-8c00a0a17bd5', '9781523942619', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('37fcd6a2-2355-47bc-a940-4932d8d2e44e', '9781523481491', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('0bb7677f-d9c9-4ef6-a4a4-fb611658c619', '9781523480890', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('8726c5fe-98d7-4c70-b7ea-52e66f2f821d', '9781512377521', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('21984004-099e-468e-b108-a6adf3a4c01a', '9781523480661', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('9d8227d4-fd3f-4ffd-9c6c-d7c08ee4e40c', '9781512379020', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('5202da04-fb1f-4c77-a0b9-d5dd3edffdf1', '9781523481569', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('dbc18e8b-6bca-4f58-9648-e7c2ca096ffe', '9781512379297', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('0ee9a4e7-9338-4ac1-b6d1-124ad8f1fd57', '9781512377699', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('fc2d2242-6e62-4595-a145-8b7a8fac4e88', '9781512378757', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('8695b90b-ab5d-475b-800d-a3b00d918ce3', '9781512378665', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('495a971d-a8a1-4d56-9b4e-e61c4090afab', '9781512378313', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('1c61a452-b3ee-4e3e-9eed-10aad5b2b85b', '9781512379198', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('def19bae-e692-47f5-a39c-158b26780cf4', '9781512378085', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('8135541e-9348-41e4-ab03-5e029e25f720', '9781512379457', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('ffae8dd6-dbed-44e0-ad3d-51ebf1919fcd', '3551552975', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('c6b85f25-a2da-40a7-bf85-d231a39c38b1', '9783551552976', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('26922d81-6096-407a-b8bc-517e39714974', '3551313156', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('b4910b01-0d03-4973-93e9-a53cba3c388a', '9783551313157', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('1cbad272-6a3e-4632-b16a-a3685b86c1c6', '3551555001', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('a17eddac-94cc-4e92-a8a7-ce56e633f368', '9783551555007', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('7ab0057f-2b91-4451-8235-f99e1f39c191', '8498383625', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('355227db-2933-4504-a3d2-5d2c95957e2f', '9788498383621', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('f7093d7e-da68-4568-9455-326ad2d77e45', '8498389135', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('f1ba7a91-fc65-45f5-a832-b08c03ade138', '9788498389135', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('cfd4cf6a-ebdd-4a9f-8be8-400769b24fa6', '8498384451', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('e2235386-4204-4b0a-a1fd-734df533877f', '9788498384451', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd');
INSERT INTO public."BookIsbn" VALUES ('351b094b-2908-41cc-8a5b-9ee133364b24', '9781784878986', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('79e04011-d5a1-4cf9-ac86-b53b3250bc32', '9781956861372', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('c56b74e2-b233-474a-b4d4-9c16ef61e697', '9781788505079', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('9dbbd172-f1b3-45f2-8a22-5f8aa8d33947', '9781839040627', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('d689fd89-4b9d-4d4b-a201-eee81a69be83', '9781977688101', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('51aaa5ba-0ebf-4941-9962-578ed3b7ebc8', '9781501027277', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('113959e3-e7ea-4d87-bb89-a6e49709c845', '9781548021924', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('3e395bc5-7455-46a9-bee0-cfa0272cdd67', '9781535061636', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('54c46ead-4913-4349-aa47-f25366766b90', '9781517738150', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('8445371d-dd8e-4bea-8715-82200fdfe82b', '9781975963453', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('21449357-bcb2-40a7-bf91-4ec62f3c056e', '9781535128995', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('9afe1d3c-9ac0-4f72-af18-378206c48816', '9781542304504', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('ffffb04d-f89c-4166-859f-50643b1df976', '9781519719843', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('fa7f6f52-ea74-44c0-a37c-835a8bb30ecb', '9781547187768', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('8bc3768c-3bb0-4c62-a6c1-85f5dbe205fa', '9781979429016', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('30b96af3-8e46-4d5e-8735-861892224dde', '9781503138612', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('0241edb4-7085-4d63-9e7a-e1cc0304b4a1', '9781976587313', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('6abb2c36-e42e-4861-a0dc-23cd06674991', '9781721273379', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('57aeb33e-92e4-4e14-84b0-9bf9efcd277d', '9781548880156', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('fb61351d-c0a3-4692-bae3-6e8324679f42', '9781721557929', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('3094fe2c-9098-4de4-a7bb-a9731893f21c', '9781802633894', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('35aaf508-832a-4451-8f7c-4689992fca98', '9781503311244', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('9f35af71-6afc-48d2-af6e-889b4050345f', '9781722837273', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('f2a61ef9-812e-4a93-8aa5-113f3b089641', '9781542525268', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('e9a41a43-02c7-47fd-822d-4df84d4276ea', '9781721009442', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('8a7e68e6-fb18-4f31-b5a4-a8ca568d961c', '9781502364395', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('7363ee0f-81e0-4e89-b716-f4162819bc89', '9781983510175', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('cf450d44-732c-435e-af7f-b743e7d933b8', '9781979512176', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('2277c974-814e-4a9f-ac7a-40431da4361c', '9781537553467', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('d944ef8e-7ac4-4748-b9e6-c7a1ab8168d1', '9386538288', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('b023ac75-8bd3-4756-a109-dd37dee24cc2', '9789386538284', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('4ca270f9-fd36-4e67-9628-c50dd0748818', '9783962725365', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('41170e7d-71d5-4aef-b63b-9957991a51d6', '9781456635817', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('82a6f6f1-479d-4187-a8c0-2e3becc45b65', '9798562406538', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('a59f8201-4ec1-46e3-a8e7-63e8dc72a410', '9798456842077', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('7adb8f32-97ff-474c-ad4c-a9fbc48b04f6', '9798456659804', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('bfba6f76-917d-4e38-a385-0643119f7519', '9798465190732', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('ab1cafc0-df21-43a5-967d-16521c85f837', '9798456710727', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('6d2dc81d-4b2c-454d-b293-ba8a1e02f5f7', '9798455923234', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('6f82046e-2f20-4d7e-ae49-ea071c240fcd', '9798455906602', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('cefa64fa-d200-437b-8885-c8ca13ca9916', '9798457213630', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('0b1170ee-42b9-4b39-b7a3-5c6c2ccc75e6', '9798560332440', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('aae31c0c-f349-4f67-b759-9e188d83b0e1', '9798696441177', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('cd13f1d2-1f3f-404a-afef-a80c277a1bea', '9798464955127', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('e64a4b0a-b8cd-4c71-ad83-25cd9f6f5ff2', '9798481857411', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('90e4bbf5-1f2e-458f-973d-c6b7179d3a48', '9798463043238', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2');
INSERT INTO public."BookIsbn" VALUES ('63d989df-19d9-4dc5-b425-05ca2956d5d3', '6589647194', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('dcd25b13-ed60-4c77-8f2e-a4b7023d0f00', '9786589647195', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('762e5bc9-dd0d-4ad9-b103-5cda4de8f7ad', '9781539814771', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('a84b0175-c95b-4d6a-903b-289c1899771b', '9781505918601', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('1b34e011-5aaa-496b-a0b7-ff3a7c1f47eb', '9781505738438', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('ed78cbfc-dc84-4e73-b5ab-69ff3f2ae373', '9781983704536', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('394ec7a0-2c9d-4821-977f-7df921a90ff2', '9781507170649', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('b5db0ba3-47e0-48ca-b630-460bccc9f9eb', '9781494975081', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('6ee6c2fc-fb4b-4388-a5ae-7a2f1cf99a14', '9781523659746', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('81172d3e-f54b-4364-812d-645747738917', '9781721879502', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('f6f03165-7409-46ac-9a8e-b4d4048d9052', '9781500733223', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('71300565-4349-4ece-b71b-2dc13b1f09dc', '9781514648148', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('be4311bb-3d15-4759-b6ac-b31dc8e4cc81', '9781546604570', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('d438522a-82eb-4ed0-8f19-75b5786fc77f', '9781546901068', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('78d60439-899e-4b73-bb1b-8dec06a3af9b', '9781533339553', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('0cb9dab0-80c8-444b-adf6-7db3d07fbe24', '9781981499359', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('1bbc6eec-5f47-4ca4-9163-3203638bd904', '9781519724915', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('62dd47e7-fcda-4422-a34b-94e4f89bd382', '9781539936978', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('3ad114d6-0f77-409b-98ed-6df43b9d091a', '9781535246385', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('e6dadce0-795c-4c56-b66f-60678309a17d', '9781975943769', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('31a26a56-0d55-4849-80dc-4c01f7010de4', '9781512260816', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('39518346-97c7-4ab9-89cc-39ad6bc1471d', '9781530908172', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('00486956-c995-4e81-9271-75b8926ef367', '9781721879120', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('97fb8165-08e1-4ffb-9e1e-1a07d498012f', '9781981171408', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('93e1fe6f-9bf9-4465-b74e-779e8b420856', '9781512148589', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('537913fa-08e7-40c4-9eed-4020d0e99473', '9781494835163', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('2b241fb9-a65a-4816-b7b4-e557e6b96ce1', '9781519724984', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('527d882d-77cc-4311-9974-c9bdb47adc2b', '9781530897292', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('6170e4df-498a-4cbd-a2b8-2d5f9ac9d717', '9781507198605', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('2b17ee56-898d-4feb-bc18-f2a90ad2ae33', '9781542968485', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('a407cb34-c674-496b-bbb5-8d1ed1e29c7f', '9781537566382', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('cf8b08b1-048b-4f77-8168-37744d6f860e', '9781721878888', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('7004dfeb-7cac-487a-aaac-68ca12079606', '9781539350736', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('f5519057-0c4e-40b8-b21b-4cf5a61182a3', '9781535439046', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('18279c93-f709-486d-8656-7aafb46e5d55', '9781547203383', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('bd5dde3e-9bd9-4f98-a7ca-c09d5b1a3a91', '9781721136957', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('f7c5569b-48c1-476c-889e-545db8062b21', '9781508826194', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('4c56f405-c78b-4ab6-a48f-bcb51ba27587', '9781517724085', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('4de25fd4-615b-4646-b003-3bd0f91833cb', '9781539723080', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('e103859c-388d-4281-8538-deb333d6e63d', '9781546955597', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('0ed1081d-04e7-4210-8bd2-ca165ac9d1ef', '9781514846551', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('66415b59-f73c-44b4-9343-3c5e5108cae5', '9781516874217', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('d11b2d45-58ab-43dc-bb4c-e3c2efa42d50', '9781975677411', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('3ab7336c-5a48-43c3-8eaf-1d112399ee52', '9781517512842', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('fc5c4dbc-bad6-4f0d-a1e4-48a01a933c4e', '9781534966529', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('20fe5d7d-80e7-4c99-973b-1cf83e977182', '9781548920494', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('0db8e26f-16cb-4b97-8e5b-1031fc327680', '9781537571843', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('734e4d5a-2a6d-4faf-a986-640cb883e8e9', '9781974508143', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('f63dce27-0bd9-486c-afc3-559cc1133a7e', '9781505833348', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('55b698f5-6188-4512-8ddf-fbb450927def', '9781546372646', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('fde19b62-3f7a-4a79-b8b7-8bfa121c86d6', '9781547205257', '205b3854-f644-45f9-8c12-2791bbcf9b62');
INSERT INTO public."BookIsbn" VALUES ('985d3813-fa9d-46b3-94ec-5af0e493c2e6', '055208350X', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('c1c9a751-c98b-43b9-915e-81c11aabb9a1', '0345342968', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('85ffed5e-ee24-4d9c-b23f-8a106b209a8e', '9783257247329', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('515718b8-e460-44d8-8c81-4d701bf13024', '9781508760863', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('acfed2c5-10f9-4a44-8fa1-624a2ee5d337', '9780329046491', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('159e2afd-c700-4f96-90ba-92cace161b7c', '9781951151232', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('9dcb2536-00f5-4f0d-9346-fcadc6c7ce3c', '9781954848931', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('79893102-a4b9-4ae9-9eec-a2872904e620', '9781733075862', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('d35bb1f1-cdcf-4cc1-aabd-b32416ec3dff', '9784871871143', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('2d5e68f1-41fe-40ad-93e0-37cf7425c377', '9781979899093', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('22b1d5d8-de7c-4d79-b0fe-e4af5500a24e', '9781514801604', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('1309c38c-d4c1-4014-b943-34b28252ff8c', '9781530021277', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('9b58a902-e75e-4d42-a2f2-faeb741a1d2a', '9786070764004', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('20da39bd-03ba-40a2-9462-d2fb99e2224f', '9781545703670', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('eb235315-3d38-4bbd-bec0-7c5b0a90fbc7', '9781530031832', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('00f4e167-941d-46e7-8df0-450256e56d66', '9781975713935', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('8d0290fd-7b82-400e-b4a3-dd9b4a8c24ec', '9781976454745', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('15a8ef38-7f8d-41e7-8055-bb52490cfb27', '9781530031689', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('0e9874cc-c9af-4874-a829-a79c27b27766', '9781548832797', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('fb95609a-6d7e-43e6-939b-4178a07a03ae', '9781981711468', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('d705af9f-b71a-42ce-af20-9be5e3e00023', '9781517162917', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('5a1a73b0-84ed-43ac-8172-546be5d69bdc', '9781976144677', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('1120813e-8006-49d4-85f2-a74290324fda', '9781530031481', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('a2200ca1-4bf4-4056-8435-b8b0d1200495', '2701156319', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('edb9e42e-c2c6-4897-81b8-f5a9a9bffb1c', '9782701156316', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('f1903d70-c937-40b2-a788-bfb658604f1c', '8475888216', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('2fb83755-f60b-457b-9859-7248de83c3ea', '9788475888217', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('af4bbbf2-bebe-429a-bfad-5c77a182d3e0', '846634540X', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('1d5657e4-8a6d-43c3-a64e-c682edfdba98', '9788466345408', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('36c834f3-f736-485a-87a6-485570c2e51e', '8417125841', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('b1c3d647-67ea-4097-b25d-bef15f0c041c', '9788417125844', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('76ed5877-e43b-4b03-9b24-202583e7aa21', '8466358161', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('b4012f02-27fa-44f7-8f0e-d9966968afb9', '9788466358163', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('7db0b265-a6c0-4bcd-9188-d9c94e64d610', '7536671490', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('542292a7-a0c2-4a1b-97a7-04912f5b0a91', '9787536671492', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('72ced073-b030-4868-91a5-48a3c91feca3', '1415916195', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('7d7d8f65-136f-4860-8658-408e1e66c9ac', '9781415916193', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('2dd769cd-1828-485f-9eb2-7fd2049f4646', '569945537X', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('470a9df8-e89f-446a-a92b-5768aaa00795', '9785699455379', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('058c44fd-6439-4702-8589-77be4f8d19fb', '1607511665', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('d2c0758f-c131-490c-9771-a3b7ae359a1b', '9781607511663', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('f8588a40-9a11-40d6-a388-6f05713b3102', '9780345342966', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('eea8bbae-76b7-4bdd-9345-17c53cc77627', '1451673310', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('8443f725-9610-4dd4-a32f-b0cb9e14315d', '9781451673319', '58380636-2b87-45b0-8529-b4e568eb7ace');
INSERT INTO public."BookIsbn" VALUES ('9e1e9a0e-138b-4407-9f7a-e1eca92ce28d', '141767587X', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('7dfe19c5-0d25-4dc3-aeb5-d1c71ce66400', '9781417675876', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('520c8086-8736-47f9-a67c-a1420cbb9cc3', '8408166107', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('bf1356a4-8015-4ae8-9066-6432aeeef862', '9788408166108', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('bb271c64-a1ce-4480-a9be-5f630ddb0841', '0606045554', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('d54d4db1-7735-4fe9-b369-8c5713a08049', '9780606045551', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('e006e5db-02a5-41d7-930a-986702827b1b', '9780062406781', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('f049385f-f1d4-4e52-9f96-336b0cb2b331', '014133133X', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('6e73aa5f-8603-4b61-97ee-46ee0118f652', '9780141331331', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('df66164d-84d8-4b22-a1fb-7c4eb116216e', '0064410935', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('f583ef3f-32bd-4dab-9563-a741788d9828', '9780064410939', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('14a291e6-8471-4fe1-b83a-d12545cc13bb', '0060264012', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('69c0d7fc-3b7d-4fec-961b-4f8f7caefe22', '0060263857', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('8fa9f264-ea21-4ba2-82d7-4c8bc6cdf12b', '0140364498', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('3677c26f-51de-4f75-b193-39d20a60fce8', '9780140364491', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('4cce54e0-ea10-4cc5-b401-c3647fdb1fa1', '0812417992', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('d609dc14-36b4-4e5a-b804-fdda5e53dd4e', '9780812417999', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('2d2cde39-8077-4830-9e9b-9a45013f127a', '9780060263850', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('bf99ee89-5c1d-4c60-9a8e-9cf0939da342', '0060263865', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('f7d6704a-2109-4177-925f-02a9a2124d1d', '9780060263867', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('4340da5f-2bfb-4391-b759-783126b42c53', '0064400557', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('952052b9-f0a9-4dd5-9ad0-1e236b96c4e8', '9780064400558', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('6475773b-73b6-41be-8870-b3b413d9c764', '0241900980', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('bda06562-fc31-408e-85cd-4372ebafcf95', '9780241900987', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('30840c2e-9383-4bcf-86b5-1e5283b82d67', '0141316047', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('ae0208ac-a08a-4ea9-9a20-065bd088cb39', '9780141316048', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('51664ff5-5ddc-4998-bafb-823fceb7d884', '0140381252', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('91f3b7b6-b952-4821-a24e-5e5904ded0cc', '9780140381252', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('3306d1c3-725c-4ae0-864e-a9a6897b9bc1', '006052779X', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('606a3c44-2fb1-4902-82f3-99c0349af5b8', '9780060527792', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('751dfd1d-33a1-4de2-8d7e-2770348d1a03', '0060282983', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('17cc17f5-9f01-4129-be75-00544fe43138', '9780060282981', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('0d61a911-7c98-4fce-b5b8-0d5f042bd0ae', '0140301852', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('ec00ea6a-c52b-4e0e-bcea-24ec2fe15f45', '9780140301854', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('f4220acd-ac74-47cb-83d8-497645044a78', '0780765273', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('9507459d-fa66-408a-8960-2b5dead8d828', '9780780765276', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('54d7d5f9-e07e-435c-969c-5665d45db54a', '0553455311', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('14099275-823d-41f7-9e9e-0fa7f930aea7', '9780553455311', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('8c501b2e-15c7-48fd-99b7-e7f9744e01e2', '0553746022', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('1963ca60-9207-4539-bfb7-4626d1d299ca', '9780553746020', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('7025fa01-b283-4adb-908d-f682270554d3', '0060006986', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('c7e5c7bb-4bf0-4f3f-943b-fcc138906e6e', '9780060006983', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('85c8cb36-00b8-4ccd-8392-27198a0f0779', '006112026X', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('2d71c4f3-dcee-4706-881f-727b4746e869', '9780061120268', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('fb1d9959-3387-459a-ab28-1790b7fa6ca8', '064400557', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('0cbebedc-9183-4186-b4d2-f8df2cf2da69', '0553781618', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('62cedd4e-ccf7-4e87-bb96-9f550bbce9cc', '9780553781618', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('12142bc7-dd45-4e83-a156-197fe3a927eb', '059030271X', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('9f16bee0-9bc2-4f1b-ac12-d475a2fc2517', '9780590302715', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('9191d549-5bf2-40be-99ea-f78588e543c5', '0060757396', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('b78e3ba5-44a1-4b6a-8d4b-d1fff3f386a9', '9780060757397', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('ee5f950f-415e-4982-889c-4bacdb7311f5', '055319965X', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('daa952b0-19ff-4ae9-ac79-5a27569eed38', '9780553199659', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('1d9bfffa-ead8-45bc-a726-2d1e2d75477f', '0317530747', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('2dd97dac-90bb-44c9-9c64-1aa5153c85a5', '9780317530742', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('3633ea77-c11a-4148-96ce-960f6649ab7d', '046594006998', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('8ecf39b2-eb3b-4722-ad1c-750052716b94', '0141317345', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('e0aa3338-ca07-4482-b149-44c278d38dbc', '9780141317342', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('a17c2b2f-5885-4e02-b5e4-33e8e834d3d6', '0899666965', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('624aa1f3-44ba-4d14-b5ce-00580d60887e', '9780899666969', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('20d31426-d9a5-4e8e-bf22-1feb3516a3a2', '0613811380', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('cd9058e3-dc62-4261-a625-d9a9f9cb9389', '9780613811385', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('1f2e74e7-6f20-4be6-ab86-0bde35dee037', '0060243872', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('b6aa3ef9-43fd-407d-a133-4d8843310db4', '9780060243876', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('7be04909-795e-4a45-8b8d-e47b4179b14e', '0307260070', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('cab2a0f2-5e10-4253-b1fc-a0e879868417', '9780307260079', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6');
INSERT INTO public."BookIsbn" VALUES ('0a57d853-bee5-4fa4-8050-79a001397af7', '1408816032', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('9744afb8-d20b-4f1b-9d63-5a97ff5c9883', '9781408816035', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('1967bfde-d765-4e57-ae04-760c82b47d56', '9493081222', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('f893694d-bc54-41e8-b64a-71a11dd86e76', '9789493081222', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('93700d22-330a-40e5-b36d-94e7c046257b', '9041714871', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('4e6348bf-1c0c-4d7a-96ed-78fd6fdc4a11', '9789041714879', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('804e8a42-08f0-41c7-b54b-ade4e41569f7', '9789603649823', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('9a300454-3095-4310-bce9-0ce5d38b5775', '9788652141760', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('91dbcca6-3703-4189-a5b6-68d6e8a6464e', '9788831780988', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('ea415ec6-6efb-44a1-a43b-3f8377f43ceb', '9789146238416', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('2004fe2d-fc43-43db-8fde-3a11a2b8c724', '8411480623', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('bee43053-82e8-47af-b1b4-434d3be42882', '9788411480628', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('cf58c441-c1ef-41e1-ac29-75c55ce15c14', '8483653370', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('7549cec3-6e59-4fd6-b1e9-98421ed0708b', '9788483653371', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('69048615-dce8-4c7c-a349-72a2089beefd', '8413625580', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('92715795-b533-4117-9595-9536452408c5', '9788413625584', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('4921d322-c183-47ed-b545-153698e6e0b7', '9788564850378', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('9194f984-c1d7-4d5d-81f5-814e78a6fdaf', '9789146239758', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('ae7646ae-a8e4-4c64-b08c-5fc7c7557cff', '9789146238423', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('71af865d-c28d-4eee-b7fc-77c0edd4d535', '9783961610822', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('8ed95c4d-4d7a-4d5d-b402-a0146436f985', '9788382155242', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('cbe8bfe9-2228-433c-b6a1-d5961da47264', '9781408821985', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('b88fe804-90f9-4a73-8607-ed3d2c3443b1', '6555354186', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('d5fab69c-15b2-4262-a103-f5d47a7ef5df', '9786555354188', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('f6970741-8048-4329-aa17-54eeac50759f', '9781408818909', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('da181f0e-c07b-49ca-836a-6a97d17a6333', '9781526648914', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('a0dff76c-3707-41b3-8eaf-87c8b1b7bb9c', '9781526648174', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('f5426bbb-58d0-4ddb-ba92-6514ea70bada', '9780062201898', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('cd1f6812-48f9-4531-a5bb-9cbb6ee8e5ec', '9780062060631', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('2629a8b9-d60f-4295-9ad9-4020c382c264', '8831780980', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('c9f3f314-fd95-4482-bad1-15981ef85714', '9788413622132', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('3b31d7b1-9d3b-4241-bd8f-837e91caa933', '6057762932', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('df850f8c-2f1c-45b6-a421-7729bb5c20f0', '9786057762931', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('c4b876b0-d47e-477f-8f3a-879a4cee3e94', '6051416439', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('ca97759e-5816-404d-84b7-8c1b0f2995fa', '9786051416434', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('8bd88fac-0138-4662-b942-528474a036c7', '0062126121', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('ca5b5dee-1e20-4fc4-b4af-af5f0f72cb3a', '9780062126122', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('1649eb03-f211-4b7b-8cab-f611433a7ded', '1408826135', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('d50c059d-c996-4657-a84d-aac2a4c57967', '9781408826133', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('8a42fddf-26f9-46b6-9a5b-030af8f0201a', '1408817020', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('4fc9294b-8ba6-4277-945c-af3f4338de3c', '9781408817025', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('6d739990-f273-4f4f-832f-0f7dc438eacd', '0753189607', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('d63f536d-d26d-4b8c-8ffc-30859e762d07', '9780753189603', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('1c463d21-eb2a-4382-bc3f-6fe2245df08b', '1445014912', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('69001a80-0e98-4961-afc7-06e019c586fa', '9781445014913', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('b123cb4e-78e4-47da-b2a0-0f74eef6d7e9', '1408891387', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('d38b10cc-e92e-4593-9ce3-84d3c307d8b0', '9781408891384', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('90a25888-d85c-466f-86bb-dcbba05ddae4', '1408826429', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('9c138a94-8aa4-467b-94c3-de54f6699867', '9781408826423', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('e7dbe539-1650-4fb4-bb59-785df5d79772', '0753189615', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('7e567cee-56d0-40aa-9f0e-b0e9c7808cff', '9780753189610', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('a31eedf1-e3ad-44e1-87b9-b5874472275a', '1445014904', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('116589fa-1191-4fb9-9721-d9b04b8f018d', '9781445014906', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('a9efba39-0faa-4ad8-896b-2c919bea26b7', '1445014920', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('3d049926-e578-4cf1-8076-243bfa50b318', '9781445014920', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('3f7a1849-7b3d-4a37-80cb-49b6cf976329', '0062060619', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('1928492b-5d74-4cc4-b144-40de2ea3bfa8', '0062060627', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('54dc3815-a2ea-4fc5-81f8-b0a5b8b94ee2', '1627655379', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('f944fc29-00b0-4230-80cb-b27f206eb7ac', '9780062060617', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('f494ad77-9c4c-4b25-8704-090f812561bd', '9780062060624', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('4b133969-221d-40a8-94b9-a11b8be62061', '9781627655378', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('a8f2fc10-61c7-4c50-9443-38a46c7d5197', '1408821982', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('a300dc49-7e78-4f39-8e62-812f09b4b349', '1408842122', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."BookIsbn" VALUES ('5f98c665-3e8d-4955-86e4-eaed4b041078', '9781408842126', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');


--
-- TOC entry 3490 (class 0 OID 17235)
-- Dependencies: 223
-- Data for Name: BookStatistics; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."BookStatistics" VALUES ('a7d1fef8-0dbd-4efd-b3f1-72eba9c535a5', 'c533b55d-0907-492a-817b-a6a889ac13fd', 3.91, 187, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('a2d512ca-a5f5-41e2-b883-0e2af58a42c7', '6045772b-8f73-4558-ad45-f58632352975', 3.79, 441, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('dfb950c9-00b2-4342-8ea6-ad05ca68ec74', '405d86f8-9b88-4b15-b164-dc2fd1b10476', 4.29, 392, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('b4a8f2ab-6726-4738-96db-6cb94db4ab2f', '98f7dcd7-acbb-4fce-b4d5-b7bf4c47b1e4', 4.14, 418, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('08d89c0b-cdb9-465e-8d33-3badcbc86f7a', '9b65a1ac-bbe8-4ab9-8c30-fa5cc7d9a96b', 4.11, 511, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('7b4f7f86-8941-4674-9354-0ca9cdbe9eec', 'b7bafc65-c34e-4ea2-9c46-7409635fdc85', 3.99, 156, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('e79a1ed4-33b1-4da3-a7e2-6615dc3bb3ac', '19478760-1c0f-4d20-ad9b-c96ac3040c08', 4.03, 117, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('a19e8a28-9f5f-4445-892f-174c07443afc', '256a01c4-207b-4d86-b74a-a1757e98667a', 4.14, 176, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('2aa96e85-be58-4bdc-871a-0df903d9b171', 'd1275694-5dbb-4a90-9a93-649fc1c8a0f9', 3.85, 123, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('0807d763-1ef5-4e96-9412-b8029196af7d', '4b5f0663-7696-4255-8971-b1c404ede737', 3.78, 99, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('028e52c8-c49e-4950-96dc-749355999eb0', '5502fedc-0dbb-4645-a92f-7619bcc030d9', 4.27, 132, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('fb645da9-d455-4a68-b87f-21ca0445cc84', '37c06057-0c8c-491e-8bbb-66966da19843', 3.81, 117, 0, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('317ab368-f09f-4bbe-a7a7-81bd1cd47d1a', 'abe8fd45-3521-4769-99b6-8c019f7d108c', 4.22, 739, 2, 2, 0);
INSERT INTO public."BookStatistics" VALUES ('4e5c9dd5-f93b-40fa-853d-3633a1a97dc1', 'd0b0c6aa-de2f-4024-be19-5634f878b933', 3.81, 280, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('08c1bed9-9e73-4298-8a22-02e19a509318', '7b6e0ab6-d10f-43b0-a235-543eb576926b', 4.21, 204, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('a393924e-9781-408a-962c-58ac968f64cb', '14728228-cbb8-48d8-9f59-109402188de6', 3.49, 91, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('b955ed25-9cc6-453c-9fa4-5ebb60588298', '205b3854-f644-45f9-8c12-2791bbcf9b62', 4.36, 218, 2, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('e86d3c2c-34a7-4b9d-b10b-7b3b6a7fbd25', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', 4.08, 487, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('8f61826b-a5e2-4e59-b56a-7705a0fe2893', '961f3c72-1485-4d78-bad0-20a54e8e5c88', 4.09, 245, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('e16bb934-dd24-474a-b6cc-317d273f2ebd', '92f8c5ef-4171-40d4-9229-dc39ad424ee1', 4.28, 482, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('45de6795-9b28-484b-a947-cae31ef7931b', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0', 4.22, 168, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('59a1d61b-123c-4a4f-9457-5ccbaa2c3cc1', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647', 4.27, 408, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('ee78625e-142c-47b4-979d-c9cd30c4c086', '29bba103-a874-4340-9f88-25059ec4a2b4', 4.02, 184, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('ad921a27-4037-4820-a85b-d3210fb4df1b', 'feab4aba-356a-4608-898d-c115a9c1ee6c', 4.06, 191, 3, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('a2f8a6eb-8981-428a-8e39-cb271335bd89', '4503d7fb-4b27-43f9-9e65-89f2c430b527', 4.18, 378, 2, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('9850ed6c-2438-45ee-a210-d7404b73e643', '548b7c15-2d60-4ded-bc9b-7261432c2e05', 4.01, 410, 3, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('60f678fb-2e0c-4d4e-a7f6-21a151625b79', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', 4.22, 311, 2, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('0ff9e854-14d3-42a8-a1cf-53e5e996ab51', '720f9c4f-a47c-43e7-b6ee-0d7204482734', 4.01, 158, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('1fd520cf-038d-49da-bbcb-84560f109918', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19', 3.94, 313, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('d7bbdf17-fb67-465f-ac76-f111c0841adb', '53f9df57-43c1-4a4b-a465-80cf117d5568', 4.06, 155, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('40c235c3-0e54-4bd0-bfbd-77ec549b6342', '99251f46-c7d2-4392-b160-20340b8e5602', 4.209599236641221, 1048, 2, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('c76a3eaa-ae2f-4b62-b8d4-3a60d5741e4a', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2', 4.15, 557, 2, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('530670b3-53a4-4ece-8fe5-fb08de084d6f', '662e31e1-a71d-4ec5-81c7-85915dd52fa7', 4.2, 196, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('fa706840-91ff-4717-aecf-a9db99c5987b', '8c2cced0-b873-444b-a4e4-9228c63bd21e', 4, 99, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('29d6bde0-3d77-426a-92b7-6f73db4f693d', 'd0c01d19-f647-4443-b173-8fb6db6c62d6', 3.65, 419, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('82318f56-345b-4bce-b1b9-e2da505ee8e1', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', 4.22057318321392, 977, 2, 1, 0);
INSERT INTO public."BookStatistics" VALUES ('7eeddc49-5be1-40aa-bab8-a7da5a5b94c6', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77', 3.89, 133, 1, 2, 0);
INSERT INTO public."BookStatistics" VALUES ('4650293d-978a-4823-b644-95f4f976957c', '58380636-2b87-45b0-8529-b4e568eb7ace', 3.98, 426, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('310d2d3c-c0be-4be9-945e-748edb8c1255', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', 4.01, 435, 3, 6, 1);
INSERT INTO public."BookStatistics" VALUES ('f118e1cc-41e6-49c7-b1c3-a8b5c16e9394', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', 4.11, 250, 1, 1, 0);
INSERT INTO public."BookStatistics" VALUES ('053474b7-5253-40b2-bcfb-c89f6569c006', '0be78d56-30eb-4641-8267-804cbdbdb94c', 3.59, 300, 3, 1, 0);
INSERT INTO public."BookStatistics" VALUES ('61cf4c6c-417a-48be-99b2-81b86b1bf35e', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', 4.28, 388, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('1bf3009f-0959-4b28-b9e1-36e98cc0235f', '508e7941-37f6-449e-bd2f-4f266edd6da2', 4.1, 165, 1, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('da69fdad-eac9-4ad4-8ed6-1319158b7556', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', 4.03, 411, 4, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('6c49c7ff-0322-4445-9575-03310102bf59', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff', 4.100750000000001, 120, 3, 0, 0);
INSERT INTO public."BookStatistics" VALUES ('f4665974-f9ce-4d46-bb62-6d1d2005a22c', 'f73dec77-acdd-45ef-86f9-c32abee8f74e', 4.16, 191, 2, 1, 0);
INSERT INTO public."BookStatistics" VALUES ('d81c9297-7365-4d85-ad82-e9a39e9efe04', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', 4.3, 132, 18, 0, 15);


--
-- TOC entry 3496 (class 0 OID 17330)
-- Dependencies: 229
-- Data for Name: Comment; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Comment" VALUES ('cmnncq3o60001mzwojt2vd9on', 'Lajos', '2026-04-06 15:34:59.092', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnncvwlu0001mzpkz16gxnzw', 'Lajos', '2026-04-06 15:39:29.874', 'lajoska20000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnnd2kro0003mzpkf5y2j95x', 'Lajos', '2026-04-06 15:44:41.124', 'lajos200@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."Comment" VALUES ('cmnx1ten30003mziooj0eclr6', 'Kys', '2026-04-13 10:27:19.264', 'szalontaicseko166@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnx1u18x0005mzio7o4huj88', 'I hate niggers ', '2026-04-13 10:27:48.561', 'szalontaicseko166@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnx1u6zq0007mziof0nfajcc', 'I hate niggers', '2026-04-13 10:27:56.006', 'szalontaicseko166@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnx1ua6h0009mzioabnv8vsw', 'I hate niggers', '2026-04-13 10:28:00.137', 'szalontaicseko166@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnx1ugjb000bmziovuzf4cc3', 'I hate niggers', '2026-04-13 10:28:08.375', 'szalontaicseko166@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnx1ujua000dmzioderrslwt', 'Hail the kkk', '2026-04-13 10:28:12.658', 'szalontaicseko166@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnx1w233000hmzionc690ga4', 'Janos is a moron', '2026-04-13 10:29:22.959', 'szalontaicseko166@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnx1wuoz000jmzio3e1umhgx', 'ÁRADJON A KIRÁJUNKAT LEVÁLTOTTÁK HOGY MERTETEK EGY MOCSKOS TISZÁRA SUAVAZNI', '2026-04-13 10:30:00.035', 'szalontaicseko166@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnxlj0c70001mzs8ung1y9nx', 'Lajos', '2026-04-13 19:39:06.487', 'hero@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnxlk4zc0003mzs8yy60x9xz', 'Lajos', '2026-04-13 19:39:59.16', 'hero@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnxmpfyq0001mztsio0wurzo', 'Laj', '2026-04-13 20:12:06.29', 'lajosma25@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnxq83iy0001mzswv9ej0wjq', 'Ez ', '2026-04-13 21:50:35.482', 'lajosma29@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');
INSERT INTO public."Comment" VALUES ('cmnydaoho0001mzo4smjpys8p', 'Fiaim a kurva anyátokat XD', '2026-04-14 08:36:27.132', 'lajosma30@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd');


--
-- TOC entry 3497 (class 0 OID 17338)
-- Dependencies: 230
-- Data for Name: CommentLike; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."CommentLike" VALUES ('lajoska3021@gmail.com', 'cmnncq3o60001mzwojt2vd9on');
INSERT INTO public."CommentLike" VALUES ('lajoska20000@gmail.com', 'cmnncq3o60001mzwojt2vd9on');
INSERT INTO public."CommentLike" VALUES ('lajoska20000@gmail.com', 'cmnncvwlu0001mzpkz16gxnzw');
INSERT INTO public."CommentLike" VALUES ('lajosma20@gmail.com', 'cmnncq3o60001mzwojt2vd9on');
INSERT INTO public."CommentLike" VALUES ('lajosma20@gmail.com', 'cmnncvwlu0001mzpkz16gxnzw');
INSERT INTO public."CommentLike" VALUES ('szalontaicseko166@gmail.com', 'cmnncvwlu0001mzpkz16gxnzw');
INSERT INTO public."CommentLike" VALUES ('szalontaicseko166@gmail.com', 'cmnx1ten30003mziooj0eclr6');
INSERT INTO public."CommentLike" VALUES ('hegeduspeter0911@gmail.com', 'cmnx1ten30003mziooj0eclr6');
INSERT INTO public."CommentLike" VALUES ('hegeduspeter0911@gmail.com', 'cmnx1ugjb000bmziovuzf4cc3');
INSERT INTO public."CommentLike" VALUES ('hegeduspeter0911@gmail.com', 'cmnx1u18x0005mzio7o4huj88');
INSERT INTO public."CommentLike" VALUES ('hegeduspeter0911@gmail.com', 'cmnx1ua6h0009mzioabnv8vsw');
INSERT INTO public."CommentLike" VALUES ('hegeduspeter0911@gmail.com', 'cmnx1u6zq0007mziof0nfajcc');
INSERT INTO public."CommentLike" VALUES ('hegeduspeter0911@gmail.com', 'cmnx1ujua000dmzioderrslwt');


--
-- TOC entry 3494 (class 0 OID 17315)
-- Dependencies: 227
-- Data for Name: FavoriteAuthor; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."FavoriteAuthor" VALUES ('lajos1000@gmail.com', '39a4afc7-f7a6-4d14-900f-b777748b6e88');
INSERT INTO public."FavoriteAuthor" VALUES ('lajoska3000@gmail.com', '7cfc5984-5170-4e61-b920-20e930ff6aef');
INSERT INTO public."FavoriteAuthor" VALUES ('lajoska3000@gmail.com', '66974af1-0788-4a9a-89bd-d447a10ca35a');
INSERT INTO public."FavoriteAuthor" VALUES ('lajoska3020@gmail.com', '39a4afc7-f7a6-4d14-900f-b777748b6e88');
INSERT INTO public."FavoriteAuthor" VALUES ('lajoska3021@gmail.com', '068bb746-d566-4eba-9a97-91ab8f10e42f');
INSERT INTO public."FavoriteAuthor" VALUES ('lajoska3021@gmail.com', '17393407-c644-42b0-a076-b9e91ec49958');
INSERT INTO public."FavoriteAuthor" VALUES ('lajoska3021@gmail.com', '16672eba-ab5c-4fc5-a5ee-b403756b152f');
INSERT INTO public."FavoriteAuthor" VALUES ('lajoska20000@gmail.com', 'aa73ae39-9cd7-44df-b9fe-1e8d533310f7');
INSERT INTO public."FavoriteAuthor" VALUES ('lajoska20000@gmail.com', '8ccc1848-b5f3-40bd-b538-af841fe39a01');
INSERT INTO public."FavoriteAuthor" VALUES ('lajos200@gmail.com', 'aa73ae39-9cd7-44df-b9fe-1e8d533310f7');
INSERT INTO public."FavoriteAuthor" VALUES ('lajos2002@gmail.com', '9c105044-9faf-412d-9c9d-ee8ee3c98c86');
INSERT INTO public."FavoriteAuthor" VALUES ('lajoska3021@gmail.com', '16c3afe6-6b36-408f-baa0-5b31681f4fe0');


--
-- TOC entry 3493 (class 0 OID 17308)
-- Dependencies: 226
-- Data for Name: FavoriteBook; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."FavoriteBook" VALUES ('lajos1000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."FavoriteBook" VALUES ('lajos1000@gmail.com', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."FavoriteBook" VALUES ('lajos1000@gmail.com', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."FavoriteBook" VALUES ('lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."FavoriteBook" VALUES ('lajoska3020@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."FavoriteBook" VALUES ('lajoska3021@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."FavoriteBook" VALUES ('lajoska3021@gmail.com', 'abe8fd45-3521-4769-99b6-8c019f7d108c');
INSERT INTO public."FavoriteBook" VALUES ('lajoska3021@gmail.com', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74');
INSERT INTO public."FavoriteBook" VALUES ('lajoska3021@gmail.com', 'f73dec77-acdd-45ef-86f9-c32abee8f74e');
INSERT INTO public."FavoriteBook" VALUES ('lajoska20000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."FavoriteBook" VALUES ('lajoska20000@gmail.com', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77');
INSERT INTO public."FavoriteBook" VALUES ('lajos200@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588');
INSERT INTO public."FavoriteBook" VALUES ('lajoska3021@gmail.com', '0be78d56-30eb-4641-8267-804cbdbdb94c');
INSERT INTO public."FavoriteBook" VALUES ('hegeduspeter0911@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06');


--
-- TOC entry 3492 (class 0 OID 17301)
-- Dependencies: 225
-- Data for Name: FavoriteGenre; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3488 (class 0 OID 17211)
-- Dependencies: 221
-- Data for Name: Genres; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Genres" VALUES ('fc6484a8-1ce7-4c84-b425-b08aeaf3d9f8', 'Man-woman relationships');
INSERT INTO public."Genres" VALUES ('06836d6b-5ab5-422d-9fe6-16dc705c3f0d', 'Fiction, romance, new adult');
INSERT INTO public."Genres" VALUES ('d5f123ea-79d2-4e1a-849a-49b6b798a0ba', 'Fiction, women');
INSERT INTO public."Genres" VALUES ('8d45ef9e-113d-4989-b6d1-c34808ec256e', 'New york times bestseller');
INSERT INTO public."Genres" VALUES ('9440094a-585d-4c5b-b9b6-2e874bff6d82', 'Contemporary women');
INSERT INTO public."Genres" VALUES ('629b391c-cfbb-425e-a643-b786ffc3d48e', 'Fiction');
INSERT INTO public."Genres" VALUES ('7eb34720-9c9b-4890-8aae-8193cd7b9df8', 'Businesswomen');
INSERT INTO public."Genres" VALUES ('5d8f0471-b068-4f38-8d78-de0aeb463a6b', 'First loves');
INSERT INTO public."Genres" VALUES ('728088fb-487a-43b0-80eb-dab6a900ee9f', 'Neurosurgeons');
INSERT INTO public."Genres" VALUES ('4c0b845c-e935-469d-aa77-f7fef4faf4b0', 'Ghosts');
INSERT INTO public."Genres" VALUES ('f658f553-0dbc-43af-83f7-90602972f968', 'Spanish language materials');
INSERT INTO public."Genres" VALUES ('25fefa33-431c-45b3-b2a4-c3e1044d480c', 'Spanish');
INSERT INTO public."Genres" VALUES ('9bd952ce-1cee-414b-b127-56a82f73439f', 'J.k rowling');
INSERT INTO public."Genres" VALUES ('aa58a5b3-f2cd-44f8-92d8-7c9bb9e58660', 'Harry potter');
INSERT INTO public."Genres" VALUES ('fd56af92-cf68-446b-9928-410c8724c208', 'Supernatural');
INSERT INTO public."Genres" VALUES ('d1f3b191-1adf-4f3f-9ef1-ce8ab465c049', 'Adventure');
INSERT INTO public."Genres" VALUES ('e0905665-8ca9-4969-9294-1349097f1820', 'Places & cultures');
INSERT INTO public."Genres" VALUES ('43fd6115-4a88-42de-9c59-e8352c0a8834', 'Fiction - people');
INSERT INTO public."Genres" VALUES ('e3368776-bf60-4e9d-ba92-2ba7e6b3eb7e', 'Science fiction & fantasy');
INSERT INTO public."Genres" VALUES ('b78c2c0d-e569-4de2-a872-9ad225873efa', 'Teen fiction');
INSERT INTO public."Genres" VALUES ('657c52e4-9858-4edd-bbc4-27f6b224df31', 'Children - harry potter');
INSERT INTO public."Genres" VALUES ('01f6b1b2-e59a-43d5-a9fc-d8f8db65f7ed', 'Translations into chinese');
INSERT INTO public."Genres" VALUES ('41591a59-e547-46eb-b921-ed61948421ac', 'English fiction');
INSERT INTO public."Genres" VALUES ('815afae8-9376-4d95-9ac7-2032fb47ade6', 'Translations into marathi');
INSERT INTO public."Genres" VALUES ('148242d1-1b4d-4e00-bdd4-4e7a3cd5ea86', 'English fantasy literature');
INSERT INTO public."Genres" VALUES ('d69adc92-1c7b-4832-827f-ee4b4b78a5bd', 'Roman');
INSERT INTO public."Genres" VALUES ('d2ef9d9d-2052-49e3-a56c-7fff54c131ee', 'Mystery');
INSERT INTO public."Genres" VALUES ('7eebb72d-859e-4d5f-83d2-b884eea3b421', 'Ingleterra');
INSERT INTO public."Genres" VALUES ('b7f817b2-9240-4fee-80d4-e6a18b2a3360', 'Novela juvenil');
INSERT INTO public."Genres" VALUES ('2f580aac-a64d-4b91-875c-ba28e97910b9', 'Hechicería');
INSERT INTO public."Genres" VALUES ('ffce3971-9879-46f9-9d2e-a649f7469359', 'Écoles');
INSERT INTO public."Genres" VALUES ('b29b8c4a-b040-4b4f-b9a8-653d35f2e6b4', 'Novelas juveniles inglesas');
INSERT INTO public."Genres" VALUES ('b3eba362-0b2d-4620-9367-63a4b443b3c6', 'Novelas fantásticas');
INSERT INTO public."Genres" VALUES ('30fde04a-8b88-4f5e-9f2d-b9795514a897', 'Wizard');
INSERT INTO public."Genres" VALUES ('43d7763a-5909-4e7a-9e14-28d7604f42eb', 'Witchcraft, fiction');
INSERT INTO public."Genres" VALUES ('aef79423-4dfe-4a1d-a775-3226d0afaac3', 'German language materials');
INSERT INTO public."Genres" VALUES ('69d3b08a-af5b-4b44-a311-345ceed2eb28', 'Friendship, fiction');
INSERT INTO public."Genres" VALUES ('b71d64d9-6ed2-4ac3-bac5-e8832427e231', 'Friendship');
INSERT INTO public."Genres" VALUES ('b2bb8458-0f69-46a7-a616-17d09647d462', 'Social themes');
INSERT INTO public."Genres" VALUES ('bb18769b-8cf3-4a01-8574-7b93bf44439b', 'Fantasy & magic');
INSERT INTO public."Genres" VALUES ('56c38139-b36f-46e4-9e30-d16f2c048ae1', 'Action & adventure');
INSERT INTO public."Genres" VALUES ('10bce6ab-d13f-4d92-863c-fb75580d70a3', 'Internats');
INSERT INTO public."Genres" VALUES ('867d82e6-f0b2-45a8-bdb3-8e32a2c0cf03', 'Magie');
INSERT INTO public."Genres" VALUES ('8402ec03-6e22-4e5b-8214-de599036b032', 'Sorcières');
INSERT INTO public."Genres" VALUES ('a4de4682-5858-46f6-8063-85b961625964', 'Sorciers');
INSERT INTO public."Genres" VALUES ('71d8b7cc-0a4b-4f88-8272-e011f13fda87', 'Latin language materials');
INSERT INTO public."Genres" VALUES ('9bb8e1a9-35f5-4dd8-b1ab-f5be90cf8b82', 'English literature');
INSERT INTO public."Genres" VALUES ('047489e2-9819-4ba1-ad29-cb95cc19c313', 'Literary theory');
INSERT INTO public."Genres" VALUES ('f0c96933-9129-4484-a187-885516ab6ca2', 'Translating into welsh');
INSERT INTO public."Genres" VALUES ('f23d0032-9c17-4b2e-a7fd-7177298b0ac9', 'English language');
INSERT INTO public."Genres" VALUES ('888b50b1-1e1e-402e-8b5c-3189114c5742', 'Junge');
INSERT INTO public."Genres" VALUES ('34cfda32-11a6-465c-ba75-1081fcdaac36', 'Ungeheuer');
INSERT INTO public."Genres" VALUES ('6d0a0095-ed3f-4c2d-8dd9-1300d745c27e', 'Stein der weisen');
INSERT INTO public."Genres" VALUES ('8eec949a-d0e5-4a50-b1d1-c810aa92983b', 'Kinderbuch');
INSERT INTO public."Genres" VALUES ('54a37799-8ce7-4f79-8a62-f29adbe12fd4', 'Lehrling');
INSERT INTO public."Genres" VALUES ('dd7fb395-2457-4832-81f6-cf52a5436205', 'Fabeltiere');
INSERT INTO public."Genres" VALUES ('d893496d-e577-4f17-9434-ef9eb9fef921', 'Magier');
INSERT INTO public."Genres" VALUES ('ddab6893-a29d-4a44-b3b1-366f3663045f', 'Fiction, fantasy, general');
INSERT INTO public."Genres" VALUES ('bd170a59-40cf-4188-9495-2b388c21c5ea', 'Magic, fiction');
INSERT INTO public."Genres" VALUES ('d0ade6ac-592a-4b3f-97f3-610538acd455', 'Wizards, fiction');
INSERT INTO public."Genres" VALUES ('471d1ce1-7475-48d9-943d-15e002c40d60', 'England, fiction');
INSERT INTO public."Genres" VALUES ('da4bd0be-2061-4663-9567-13507067dd43', 'Schools, fiction');
INSERT INTO public."Genres" VALUES ('90b1db10-a3d5-4ba3-8297-b81e5c1e700c', 'Children''s fiction');
INSERT INTO public."Genres" VALUES ('7e82f27a-4be4-4e81-abbd-7e42b42d2faa', 'Reading level-grade 12');
INSERT INTO public."Genres" VALUES ('54b28dd6-a861-41f5-8995-ce9a909ef159', 'Reading level-grade 10');
INSERT INTO public."Genres" VALUES ('4b783ca4-81a0-433e-a48b-01c9d4332c7a', 'Reading level-grade 11');
INSERT INTO public."Genres" VALUES ('c812b50e-ae99-4ae0-b104-3236dfbd77ee', 'Reading level-grade 9');
INSERT INTO public."Genres" VALUES ('be35d180-f697-442a-a1dc-9d63a4c2297a', 'Chinese fiction');
INSERT INTO public."Genres" VALUES ('b084e60b-9dba-42ee-9335-a634a1a2768b', 'Translations from english');
INSERT INTO public."Genres" VALUES ('3bad707c-e101-47a3-a499-11f5946e015d', 'Escuelas');
INSERT INTO public."Genres" VALUES ('8bb53c63-bdad-4358-94fa-928f2a2720c8', 'Ficción juvenil');
INSERT INTO public."Genres" VALUES ('b47d455c-e695-4d62-a7b7-51e1b712c992', 'Fantasy');
INSERT INTO public."Genres" VALUES ('669481e9-1a01-48df-962a-392553430839', 'Schools in fiction');
INSERT INTO public."Genres" VALUES ('cfc0cb73-93f6-44e8-9275-4dda3abdbd6a', 'Juvenile works');
INSERT INTO public."Genres" VALUES ('9fa3360f-0be6-48a7-a4bb-18651889ec38', 'Children''s stories');
INSERT INTO public."Genres" VALUES ('cc5004d8-55c4-4234-9ede-5988d8c419c4', 'Juvenile audience');
INSERT INTO public."Genres" VALUES ('3a5de281-e71b-43de-872f-593d46cd09d9', 'Open library staff picks');
INSERT INTO public."Genres" VALUES ('28abd48c-2cd9-4c8a-8fd2-ec0958c25d61', 'Magic in fiction');
INSERT INTO public."Genres" VALUES ('0e146ed2-598e-413e-aef4-5362e2c277b8', 'Juvenile literature');
INSERT INTO public."Genres" VALUES ('842e9960-b031-471e-b32b-01b3b6c92744', 'Alchemy');
INSERT INTO public."Genres" VALUES ('927691cb-44a0-47f8-9fc1-ee487c81eeec', 'Wizards in fiction');
INSERT INTO public."Genres" VALUES ('8c0bc983-3c59-496f-b97f-ec1c70b53e24', 'Witches in fiction');
INSERT INTO public."Genres" VALUES ('0b3caccf-5af7-4fee-990d-9a76b6b2cf2d', 'England in fiction');
INSERT INTO public."Genres" VALUES ('5018ad06-b832-4166-8e02-6f0438491f77', 'Fantasy fiction');
INSERT INTO public."Genres" VALUES ('abd948d3-1c57-4494-a677-261e3d234d79', 'Orphans');
INSERT INTO public."Genres" VALUES ('d2bbf30c-5fbe-4d10-9484-e149f7624c17', 'Schools');
INSERT INTO public."Genres" VALUES ('a9229cfe-3d7d-4010-a15a-910d6afc0b7d', 'Novelas inglesas');
INSERT INTO public."Genres" VALUES ('fcc7a1c1-7afa-409f-8404-5740a4b763a2', 'Juvenile fiction');
INSERT INTO public."Genres" VALUES ('bb8a7cab-5b6b-482c-bdd4-b39e4665146f', 'Magos');
INSERT INTO public."Genres" VALUES ('cac45cab-08c5-476f-bbe1-2d17ae171846', 'Magia');
INSERT INTO public."Genres" VALUES ('7504bf17-33b7-4d3a-b48b-0eb745b68483', 'Magic');
INSERT INTO public."Genres" VALUES ('30048c4e-ddf6-4bcc-96a1-95ff4b84a805', 'Wizards');
INSERT INTO public."Genres" VALUES ('5b94e2ad-8312-4f4b-a9eb-eb52c03532fa', 'School stories');
INSERT INTO public."Genres" VALUES ('4523e9c4-110c-4d90-b0f6-cebd79dcbd64', 'School life');
INSERT INTO public."Genres" VALUES ('2c245a6f-3422-4e9e-b7ea-32f0a83a09bd', 'Cleverness');
INSERT INTO public."Genres" VALUES ('c001cdff-0bc3-462f-9ecc-30cd9fa4162d', 'Magic and supernatural');
INSERT INTO public."Genres" VALUES ('3798f49d-40cb-4498-835c-ee2476443408', 'Witches');
INSERT INTO public."Genres" VALUES ('fb2228eb-9bd4-40ad-b8b3-595a268a6aa3', 'Vampires');
INSERT INTO public."Genres" VALUES ('cb5191d8-f4eb-4cd1-a77f-2f115f94246f', 'Monsters');
INSERT INTO public."Genres" VALUES ('374cc6bf-7956-44fb-9c01-41784ef6f207', 'Contemporary');
INSERT INTO public."Genres" VALUES ('cafd315f-5b09-4686-9e10-4cac719e75be', 'Self-discovery');
INSERT INTO public."Genres" VALUES ('85c8facf-63e8-4bcd-81f3-b71dd99c56e7', 'Healing');
INSERT INTO public."Genres" VALUES ('3480feee-374a-432b-a1c8-9ebcc2a54226', 'Redemption');
INSERT INTO public."Genres" VALUES ('4a4b96f4-af7c-49d2-ae3c-b285abb2c161', 'Forgiveness');
INSERT INTO public."Genres" VALUES ('de6efc86-7766-4409-b2e0-4402c28b0a25', 'Family');
INSERT INTO public."Genres" VALUES ('19d64fee-836f-4afb-8a9f-dd30a5b55f7c', 'Forbidden love');
INSERT INTO public."Genres" VALUES ('07514ff2-a0e0-490b-8bba-32a8b6280871', 'Second chance romance');
INSERT INTO public."Genres" VALUES ('59c8d3a8-95d4-4a6a-ae9e-568c5ef70d3b', 'Domestic violence');
INSERT INTO public."Genres" VALUES ('954e0572-0f6e-485e-8ed2-012bbd91254f', 'New adult');
INSERT INTO public."Genres" VALUES ('5b5b9dbc-1ebe-401f-bc51-e9620ceb5b7b', 'Contemporary romance');
INSERT INTO public."Genres" VALUES ('c9b729dd-7c15-4b29-934a-0ba1ca54d78a', 'American literature');
INSERT INTO public."Genres" VALUES ('86589549-4152-433f-9392-cd0565ee7770', 'Young adult fiction');
INSERT INTO public."Genres" VALUES ('0285ebe3-eb93-485a-81f4-c18da91d3631', 'Romance');
INSERT INTO public."Genres" VALUES ('1986c060-8347-4b45-babf-1072472b29ca', 'Serie:twisted');
INSERT INTO public."Genres" VALUES ('c9fc7351-d5e9-4b1c-962f-3fb80da439d9', 'Love triangle');
INSERT INTO public."Genres" VALUES ('90d54a22-e049-4661-9bf9-7cbefca80d0d', 'Angst');
INSERT INTO public."Genres" VALUES ('7528f4f6-61ff-401a-8e58-0d0c610fc584', 'Grumpy-sunshine');
INSERT INTO public."Genres" VALUES ('5ab7eea5-0cf0-4bf4-97ef-2b634d436c87', 'Dark romance');
INSERT INTO public."Genres" VALUES ('f725a818-8352-4282-b6d9-f60fd35cac99', 'Brother''s best friend');
INSERT INTO public."Genres" VALUES ('c60243da-9282-4578-8233-0842646ae9cc', 'New adult romance');
INSERT INTO public."Genres" VALUES ('beaab4ca-195b-427e-9a0c-0ca9d75723b3', 'Adult');
INSERT INTO public."Genres" VALUES ('3c7eacbd-0277-44d0-8ad1-a372e7f3cf45', 'Winter');
INSERT INTO public."Genres" VALUES ('cb39b600-a6ab-4812-ab5a-d7694e326bff', 'Good and evil');
INSERT INTO public."Genres" VALUES ('094a4763-cb27-45e6-9677-ad000ab493eb', 'General');
INSERT INTO public."Genres" VALUES ('727da668-78f8-43a3-a2bf-118ec6c5eb70', 'American fantasy fiction');
INSERT INTO public."Genres" VALUES ('a17acda0-9dc9-4d01-89aa-bd822c36dc42', 'Overdrive');
INSERT INTO public."Genres" VALUES ('a426ffb0-25c3-402f-b37a-ce4d6ef2887f', 'Guerra civil');
INSERT INTO public."Genres" VALUES ('7328be2c-402b-41ef-981d-5ed4ffba81e8', 'Reyes y soberanos');
INSERT INTO public."Genres" VALUES ('ba7ecc6f-1159-442f-ad83-0c021065b47b', 'Novela');
INSERT INTO public."Genres" VALUES ('883a0f91-c283-43c3-82f1-12f2e946c65d', 'Locus award winner');
INSERT INTO public."Genres" VALUES ('1f2ad7d8-64fd-464a-89ac-0fbe02565521', 'Ignotus award winner');
INSERT INTO public."Genres" VALUES ('3ba62da9-e330-434e-b555-c205396d3ae1', 'Hugo award winner');
INSERT INTO public."Genres" VALUES ('9f99104e-5bfe-423c-a71b-d02640837fad', 'Imaginary places');
INSERT INTO public."Genres" VALUES ('c6c0e5e7-0e07-41fe-a8be-85d3de434424', 'Persistent vegetative states');
INSERT INTO public."Genres" VALUES ('db0f46cb-8fa6-49af-a500-2f3edec9aa9d', 'Forced marriage');
INSERT INTO public."Genres" VALUES ('ef74851e-ff04-4d79-8208-78e325c3ea1d', 'Incest');
INSERT INTO public."Genres" VALUES ('517c8662-42a7-4dcc-811d-ee29c2cfb750', 'Folk healers');
INSERT INTO public."Genres" VALUES ('50ad3057-1b22-4962-8bb8-c6e9c2835d3a', 'Wights');
INSERT INTO public."Genres" VALUES ('c9c031a2-746b-4fff-baa8-26571e3d27eb', 'Dragons');
INSERT INTO public."Genres" VALUES ('6dfaeed1-dbab-4bfb-b227-0b18e46eaeff', 'Penal colonies');
INSERT INTO public."Genres" VALUES ('1c5682f7-308c-4543-af4c-85cda9c01840', 'Walls');
INSERT INTO public."Genres" VALUES ('d7eeba7b-708b-4167-8f99-99087b555426', 'Voyages and travels');
INSERT INTO public."Genres" VALUES ('3687b778-171b-4c7b-8348-dd4665279e7e', 'Trial by combat');
INSERT INTO public."Genres" VALUES ('0d5165d7-3ea1-47e6-9045-7830c68b04d4', 'Invierno');
INSERT INTO public."Genres" VALUES ('54fe2705-1234-4961-893c-3302780c96fe', 'Seasons');
INSERT INTO public."Genres" VALUES ('258e3563-f449-4cd8-825a-37f5c8ca8c55', 'Courts and courtiers');
INSERT INTO public."Genres" VALUES ('4c1cbaf7-897b-4799-8727-eb0935529538', 'Knights');
INSERT INTO public."Genres" VALUES ('01d42bc0-fce8-4873-ad63-84d57fece8b9', 'Kings and rulers');
INSERT INTO public."Genres" VALUES ('897a3cf2-3aa0-46f5-aabf-bd7e997c3b13', 'Royalty and nobility');
INSERT INTO public."Genres" VALUES ('ab05a69f-d616-4c5d-89c6-af09aae4ff29', 'Feudalism');
INSERT INTO public."Genres" VALUES ('548d5e38-fce9-48ef-a40e-274f767b331c', 'Intrigue');
INSERT INTO public."Genres" VALUES ('df72bf67-faee-4d96-8fce-7242224a2d60', 'Politics');
INSERT INTO public."Genres" VALUES ('1ff1634f-6e8e-4d65-beca-85e0a1714cbe', 'Guerras imaginarias');
INSERT INTO public."Genres" VALUES ('e6a2af72-29f5-49a1-8002-760146811849', 'Imaginary wars and battles');
INSERT INTO public."Genres" VALUES ('10e783ab-6d61-42d8-8e22-bc3a4a4f5982', 'War and conflict');
INSERT INTO public."Genres" VALUES ('9b0cbd11-dd8a-4474-9efb-20085978f2ed', 'Civil war');
INSERT INTO public."Genres" VALUES ('55a18e68-6907-4c5d-8094-7fdd43fe05e0', 'Bien y mal');
INSERT INTO public."Genres" VALUES ('14ab65de-b103-456c-85b9-dcc396b11589', 'Vengeance');
INSERT INTO public."Genres" VALUES ('c2ffec6d-8924-4a16-8dca-db7a0b3fdd60', 'Revenge');
INSERT INTO public."Genres" VALUES ('104aee3c-351e-4b88-842f-93d0f706bfa4', 'Loyalty');
INSERT INTO public."Genres" VALUES ('22666a0a-6347-41a8-a777-51ba102f6b83', 'Betrayal');
INSERT INTO public."Genres" VALUES ('eeb016fd-fb45-46a7-bc91-31a8e69b651b', 'Moral ambiguity');
INSERT INTO public."Genres" VALUES ('323664a1-a46b-40a3-abf7-42c23439a29b', 'Ficción');
INSERT INTO public."Genres" VALUES ('b713f0cd-67fa-4b0c-bbad-118eb97dfdcd', 'Fantastic fiction');
INSERT INTO public."Genres" VALUES ('157150f0-6055-4608-9faa-fefe890392c4', 'Science fiction');
INSERT INTO public."Genres" VALUES ('e7972953-e32c-4f45-a732-3848824ab0de', 'Fiction, fantasy, epic');
INSERT INTO public."Genres" VALUES ('75ee18c2-423c-4a18-a79e-67e2bd5e277b', 'Epic literature');
INSERT INTO public."Genres" VALUES ('dd45db86-8848-4172-8164-bc2d8f260e1e', 'Epic fiction');
INSERT INTO public."Genres" VALUES ('444fda65-c527-455c-8736-535d7f590ce9', 'Epic fantasy');
INSERT INTO public."Genres" VALUES ('9298507e-8ac9-4985-a75b-85916355c2b1', 'Epic');
INSERT INTO public."Genres" VALUES ('217bdfef-cafb-4f78-9b3e-c497eab9fd26', 'High fantasy');
INSERT INTO public."Genres" VALUES ('ee383fe4-3335-4559-915a-68aa8dbb0704', 'Coming of age');
INSERT INTO public."Genres" VALUES ('e2308edf-8aa1-493c-b4c4-d100d91ccb76', 'Literary');
INSERT INTO public."Genres" VALUES ('0ae80677-47c2-48d1-aa7e-994eb8a33ea6', 'Clowns');
INSERT INTO public."Genres" VALUES ('17490108-2fb3-4b11-bf5c-6f0b888bdc31', 'Fiction, horror');
INSERT INTO public."Genres" VALUES ('25cc19ce-b50b-4faf-86f0-1dd60b571007', 'New york times reviewed');
INSERT INTO public."Genres" VALUES ('a99d252f-954f-453a-88a0-b169c97b62b6', 'Horror fiction');
INSERT INTO public."Genres" VALUES ('e3cc5314-7620-446f-9b6b-214fa926b619', 'Horror tales');
INSERT INTO public."Genres" VALUES ('6c3a0bbf-175a-4268-bf5e-c87ec85d2999', 'Horror stories');
INSERT INTO public."Genres" VALUES ('3d1e0126-97d4-4efc-ac49-e9337324dbd9', 'Third-person');
INSERT INTO public."Genres" VALUES ('7c1e7152-b88b-470c-9509-e162915b827b', 'Nonlinear narrative');
INSERT INTO public."Genres" VALUES ('1fbcb9ae-7b1f-451f-a7b2-f13bda84eae8', 'Clownrewolves');
INSERT INTO public."Genres" VALUES ('4f68d82a-03a9-4997-8168-52de1127438a', 'Lepers');
INSERT INTO public."Genres" VALUES ('a33f13bd-686b-4528-820a-104d84dfdf07', 'Mummies');
INSERT INTO public."Genres" VALUES ('e5d3b8e3-787a-4ee2-9c1b-6931d5460597', 'Omniscience');
INSERT INTO public."Genres" VALUES ('26698a65-d636-411d-bd90-9b1b8986702f', 'Blood oaths');
INSERT INTO public."Genres" VALUES ('13ba5719-75c3-46cd-a632-e88b7e490464', 'Homosexuality');
INSERT INTO public."Genres" VALUES ('f151e59d-03dd-4af6-ae8f-c2dc6436839e', 'Catatonia');
INSERT INTO public."Genres" VALUES ('251cc126-3181-43e7-94a2-bc48edbbb97b', 'Schwinn bicycles');
INSERT INTO public."Genres" VALUES ('8352aa14-5a7d-4067-bf6f-721947800a4e', 'Horror');
INSERT INTO public."Genres" VALUES ('c46953c4-0c69-4092-b3b3-3ba3397498ac', 'Suspense');
INSERT INTO public."Genres" VALUES ('d444e5f6-700a-4487-8912-88a9870542a6', 'Thrillers');
INSERT INTO public."Genres" VALUES ('622d01a3-30aa-4639-890e-6516118078f8', 'Fiction, romance, general');
INSERT INTO public."Genres" VALUES ('67fa74af-6c10-463d-9b88-04726539445e', 'Fiction, thrillers, suspense');
INSERT INTO public."Genres" VALUES ('f6cef521-db01-40f3-bec8-682649139c2a', 'Young adults');
INSERT INTO public."Genres" VALUES ('dc348191-bdda-4891-932a-a501d4ba2b51', 'Women in stem');
INSERT INTO public."Genres" VALUES ('a3fff69b-32d9-42b0-815d-2febcf1eefa4', 'Women authors');
INSERT INTO public."Genres" VALUES ('9780dd46-197f-4c4a-97a6-18c3d4be8908', 'College life');
INSERT INTO public."Genres" VALUES ('1e253c8d-c4c7-43bc-b113-55e32cc0dead', 'Rom-com');
INSERT INTO public."Genres" VALUES ('507b5f95-d2d5-4c6d-9f4b-ff0a1118821a', 'Romantic fiction');
INSERT INTO public."Genres" VALUES ('4a63da2b-b138-4abb-8ccc-42d6a84659b3', 'Love & romance');
INSERT INTO public."Genres" VALUES ('469bc46e-8a0f-431e-a7bb-1a4303705774', 'Cours et courtisans');
INSERT INTO public."Genres" VALUES ('21bb45fa-0497-4714-8b72-964f721881eb', 'Fées');
INSERT INTO public."Genres" VALUES ('dbe0bbd0-a9fe-4546-bba2-49fb3b6aab93', 'Adaptations');
INSERT INTO public."Genres" VALUES ('a0be9c3b-6e68-4a9b-92a5-9dbaeb9843b0', 'Fairies, fiction');
INSERT INTO public."Genres" VALUES ('f6b1995e-7b67-4770-9091-906c8514679c', 'Blessing and cursing');
INSERT INTO public."Genres" VALUES ('6e1c4748-9e75-4727-a7f3-f2a47b7821d3', 'Fairies');
INSERT INTO public."Genres" VALUES ('7057b63a-29a6-4fd7-9807-be642a0eace7', 'Love');
INSERT INTO public."Genres" VALUES ('754233d9-9366-4c7e-b3e1-d57c40d5c56c', 'Dictature');
INSERT INTO public."Genres" VALUES ('b02de81a-4afc-4ca8-a3e2-b504652af048', 'Aptitude');
INSERT INTO public."Genres" VALUES ('dba34b77-a930-4cc2-b09a-d999a2782073', 'Dictators');
INSERT INTO public."Genres" VALUES ('0b3df91f-d21d-4fe2-b3ae-db7ce2fdd13f', 'Romance fiction');
INSERT INTO public."Genres" VALUES ('8db5aae4-9fbd-432f-b7ce-77af403a09d7', 'Totalitarianism, fiction');
INSERT INTO public."Genres" VALUES ('3211f6ac-fa31-433b-a659-5feb6d03cc18', 'Soldiers, fiction');
INSERT INTO public."Genres" VALUES ('ab405751-4f92-4f03-b2b5-3756104937f2', 'Love, fiction');
INSERT INTO public."Genres" VALUES ('26eaecd1-a1bb-42a8-adcf-0eff93c79dab', 'Love stories');
INSERT INTO public."Genres" VALUES ('e697730a-476d-4d4e-98ea-3de776a5ab12', 'Soldiers');
INSERT INTO public."Genres" VALUES ('e7d5cfa6-442d-4c3b-8067-b54f5e7c0bde', 'Dictatorship');
INSERT INTO public."Genres" VALUES ('13bbc9ca-7645-4b71-99b0-b1455f79e117', 'Ability');
INSERT INTO public."Genres" VALUES ('a510f3e4-d0a3-49f4-8650-f0356582323b', 'Translations into indonesian');
INSERT INTO public."Genres" VALUES ('dcf24125-511c-460e-b243-09da875c741e', 'Literature');
INSERT INTO public."Genres" VALUES ('6c44a3d2-3ef5-4cd6-a0cb-145dc435a1ef', 'Translations into russian');
INSERT INTO public."Genres" VALUES ('b792c483-9f51-420a-b8a5-eee4a7f93a3e', 'Graphic novels');
INSERT INTO public."Genres" VALUES ('c0508316-f91f-4c0d-8b2c-352291b563fc', 'Comic books, strips');
INSERT INTO public."Genres" VALUES ('ecf1ea6d-f009-4da6-bfa8-40fa4f59d54b', 'Parodies, imitations');
INSERT INTO public."Genres" VALUES ('0567f150-f770-4027-a790-9f014afb0492', 'Expeditions');
INSERT INTO public."Genres" VALUES ('d3c5247d-d049-41c4-aaf8-fc99486bf480', 'Inspiration & personal growth');
INSERT INTO public."Genres" VALUES ('2cec5747-ed7d-4b1b-a730-d27de7812400', 'Spirituality');
INSERT INTO public."Genres" VALUES ('7aa76fc6-c056-4363-b467-8771c1dc6232', 'Body, mind & spirit');
INSERT INTO public."Genres" VALUES ('68471ad8-3fc2-4961-aa7b-a7562717e824', 'Quests (expeditions)');
INSERT INTO public."Genres" VALUES ('b007425c-7f36-45f2-bf14-7215fdb3772e', 'Large type books');
INSERT INTO public."Genres" VALUES ('6a38e606-fe68-4159-a50a-b98a8893502b', 'Alquimistas');
INSERT INTO public."Genres" VALUES ('adc67500-0da3-4cf1-b6ec-cdbbf7cd278a', 'Andalucía (españa)');
INSERT INTO public."Genres" VALUES ('927f5ae7-3651-4afe-9ca2-1265615d1e2e', 'Pastores');
INSERT INTO public."Genres" VALUES ('1d1f135f-0043-4a3b-9015-2048ecd74669', 'Alquimia');
INSERT INTO public."Genres" VALUES ('70163d29-04ce-4f10-87b5-b5d114df53a9', 'Mexican literature');
INSERT INTO public."Genres" VALUES ('cb9f5568-5048-44fc-ba69-82931ca31a5f', 'Tłumaczenia polskie');
INSERT INTO public."Genres" VALUES ('28b47039-befb-498a-ae66-d79187c545f1', 'Powieść brazylijska');
INSERT INTO public."Genres" VALUES ('35100865-4299-4e14-8682-21e69f3036b4', 'Russian language edition');
INSERT INTO public."Genres" VALUES ('eaeab13e-0ea8-4f70-8e57-e0a8021dde93', 'Reading materials');
INSERT INTO public."Genres" VALUES ('139d15ac-3887-4ebf-a3a9-13edafdcde8f', 'French language');
INSERT INTO public."Genres" VALUES ('010cc6aa-d4dc-4ae5-8a19-a4c2ae61a2b9', 'Thai fiction');
INSERT INTO public."Genres" VALUES ('c1a1e9f8-1167-4bc2-9e9f-8059e9adfe2d', 'Fables');
INSERT INTO public."Genres" VALUES ('1fa85671-75f8-4bca-85e9-2724f47da87e', 'Fiction / literary');
INSERT INTO public."Genres" VALUES ('305cc919-c7a4-465a-a8e9-47fb896b7f3d', 'Spain, fiction');
INSERT INTO public."Genres" VALUES ('cfbd7d90-4ddc-494d-a84d-9245c8d14181', 'Shepherds');
INSERT INTO public."Genres" VALUES ('27c5691c-a4ec-4717-8d35-94aff8c300f4', 'Young men');
INSERT INTO public."Genres" VALUES ('611b84f9-a606-43e5-8832-53cd9db2d811', 'Alchemists');
INSERT INTO public."Genres" VALUES ('84d3b938-d196-4472-bc4a-e30303507e29', 'Self-realization');
INSERT INTO public."Genres" VALUES ('f64afb02-72be-4910-ba9b-59983cfcafb2', 'Portuguese fiction');
INSERT INTO public."Genres" VALUES ('ab50f836-5ad3-4186-a408-b8ab7854e657', 'Futurology');
INSERT INTO public."Genres" VALUES ('14bb5c94-ada3-4b95-9267-32a8a8b62488', 'Scifi');
INSERT INTO public."Genres" VALUES ('3b8d89dd-1e83-43d8-b857-5c9a18caf9c8', 'Dystopies');
INSERT INTO public."Genres" VALUES ('0acad680-7e84-4c8e-bc31-11d6cb7a5156', 'Pr6029.r8 n49 2003');
INSERT INTO public."Genres" VALUES ('a8915ebc-05f9-4052-9a2f-a451a2fc761c', 'Totalitarianism--fiction');
INSERT INTO public."Genres" VALUES ('11f7da9b-0420-4c54-859f-bb6f5440c05c', 'Translating and interpreting');
INSERT INTO public."Genres" VALUES ('1bd0699d-86b0-4a6a-82c8-11e2619b2fb1', 'Translations into spanish');
INSERT INTO public."Genres" VALUES ('ab7834f8-9e53-4626-ba4c-9c1fb41219c3', 'Translations into urdu');
INSERT INTO public."Genres" VALUES ('14cca4a7-b145-4f89-89b4-997b5b52504f', 'English manuscripts');
INSERT INTO public."Genres" VALUES ('5844de0a-c8bb-4469-9f15-31613cc06309', 'Language & literary studies');
INSERT INTO public."Genres" VALUES ('d9805e08-ea93-4c81-bf67-f6d22868cf27', 'Lexicography');
INSERT INTO public."Genres" VALUES ('390deac0-bf8a-4053-8c8c-7dcacd5911b6', 'Nationalism');
INSERT INTO public."Genres" VALUES ('8552f660-6145-4ad3-ae72-fd6d03253fe4', 'Essays');
INSERT INTO public."Genres" VALUES ('9ae634e5-6565-4236-8458-d2c532fe7740', 'Dystopian plays');
INSERT INTO public."Genres" VALUES ('07cda38e-8ea9-4f5b-ab4f-d8ffb2b707c4', 'Drama');
INSERT INTO public."Genres" VALUES ('32a3a353-a5cf-4dad-94c5-68b8c6595ff5', 'Psychological fiction');
INSERT INTO public."Genres" VALUES ('0e4117f3-fb00-4bd0-862a-dc4ae13f7b4a', 'Fiction, general');
INSERT INTO public."Genres" VALUES ('b3519fa0-b955-4b0f-bb72-1c99824841e6', 'Romans, nouvelles');
INSERT INTO public."Genres" VALUES ('e8070efb-d6e1-4fea-81aa-bc1f9ea0076c', 'Satire');
INSERT INTO public."Genres" VALUES ('9e92acd8-c4c9-4fa3-9bea-48230aae6e8a', 'Political science');
INSERT INTO public."Genres" VALUES ('421d1cb7-dd6d-44b9-aec8-dd5ff37b16f2', 'Fiction, historical, general');
INSERT INTO public."Genres" VALUES ('c11329ea-890f-4660-aab1-7a5af7f3c06d', 'Authoritarianism');
INSERT INTO public."Genres" VALUES ('8e430c9c-90c3-4f75-a54d-888f1b70cfdc', 'Brainwashing');
INSERT INTO public."Genres" VALUES ('c77b87f1-4c93-41a3-bf58-333de43e8b22', 'Authors and publishers');
INSERT INTO public."Genres" VALUES ('be61dad3-c731-4f3a-a2a6-49da902fd5cc', 'Correspondence..');
INSERT INTO public."Genres" VALUES ('bcd3e5b2-5b53-45ad-bcd4-1af50df45fb3', 'English authors');
INSERT INTO public."Genres" VALUES ('cc36b578-35a4-48dd-b3b2-4a553c44caaf', 'Journalists');
INSERT INTO public."Genres" VALUES ('6876654d-e038-488f-8556-109ae5c11f40', 'Correspondence');
INSERT INTO public."Genres" VALUES ('7598d430-833b-4732-a154-1ce6b72e3089', 'Fiction, dystopian');
INSERT INTO public."Genres" VALUES ('50910fc0-353e-4b6f-9b95-f5635aea2267', 'Fiction, political');
INSERT INTO public."Genres" VALUES ('273092aa-af82-49b0-8f37-8798305f8b2a', 'London (england), fiction');
INSERT INTO public."Genres" VALUES ('40497c16-28e1-4e48-82d5-93d38c4ceb90', 'History and criticism');
INSERT INTO public."Genres" VALUES ('fc28a98c-382e-425c-b4eb-b118a772c1da', 'English political fiction');
INSERT INTO public."Genres" VALUES ('f6f76e8f-8be3-42b9-b010-37be0728ab6c', 'Polizeistaat');
INSERT INTO public."Genres" VALUES ('c435896e-d393-4df3-a3c8-3a475c39260a', 'Zukunft');
INSERT INTO public."Genres" VALUES ('5c7160e2-1b80-417e-878c-4d29efb1a30c', 'Novela inglesa');
INSERT INTO public."Genres" VALUES ('9e826827-57cb-47d5-8d1c-416c2861d272', 'Traducciones al español');
INSERT INTO public."Genres" VALUES ('ea9854f7-19a6-4aa3-845a-35cdd30f9192', 'Indic fiction (english)');
INSERT INTO public."Genres" VALUES ('a901ecff-f76d-4aa6-8e79-2953be47e6b2', 'Totalitarianism');
INSERT INTO public."Genres" VALUES ('1178e9ca-3ac8-4b52-b8bd-8dc935db7bc3', 'Suburban life');
INSERT INTO public."Genres" VALUES ('571ce5b2-3df8-4f08-8fd9-c2a1cf005d31', 'Dystopias in literature');
INSERT INTO public."Genres" VALUES ('fcfc2cf0-d198-4667-8b45-4f50234ea2f0', 'Cautionary tales and verse');
INSERT INTO public."Genres" VALUES ('b0db7350-55c9-4340-92cb-8376d5cd6010', 'Ciencia-ficción');
INSERT INTO public."Genres" VALUES ('3648344f-24ef-434a-a104-13fde18a9088', 'Dystopias');
INSERT INTO public."Genres" VALUES ('13af1d94-0d22-471d-8527-d2d7e8dc633c', 'Distopías');
INSERT INTO public."Genres" VALUES ('a0b32aba-84f3-4239-8ef0-ba699ad7fb2e', 'Open_syllabus_project');
INSERT INTO public."Genres" VALUES ('573c5566-b516-4304-9b9c-f817d082198f', 'Insurance agents');
INSERT INTO public."Genres" VALUES ('faa5c76b-3de0-412d-afa8-1b8579a6bf43', 'Middle aged men');
INSERT INTO public."Genres" VALUES ('c6b4a88f-862e-42f5-bbb1-66a558c7cb55', 'Novela política');
INSERT INTO public."Genres" VALUES ('82ce2bfe-d83c-42c0-a994-470818fb8ca4', 'Manuscripts');
INSERT INTO public."Genres" VALUES ('81aa4d09-7d1c-46cd-b1b6-eebd7564d7e1', 'Classic literature');
INSERT INTO public."Genres" VALUES ('1138a8e1-3bc1-4252-a13f-16e3e8b70597', 'Husbands');
INSERT INTO public."Genres" VALUES ('cddb0a26-205c-418b-9408-0c203e5eb4ff', 'Totalitarismo');
INSERT INTO public."Genres" VALUES ('94b6b076-c420-4333-9080-ab2cffa3ce46', 'Facsimiles');
INSERT INTO public."Genres" VALUES ('814cb1c4-a231-455a-844c-122c8e49f5d1', 'Romans');
INSERT INTO public."Genres" VALUES ('2d230270-0c93-4e70-9663-bde3e5e55859', 'Totalitarisme');
INSERT INTO public."Genres" VALUES ('c221320a-9c0e-4d32-8d4d-8d97d4154f78', 'Political fiction');
INSERT INTO public."Genres" VALUES ('398e8d3b-0005-47f5-8c15-5803cc4bc7ca', 'Politique');
INSERT INTO public."Genres" VALUES ('91043e4d-6698-4fe0-a474-7f7ea8680f71', 'Contemporary fiction');
INSERT INTO public."Genres" VALUES ('32dc6944-c735-464b-86c5-b1d226b2687b', 'Classics');
INSERT INTO public."Genres" VALUES ('81a6d40b-e5b7-4694-97f4-6a956887f210', 'Fiction classics');
INSERT INTO public."Genres" VALUES ('59ee7443-fb03-4bf3-98f8-7aa90f9b294a', 'English science fiction');
INSERT INTO public."Genres" VALUES ('0d9ff2d4-1190-4001-b0a5-062d10609968', 'Satirical literature');
INSERT INTO public."Genres" VALUES ('5cf5553a-df02-4bbe-a744-a258178328db', 'Ingsoc');
INSERT INTO public."Genres" VALUES ('0750e3e4-a892-4fb6-8cb4-4e0a77205b98', 'Cult of personality');
INSERT INTO public."Genres" VALUES ('745b6569-6bc9-4494-b083-3c682e00c6cf', 'Telescreens');
INSERT INTO public."Genres" VALUES ('61feb5dd-3d9a-4acf-abbb-58e8aea10aa9', 'Perpetual war');
INSERT INTO public."Genres" VALUES ('21fa18ba-98a2-4dfe-96d4-b62e24420d67', 'Newspeak');
INSERT INTO public."Genres" VALUES ('113b4e6f-1942-494a-953d-27e51722c8b3', 'Resistance movements');
INSERT INTO public."Genres" VALUES ('d5ba7ba0-8d3c-48d6-b8dd-f8d6e404ceb0', 'Outer party');
INSERT INTO public."Genres" VALUES ('592d1a81-4dc4-4ba9-8ebd-a5bd5bb12fdf', 'Thoughtcrime');
INSERT INTO public."Genres" VALUES ('903b2581-5e76-407f-97e7-74ae307a25e8', 'Memory holes');
INSERT INTO public."Genres" VALUES ('504b36df-445f-4f56-a477-5dce83369a94', 'Historical negationism');
INSERT INTO public."Genres" VALUES ('35445a1c-a6d0-41d5-99de-f2cccb32a0a4', 'Sting operations');
INSERT INTO public."Genres" VALUES ('448ddf4f-eeee-487a-8000-52d78eca8868', 'Rebels');
INSERT INTO public."Genres" VALUES ('106dc535-6086-4276-8c5e-33229dd16501', 'Surveillance');
INSERT INTO public."Genres" VALUES ('dfa9e611-1589-45a9-883f-063a54f69fe8', 'Censorship');
INSERT INTO public."Genres" VALUES ('223fb438-29a5-4495-9ab0-074a44a66392', 'Self-mutilation');
INSERT INTO public."Genres" VALUES ('bad5a28d-437d-4ac2-9cb2-e681303562bd', 'Child sexual abuse');
INSERT INTO public."Genres" VALUES ('2c10bbd0-89bb-4333-b628-8525b73f248c', 'Emotions');
INSERT INTO public."Genres" VALUES ('33219cff-0340-4e96-ac0c-9d3d987ca33f', 'Abusive mothers');
INSERT INTO public."Genres" VALUES ('e65b651b-0105-41ed-8ffc-120ac8cbd984', 'Absentee fathers');
INSERT INTO public."Genres" VALUES ('ce6c488b-b660-4134-be37-a4f3a2c1084e', 'Suicidal behavior');
INSERT INTO public."Genres" VALUES ('122a99d7-82fe-4ee4-bbaa-a2109fbae4b6', 'Sexual abuse');
INSERT INTO public."Genres" VALUES ('1ecd456d-057e-4585-8c51-5077bad3b3dd', 'Sex crimes');
INSERT INTO public."Genres" VALUES ('bdafa57b-2653-4dce-840f-9a9620317bef', 'Cutting (self-mutilation)');
INSERT INTO public."Genres" VALUES ('7e8c5753-dcfd-4f40-86c5-6af6dae8648d', 'Homeless persons');
INSERT INTO public."Genres" VALUES ('90a304f4-5a0f-4941-a1e3-62d2b31ffcb4', 'Abandoned children');
INSERT INTO public."Genres" VALUES ('6dda7f78-e6a3-4031-8c67-e042785ff9a6', 'Survival');
INSERT INTO public."Genres" VALUES ('9141ee30-58af-4895-bb63-e216bb902d48', 'Emotional problems');
INSERT INTO public."Genres" VALUES ('88f14714-5e99-4752-821b-30d73c52a2eb', 'Self-mutilation, fiction');
INSERT INTO public."Genres" VALUES ('db1f5bac-247f-463f-94f1-7ebe507912b3', 'Child sexual abuse, fiction');
INSERT INTO public."Genres" VALUES ('a044b1bb-14fe-40a7-bf8e-39011f7e59dd', 'Homeless persons, fiction');
INSERT INTO public."Genres" VALUES ('a3970c09-572f-44cd-9902-772796b3a259', 'Survival, fiction');
INSERT INTO public."Genres" VALUES ('76db3c35-3703-496b-9623-857235f652a5', 'Emotions, fiction');
INSERT INTO public."Genres" VALUES ('ad593639-7b10-41f7-9ea3-c278741f285b', 'Jeff kinney');
INSERT INTO public."Genres" VALUES ('77bceac3-3ad3-4535-a0af-db7c441d8cb8', 'Official');
INSERT INTO public."Genres" VALUES ('df812c20-63b0-4d04-8cdd-900a2f3c7053', 'Wimpy kid');
INSERT INTO public."Genres" VALUES ('c1f28d06-64bf-441e-bf28-f0274032e332', 'Diaries -- fiction');
INSERT INTO public."Genres" VALUES ('37d9b784-cc12-4148-b537-b4ad7d15d467', 'Schools -- fiction');
INSERT INTO public."Genres" VALUES ('c38c7fd9-b792-444e-ab32-f389db02a993', 'Friendship -- fiction');
INSERT INTO public."Genres" VALUES ('c4fbbba5-0731-4327-bdb8-e6e378cb67b8', 'Middle schools -- fiction');
INSERT INTO public."Genres" VALUES ('d4e0d81e-54c7-48f8-b485-452f1618001b', 'Polish language');
INSERT INTO public."Genres" VALUES ('3b277fa5-6585-4f62-b65a-fbd772015ebc', 'Materiał w języku polskim');
INSERT INTO public."Genres" VALUES ('b66426f6-aff7-41bb-93cd-407f06220a14', 'Polish language materials');
INSERT INTO public."Genres" VALUES ('91c6e265-be1d-4768-9e73-95b8ac234dce', 'Diaries, fiction');
INSERT INTO public."Genres" VALUES ('c09ec4e0-022c-41e3-ad64-ddc7c7214750', 'Humorous stories');
INSERT INTO public."Genres" VALUES ('15bbc998-9d40-40bd-9046-066ea86e8093', 'Friends');
INSERT INTO public."Genres" VALUES ('7732c31d-d421-4203-b933-1c452ee1bb4d', 'Humorous fiction');
INSERT INTO public."Genres" VALUES ('678fc2a2-0b08-4259-83a6-116f7da2a9f7', 'Child');
INSERT INTO public."Genres" VALUES ('645861b1-3a31-4a6c-965e-7a9a00cbbb19', 'Interpersonal relations');
INSERT INTO public."Genres" VALUES ('97a96abf-4578-454e-a406-4a85c06a398a', 'Socialization');
INSERT INTO public."Genres" VALUES ('b4884bb0-8b26-44aa-b3fe-b9a5bf906e6e', 'Comics & graphic novels');
INSERT INTO public."Genres" VALUES ('0d0d0b77-e328-4ad2-875d-7175b698be10', 'Family life');
INSERT INTO public."Genres" VALUES ('e7588a9f-bc08-4db5-a6dd-b844e8601d09', 'Middle schools');
INSERT INTO public."Genres" VALUES ('1a3c2f73-896b-4d81-a8b6-35758b9ab495', 'Diaries');
INSERT INTO public."Genres" VALUES ('a968a317-daff-4c5a-95ed-660c8df9f61d', 'Families');
INSERT INTO public."Genres" VALUES ('a70d0b26-857f-4323-8fd7-7361960fefef', 'Pilotes d''aéronef');
INSERT INTO public."Genres" VALUES ('6bbe4ff6-74d1-4a99-bffa-2d65643e47d3', 'Air pilots');
INSERT INTO public."Genres" VALUES ('814e87b5-4a24-41fb-80a5-05d2416301a1', 'Brothers and sisters');
INSERT INTO public."Genres" VALUES ('bf03a47f-7ef9-46eb-bd53-7cb231fb46dc', 'Novel');
INSERT INTO public."Genres" VALUES ('579f9084-e85c-4ee0-afc7-ca48f7d835a5', 'England');
INSERT INTO public."Genres" VALUES ('bd7e4c7c-fb72-4f80-9cfd-c5d2a0aa72cc', 'Austen, jane, 1775-1817');
INSERT INTO public."Genres" VALUES ('ea41a1b1-d50f-406d-8b51-d3584c308cf2', 'Fiction, romance, historical');
INSERT INTO public."Genres" VALUES ('56d06f24-a691-4797-81f6-df18821f7d05', 'Reading level-grade 8');
INSERT INTO public."Genres" VALUES ('f55e62da-7fd7-42dd-b2cc-56fb36f5cd1f', 'Reading level-grade 7');
INSERT INTO public."Genres" VALUES ('f8ae969a-b0d4-4750-b1ef-0d9842862046', 'Great britain');
INSERT INTO public."Genres" VALUES ('6d095bfc-7ec5-443e-9c26-96436b16bccc', 'Prophecies');
INSERT INTO public."Genres" VALUES ('d8f83420-33db-4ac6-8677-c8e8d03e3da0', 'Englisch');
INSERT INTO public."Genres" VALUES ('2b42675e-9753-4a07-836d-c8521faf1e8b', 'Class');
INSERT INTO public."Genres" VALUES ('d6115bb1-4cb6-40a8-a9e1-47879945d8d7', 'Feelings');
INSERT INTO public."Genres" VALUES ('6babf388-a010-4ec6-a15e-4a6a81a2e269', 'Emoticons');
INSERT INTO public."Genres" VALUES ('3cedd54d-0429-448d-bb80-67d8d6516114', 'Fiction, family life');
INSERT INTO public."Genres" VALUES ('ef6a7a6c-03da-40e9-b155-b7c9f4b24a7f', 'Coloring books');
INSERT INTO public."Genres" VALUES ('d3e0d5ef-5789-4a35-be5f-e000e1f885b0', 'Mate selection');
INSERT INTO public."Genres" VALUES ('6c7805fd-5aa5-4961-8dd7-55a3174a76c0', 'Gentry');
INSERT INTO public."Genres" VALUES ('93b244ba-6269-4ce5-b943-d4d08df8b7f7', 'Women, fiction');
INSERT INTO public."Genres" VALUES ('9c0350cc-d83a-4696-9178-7ffe0a4a069b', 'Domestic fiction');
INSERT INTO public."Genres" VALUES ('da1cc146-6b26-4542-b173-818c61a1ee9c', 'Classical literature');
INSERT INTO public."Genres" VALUES ('cac36014-aac0-4447-92db-7f702c6828e4', 'Historical fiction');
INSERT INTO public."Genres" VALUES ('199bb0c0-743c-4deb-a9d3-ad02b04a6298', 'Prejudices');
INSERT INTO public."Genres" VALUES ('06695aa3-959d-4468-b83a-d5a776053c6c', 'Readers');
INSERT INTO public."Genres" VALUES ('924d2b37-a524-4243-a893-b43193b26eb2', 'Fiction, coming of age');
INSERT INTO public."Genres" VALUES ('8c2eb2eb-1819-4414-877c-7ae158227b82', 'Cuentos de amor');
INSERT INTO public."Genres" VALUES ('0b20eb49-af1e-4d99-9426-d4be8515c5d5', 'Hermanas');
INSERT INTO public."Genres" VALUES ('9def539b-6577-4354-8a6d-2f80e2c2b189', 'Cortejo amoroso');
INSERT INTO public."Genres" VALUES ('760cd5cb-3cdf-4594-a2ca-f3ea18818c6b', 'Jóvenes (mujeres)');
INSERT INTO public."Genres" VALUES ('6ad82c0b-f08c-4a9e-a746-4c01ebbf0205', 'Clases sociales');
INSERT INTO public."Genres" VALUES ('0e3e232c-887b-4f73-b901-661e54692618', 'Mœurs et coutumes"');
INSERT INTO public."Genres" VALUES ('0c45c682-b80e-40db-8bad-29b40274e2ed', 'Familles');
INSERT INTO public."Genres" VALUES ('f8683274-36c8-4686-8251-e0f89d4deeec', 'Jeunes femmes');
INSERT INTO public."Genres" VALUES ('eafd1029-a7c5-4c21-9b51-653a5890b3e7', 'Amours');
INSERT INTO public."Genres" VALUES ('bb087249-20b2-4057-8cfc-912256d5498c', 'Sœurs');
INSERT INTO public."Genres" VALUES ('73a5fa69-8be8-499d-9f7a-8f5f3914ae44', 'Classes sociales');
INSERT INTO public."Genres" VALUES ('97db241e-fd55-46fe-9d42-2c84c5c3d47d', 'Roman anglais');
INSERT INTO public."Genres" VALUES ('5b4c5194-86bc-4ba7-8040-ad65d9d0b5da', 'Fiction, family life, general');
INSERT INTO public."Genres" VALUES ('833f19fb-bcdc-43f6-9c37-278deefdca2b', 'Sisters, fiction');
INSERT INTO public."Genres" VALUES ('e0a1cc82-6783-45ef-b67f-e72f83a4cf08', 'Young women, fiction');
INSERT INTO public."Genres" VALUES ('1a25da19-be8a-4141-8f68-cfa2fea455ce', 'Entail');
INSERT INTO public."Genres" VALUES ('d9dc7c84-977a-4b51-b165-37ed3bca21f0', 'Young women');
INSERT INTO public."Genres" VALUES ('e8e3c2fa-9fcf-408c-8e5e-464b945ba947', 'Young ladies');
INSERT INTO public."Genres" VALUES ('cd405540-6b6d-49d0-9535-7994e3018f49', 'Women in england');
INSERT INTO public."Genres" VALUES ('e2a3c2d1-242e-4be0-b62b-510d23a44b1c', 'Wealth');
INSERT INTO public."Genres" VALUES ('e1200bf1-5659-4d06-9d08-48b3ab58ee30', 'Upper class');
INSERT INTO public."Genres" VALUES ('c9e526dd-8913-4fa5-b3a2-40be5c13cb51', 'Social life and customs');
INSERT INTO public."Genres" VALUES ('1438c07d-359f-46e7-ba5d-0a7380b5d7a9', 'Social classes');
INSERT INTO public."Genres" VALUES ('691f59ed-6b4d-4fe7-af99-e7ef86cd00b6', 'Sisters');
INSERT INTO public."Genres" VALUES ('cab060f3-01aa-4b9b-897b-e5af8b876a82', 'Marriage');
INSERT INTO public."Genres" VALUES ('f96ab88a-394c-483a-9f6b-4d661eaeb287', 'Manners and customs');
INSERT INTO public."Genres" VALUES ('00beef70-fd21-4d83-b552-200830ec5193', 'Manners');
INSERT INTO public."Genres" VALUES ('a01dcfd5-3218-49a4-b3fa-be660ef3b2e8', 'Literary fiction');
INSERT INTO public."Genres" VALUES ('59ec7184-c88e-4cbf-b039-02e51f23c8d7', 'History');
INSERT INTO public."Genres" VALUES ('e9efd1d5-96c1-4796-a4d0-268b589e7a4c', 'Family relations');
INSERT INTO public."Genres" VALUES ('e74ca44a-33ce-4904-832f-8a019b777011', 'Courtship');
INSERT INTO public."Genres" VALUES ('32698894-28d3-4bfe-91b6-6a802c32182b', 'Fiction / contemporary women');
INSERT INTO public."Genres" VALUES ('37bdb237-45ff-4e92-a42e-e90e9d100bf3', 'Dating violence');
INSERT INTO public."Genres" VALUES ('d9289c5f-9ee9-464e-83e8-069fb4377174', 'Authors');
INSERT INTO public."Genres" VALUES ('79c95855-a36f-4cb1-9bc7-aab20037a2b5', 'Women college students');
INSERT INTO public."Genres" VALUES ('64bd06e9-650a-4f88-9474-316df19871e5', 'Étudiants');
INSERT INTO public."Genres" VALUES ('c331cef9-2bc4-49f3-bcb5-fd2afb23f23d', 'Histoires érotiques');
INSERT INTO public."Genres" VALUES ('833cb807-0e33-44c9-ae4e-0be7fb89405a', 'Translations into hindi');
INSERT INTO public."Genres" VALUES ('07853d7a-e471-438b-a77a-d27b1adee559', 'Novela erotica');
INSERT INTO public."Genres" VALUES ('59005fbc-6aed-40fd-9922-f840f32e93f4', 'Literatura inglesa');
INSERT INTO public."Genres" VALUES ('1fe6c1f9-1150-4441-b489-aa0bfb17f0c5', 'Erotic fiction');
INSERT INTO public."Genres" VALUES ('7f759e31-fb56-474f-85b0-532cc1a654f6', 'Adulterio');
INSERT INTO public."Genres" VALUES ('a2ac0cfe-761e-4617-9a03-b400d1057082', 'Relaciones hombre-mujer');
INSERT INTO public."Genres" VALUES ('1dfec9c2-3158-4fca-8670-9f0f4f60656a', 'Erotic');
INSERT INTO public."Genres" VALUES ('32d613ab-fa27-49ee-a388-0fbdde3adbce', 'Gens d''affaires');
INSERT INTO public."Genres" VALUES ('e5eadf28-f448-43df-9b92-aef62f7cfc03', 'Vietnamese language materials');
INSERT INTO public."Genres" VALUES ('77c9d02e-fd1b-47fe-be6d-d0df0e7fc393', 'Erotic stories');
INSERT INTO public."Genres" VALUES ('0ce209c1-ef4a-4998-ad04-71ffb05c6799', 'Businesspeople');
INSERT INTO public."Genres" VALUES ('554068d8-d839-4e1d-af18-e61cb5ebf18c', 'Fiction, erotica, general');
INSERT INTO public."Genres" VALUES ('d3e55835-d02d-4801-9ef8-11fd1d10cd27', 'Sexual attraction');
INSERT INTO public."Genres" VALUES ('be5bdd51-26c8-4ce8-b6aa-f3d8238d9516', 'Fiction, erotica');
INSERT INTO public."Genres" VALUES ('d0aa249b-158c-4e6d-93c2-559732255bc2', 'Adultery');
INSERT INTO public."Genres" VALUES ('9b74727d-aa88-4756-9452-12549081b200', 'Businessmen');
INSERT INTO public."Genres" VALUES ('6684ed0d-0883-42c4-8dc3-cac54e8fb678', 'College students');
INSERT INTO public."Genres" VALUES ('89cef53c-4989-48da-b697-7071a4f9eaa1', 'Dominance (psychology)');
INSERT INTO public."Genres" VALUES ('a9edb7bd-4c0d-4a75-91b8-2a47997a2f7a', 'Severe poverty');
INSERT INTO public."Genres" VALUES ('c495e81c-1026-4d7d-b34d-0328174024c3', 'Serie:the_hunger_games');
INSERT INTO public."Genres" VALUES ('abaa5bcc-2a87-43d3-ac7c-88adccbabfaf', 'Short stories');
INSERT INTO public."Genres" VALUES ('e8c2eb0a-f402-4e8e-802d-10357d8c038f', 'Chinese language materials');
INSERT INTO public."Genres" VALUES ('0a6f2754-8fd5-47cf-bdf9-9196819250a1', 'American fiction');
INSERT INTO public."Genres" VALUES ('ddab918f-cf31-4a7b-a858-c4d67353134b', 'Competencias');
INSERT INTO public."Genres" VALUES ('bff0f89b-ec0e-4ce0-b1ec-0a8f4f1d5f14', 'Programas');
INSERT INTO public."Genres" VALUES ('874483f8-4014-4f0f-9bf9-972d5e1bf0da', 'Televisión');
INSERT INTO public."Genres" VALUES ('eeb07ae8-612b-4da9-aad0-d62750060bf4', 'Émissions télévisées');
INSERT INTO public."Genres" VALUES ('4c6f8280-fc49-46c0-a547-967bfb491818', 'Television programs fiction');
INSERT INTO public."Genres" VALUES ('1df29b46-381b-4ad2-8298-3a842ecc6354', 'Survival skills fiction');
INSERT INTO public."Genres" VALUES ('00260188-412a-45de-b909-cbb48b2b8da0', 'Survival fiction');
INSERT INTO public."Genres" VALUES ('ea047a24-2ba5-4bd1-9851-91a3f6b0e9d9', 'Fictional work');
INSERT INTO public."Genres" VALUES ('e8025ecf-22c8-4b93-982f-9461451fe452', 'Contests fiction');
INSERT INTO public."Genres" VALUES ('c3075545-58a6-4a7a-990f-77200e11476d', 'Action and adventure fiction');
INSERT INTO public."Genres" VALUES ('2eb2df4a-5a0c-43a3-bbfb-88b8bf4809a1', 'Fantastische literatur');
INSERT INTO public."Genres" VALUES ('1f1caf53-ca88-4c00-a264-2ec245dd5c6c', 'Fantastische erzahlung');
INSERT INTO public."Genres" VALUES ('1db8609d-40cc-4fcc-871d-68415bdf97b9', 'Concursos');
INSERT INTO public."Genres" VALUES ('4d432cd1-6770-4c1e-a029-f2d3e1db8719', 'Programas de televisión');
INSERT INTO public."Genres" VALUES ('53665eee-a62f-46a8-99cb-103be1a8b0db', 'Relaciones humanas');
INSERT INTO public."Genres" VALUES ('b892e440-07ce-43dc-8f1c-87b8eba1c718', 'Supervivencia');
INSERT INTO public."Genres" VALUES ('3abb41f2-d869-4848-b139-2801b624048f', 'Émissions televiseés');
INSERT INTO public."Genres" VALUES ('397a9e86-f362-4a8c-a43b-89247dbae8cd', 'Relations humaines');
INSERT INTO public."Genres" VALUES ('bec5e3ff-54c2-43fd-867c-7249bae9c813', 'Concours et compétitions');
INSERT INTO public."Genres" VALUES ('ffae740b-df6c-4304-8e0c-b8f68994f1ec', 'Roman d''aventures');
INSERT INTO public."Genres" VALUES ('1d73788f-a0eb-4469-aa1d-02fd14225ae0', 'Habiletés de survie');
INSERT INTO public."Genres" VALUES ('5291a810-3412-4a2a-b17c-f20d9db82da0', 'Roman pour jeunes adultes');
INSERT INTO public."Genres" VALUES ('c50764e4-8040-47e4-b777-78696db92b20', 'Bravery.');
INSERT INTO public."Genres" VALUES ('273366a9-e2ce-40ce-b5c8-6497b9ebf0d0', 'Life risking');
INSERT INTO public."Genres" VALUES ('881b7b64-ed54-4cf8-b126-a3f24bc04349', 'Violent');
INSERT INTO public."Genres" VALUES ('22f5be10-3d20-4c3f-9657-c8d005d3b606', 'Future');
INSERT INTO public."Genres" VALUES ('d7bd0847-d62d-4487-93a2-b07243f458cd', 'Television, fiction');
INSERT INTO public."Genres" VALUES ('34743ae6-d1c2-4411-b0f9-0c0c827f3292', 'Contests, fiction');
INSERT INTO public."Genres" VALUES ('73717f8c-8425-4d30-9b46-547f1b85fd57', 'Survival stories');
INSERT INTO public."Genres" VALUES ('971b33bc-ed41-4acf-a5d0-6124acce1150', 'Books and reading');
INSERT INTO public."Genres" VALUES ('f6975dfb-77db-49ea-abe6-9664c52836c5', 'Blind');
INSERT INTO public."Genres" VALUES ('7eef82ad-1e81-42de-9f32-16771f6e5c6f', 'Survival skills');
INSERT INTO public."Genres" VALUES ('58631f2b-6ab3-42c8-8f66-25720df5d93e', 'Amerikanisches englisch');
INSERT INTO public."Genres" VALUES ('5081ed77-244c-4fa3-ae99-240ed3b1f2f7', 'Television game shows');
INSERT INTO public."Genres" VALUES ('e995a775-6135-42c9-b3fd-c88f1cf22053', 'Reality television programs');
INSERT INTO public."Genres" VALUES ('d7a2d8e2-b31a-4c75-bf5e-711b029280af', 'Contests');
INSERT INTO public."Genres" VALUES ('7733a9ec-e8cf-4a86-943f-cc7f38fdc996', 'Television programs');
INSERT INTO public."Genres" VALUES ('9aee6b19-6281-4c90-bcee-486b236742c5', 'Game shows');
INSERT INTO public."Genres" VALUES ('cdf08edd-7c10-4cfc-b5c8-7c73b98a4098', 'Contensts');
INSERT INTO public."Genres" VALUES ('07c27022-a289-4ba2-84cb-e0722262cf7d', 'Young adult works');
INSERT INTO public."Genres" VALUES ('65cbf2fb-4f93-4153-800c-cdbd9de8bef8', 'Novels');
INSERT INTO public."Genres" VALUES ('f3f70353-36cf-4c23-87e6-d2d28102403b', 'Dystopian fiction');
INSERT INTO public."Genres" VALUES ('1d8e778f-e5fb-4841-bf37-e78a7ea6c766', 'Apocalyptic fiction');
INSERT INTO public."Genres" VALUES ('8698ac87-ec56-41a7-9751-09dc4ba84c60', 'Self-sacrifice');
INSERT INTO public."Genres" VALUES ('b3b6bb88-2b8f-4634-8ac0-3fa58c9fb6b4', 'Effects of war');
INSERT INTO public."Genres" VALUES ('528bdab6-d1b0-42d5-9689-4080baca441d', 'Oppression');
INSERT INTO public."Genres" VALUES ('cd753fb9-92a3-4f0e-bc00-8094af1f53db', 'Starvation');
INSERT INTO public."Genres" VALUES ('6c11ba08-497d-43dd-b847-74426961ca9f', 'Dieux grecs');
INSERT INTO public."Genres" VALUES ('28ef988c-e0c7-4d0c-9ebf-b7b2906b2014', 'Children''s books');
INSERT INTO public."Genres" VALUES ('8c18f63c-c2e2-4071-8786-ab58a5feb1a6', 'Mitología griega');
INSERT INTO public."Genres" VALUES ('d954d288-0803-4b33-86fc-b345e6c89508', 'Campamentos');
INSERT INTO public."Genres" VALUES ('8f27dc4f-a038-4b46-99f6-050be37c8db4', 'Amistad');
INSERT INTO public."Genres" VALUES ('8c215603-a4bc-42c2-9561-9b0159fe91f4', 'Amitié');
INSERT INTO public."Genres" VALUES ('1c1a7a24-6ad3-4b1a-ad93-29b982b73306', 'Colonies de vacances');
INSERT INTO public."Genres" VALUES ('66237398-d154-4441-b599-62aa102771c0', 'Child and youth fiction');
INSERT INTO public."Genres" VALUES ('6667006e-8514-4b8a-8f50-b26c9c88e7fc', 'Gods and goddesses');
INSERT INTO public."Genres" VALUES ('3af48413-14c8-43b2-850f-0e8eb7eae8af', 'Legends, myths, fables');
INSERT INTO public."Genres" VALUES ('4f97a537-82e0-46a3-a5b9-a652d2103841', 'Gods, fiction');
INSERT INTO public."Genres" VALUES ('0e946358-e84a-431f-8c22-5c3afef99ca6', 'Camps, fiction');
INSERT INTO public."Genres" VALUES ('3fb6166e-6a96-4f60-998e-6f4493bf6d4c', 'Cartoons and comics');
INSERT INTO public."Genres" VALUES ('30253e5d-348e-45db-b7b1-ac6c3543983a', 'Greek gods');
INSERT INTO public."Genres" VALUES ('a9db6c11-01b5-4dba-8da7-3f21fd4ef30f', 'Identity');
INSERT INTO public."Genres" VALUES ('6f79e3eb-b046-49f4-8281-c086ce1e59a6', 'Mythology, greek');
INSERT INTO public."Genres" VALUES ('6d970fe4-00b2-4ab3-bb9e-418b32229750', 'Camps');
INSERT INTO public."Genres" VALUES ('5c7e5059-fdae-47a0-aa80-0df9eff9c61c', 'Greek mythology');
INSERT INTO public."Genres" VALUES ('4f207997-a8e6-4729-83e4-3a1e29a3b123', 'Rape');
INSERT INTO public."Genres" VALUES ('6bc54c1b-5c96-4872-b722-7055f80496d1', 'Filles');
INSERT INTO public."Genres" VALUES ('9e6d8fa0-f9da-4e43-a4b2-c467956d0f1e', 'Procès (viol)');
INSERT INTO public."Genres" VALUES ('44e02a62-7aaf-4f61-b9fc-0e21a60abc52', 'Relations raciales');
INSERT INTO public."Genres" VALUES ('07476222-5a51-486a-beda-e5fa56c547cd', 'Muchachas');
INSERT INTO public."Genres" VALUES ('f6e7c9a1-8e4b-4248-a58f-e2766f8ae1e2', 'Father-daughter relationship');
INSERT INTO public."Genres" VALUES ('b79ba18b-b215-4391-a85a-2c6deb732e87', 'Procesos por violación');
INSERT INTO public."Genres" VALUES ('d087dbca-ef35-4408-9c16-179d60e060fe', 'Relaciones raciales');
INSERT INTO public."Genres" VALUES ('45338ddd-3e7a-44c5-b3e7-c936758de4ac', 'Padres e hijas');
INSERT INTO public."Genres" VALUES ('716914f2-c0cb-4292-9054-258e52e7d9eb', 'African americans, fiction');
INSERT INTO public."Genres" VALUES ('a6b88800-fb01-46e4-bf14-644f2d30e116', 'Lawyers, fiction');
INSERT INTO public."Genres" VALUES ('c8ba7190-f4fd-410d-b946-3c92901d57bb', 'Southern states, fiction');
INSERT INTO public."Genres" VALUES ('f79ae256-1e15-43b5-8802-ca78f96d58c2', 'Fiction, legal');
INSERT INTO public."Genres" VALUES ('3cf4cd09-6cb9-4817-bb9e-04503c86fc1c', 'Kind');
INSERT INTO public."Genres" VALUES ('d0441068-bec0-44fe-ad71-70d097b753f2', 'Toleranz');
INSERT INTO public."Genres" VALUES ('0954502a-4058-42af-bf7c-51010a0a01d4', 'Father-daughter relationship,');
INSERT INTO public."Genres" VALUES ('f0150fd3-6ce4-4e09-a01e-74349b9c600a', 'African americans');
INSERT INTO public."Genres" VALUES ('2425161b-1bef-496f-88e8-e9b48f7b72f5', 'Great depression');
INSERT INTO public."Genres" VALUES ('b8c6ca39-b97d-4e86-baec-c322919b96ae', 'Trials (rape)');
INSERT INTO public."Genres" VALUES ('81a8b346-fa75-410d-9842-5ba97ea5d467', 'Fathers and daughters');
INSERT INTO public."Genres" VALUES ('1e720719-78a1-45c2-8290-0b090165a5d9', 'Girls');
INSERT INTO public."Genres" VALUES ('ab868513-6a06-4d2a-a8cd-dedeefcdc07d', 'Lawyers');
INSERT INTO public."Genres" VALUES ('5880bc02-11e3-47c1-9dcd-09233d60550c', 'Race relations');
INSERT INTO public."Genres" VALUES ('49575cf7-906e-4969-b811-cc7265fde25f', 'Bildungsromans');
INSERT INTO public."Genres" VALUES ('c7cdde09-5088-4aef-84a9-acefeba58678', 'Legal stories');
INSERT INTO public."Genres" VALUES ('491b3320-41ee-4685-b556-1f654b96a283', 'Rape trials');
INSERT INTO public."Genres" VALUES ('aff044eb-3321-4045-8d03-d26ea216a878', 'Loss of innocence');
INSERT INTO public."Genres" VALUES ('d44889e5-15fc-4e87-a2da-b42eb9313108', 'Laws');
INSERT INTO public."Genres" VALUES ('2a5a3c1d-9a5e-4254-901b-4b6098dc5f04', 'Gender roles');
INSERT INTO public."Genres" VALUES ('1533b4ec-8278-4b10-b0dc-5ddaedabbbd5', 'Compassion');
INSERT INTO public."Genres" VALUES ('02668f21-627c-4544-ba65-d4618f841dd9', 'Courage');
INSERT INTO public."Genres" VALUES ('5c9d4573-0090-401a-920e-29d2b84521fc', 'Racial injustice');
INSERT INTO public."Genres" VALUES ('996c764a-16f7-4406-a19a-fbdabded0514', 'Southern life');
INSERT INTO public."Genres" VALUES ('34c73019-5037-486e-bf8f-661f38c71a7e', 'Southern gothic');
INSERT INTO public."Genres" VALUES ('25209df8-94fa-4533-965f-cbc189aa01be', 'Mob mentality');
INSERT INTO public."Genres" VALUES ('99fed9d6-bca9-44dc-a2ab-ce1f373fe763', 'Racial segregation');
INSERT INTO public."Genres" VALUES ('a2cf8bbe-8b79-4ece-aad0-571245584ede', 'Murder--fiction.');
INSERT INTO public."Genres" VALUES ('5116d9e0-6cf5-41b5-a53d-9540c5cd05b7', 'Criminals, fiction');
INSERT INTO public."Genres" VALUES ('02773b79-ab9b-40ed-81c1-fe3b2378224d', 'Mystery and detective stories');
INSERT INTO public."Genres" VALUES ('33d8ce91-5af4-4348-8b88-027a0c9c6a00', 'Murder, fiction');
INSERT INTO public."Genres" VALUES ('c0db7098-a823-4fdc-be65-beebfacbcbcb', 'Billionaire romance');
INSERT INTO public."Genres" VALUES ('45b546da-197c-4eaf-8533-47b5941b5f88', 'Smut');
INSERT INTO public."Genres" VALUES ('f4bf6673-85d1-4096-904c-6b9fa815ef6a', 'Forced proximity');
INSERT INTO public."Genres" VALUES ('565dc059-423c-49e2-9625-9b0a3359869f', 'Fake dating');
INSERT INTO public."Genres" VALUES ('3440d7a2-3409-43a0-be2f-b673edf26213', 'Lies');
INSERT INTO public."Genres" VALUES ('201aede7-0ead-4298-9804-0912fc1f9f23', 'Secrets');
INSERT INTO public."Genres" VALUES ('5bcb42d8-32e2-4d8b-857b-9dba171ab18e', 'Family drama');
INSERT INTO public."Genres" VALUES ('14705434-7253-4360-86e3-44963a13ef8d', 'Academia');
INSERT INTO public."Genres" VALUES ('49c34034-1ebf-4d0a-9a23-441c505cf7b5', 'College');
INSERT INTO public."Genres" VALUES ('0fff65fa-d48f-4b34-a51f-d6ffe17295c0', 'Strong heroine');
INSERT INTO public."Genres" VALUES ('3602e76e-f2bc-4df6-b9af-5f503ca64385', 'Bad boy');
INSERT INTO public."Genres" VALUES ('7bd1eabc-bdbc-445f-ba98-b3c4fd13544f', 'Enemies to lovers');
INSERT INTO public."Genres" VALUES ('a8ccc213-8dea-41bc-854f-adc4a6c183ba', 'Thriller');
INSERT INTO public."Genres" VALUES ('e52efde4-fc4d-4d6d-b5b0-125785fec39e', 'American young adult fiction');
INSERT INTO public."Genres" VALUES ('13198d10-1aa0-4c21-8373-8ac9c8f69b1f', 'Mishnah');
INSERT INTO public."Genres" VALUES ('53b4e8cb-dc59-445f-9510-81118b60dbc6', 'Supernatural fiction');
INSERT INTO public."Genres" VALUES ('cdf9da9a-6f9e-4ae0-9933-a68805aa9296', 'Wohnungswechsel');
INSERT INTO public."Genres" VALUES ('14b3536f-4a74-43f1-bfa9-86b983e86ac8', 'Weibliche jugend');
INSERT INTO public."Genres" VALUES ('3adeff21-7aee-4a73-b401-3c5369b0343f', 'Tochter');
INSERT INTO public."Genres" VALUES ('4fe25f92-ee92-4be3-8fde-2a71a94cf7c3', 'Gefahr');
INSERT INTO public."Genres" VALUES ('deabce26-1fa1-4330-bb94-efa88e9af413', 'Außenseiterin');
INSERT INTO public."Genres" VALUES ('0ff40c2a-c631-46de-8a3e-550184f42ba5', 'Dating & sex');
INSERT INTO public."Genres" VALUES ('60743ab8-8f7f-41ca-a1e0-365b12aaa3a0', 'Paranormal');
INSERT INTO public."Genres" VALUES ('0c4dd495-a605-41cf-9f08-f0b9d4a095ec', 'Persévérance');
INSERT INTO public."Genres" VALUES ('cf03e527-36da-461a-a1be-76eb6c42e3ee', 'Amour');
INSERT INTO public."Genres" VALUES ('633901bd-a95c-46d4-af3b-a8313e792c8d', 'Premier amour');
INSERT INTO public."Genres" VALUES ('60052918-e0c8-4ea6-854d-d48b515b319a', 'Écoles secondaires');
INSERT INTO public."Genres" VALUES ('3388b989-44f9-4efd-bf0b-4ffa1bcb3205', 'Élèves du secondaire');
INSERT INTO public."Genres" VALUES ('25d1dc40-7561-4987-a669-340b9f827fb4', 'Persistence');
INSERT INTO public."Genres" VALUES ('990dcde4-bee9-4ad3-9267-948fde53a3a7', 'Novela estadounidense');
INSERT INTO public."Genres" VALUES ('f18987fa-7217-4b83-a1e8-92d63e8a3633', 'Spanish language');
INSERT INTO public."Genres" VALUES ('45861056-7aaa-436d-8ab6-4b0139b02ae4', 'Verlieben');
INSERT INTO public."Genres" VALUES ('6f475f8f-709a-4420-84d4-f0d7d8afefef', 'Vampir');
INSERT INTO public."Genres" VALUES ('c5ab0a16-6a49-4f9c-a46a-b0c84032e5b2', 'Junge frau');
INSERT INTO public."Genres" VALUES ('2a1bc6a9-fe83-4188-ba94-88f5ea7c4d4a', 'High school');
INSERT INTO public."Genres" VALUES ('b0cf4c8a-2afd-4c72-9edd-819057be20e4', 'Youth, fiction');
INSERT INTO public."Genres" VALUES ('f21583d2-fcb5-4fad-89e8-e89186d5fca9', 'Yan qing xiao shuo');
INSERT INTO public."Genres" VALUES ('6c3dc204-1828-4873-b07d-fe837c508d2e', 'Werewolves');
INSERT INTO public."Genres" VALUES ('c6021066-f174-41d0-bdf8-9080b6dce212', 'Teenagers');
INSERT INTO public."Genres" VALUES ('99423b19-0b16-4602-b631-40166031c1b3', 'Upside-down books');
INSERT INTO public."Genres" VALUES ('44ad972d-8169-460c-acf8-2eedcbf559c9', 'Interpersonal attraction');
INSERT INTO public."Genres" VALUES ('74f29f8a-b011-4752-be9e-b4da116c6b5d', 'Russian language materials');
INSERT INTO public."Genres" VALUES ('3b212d69-846b-428a-8599-535fca927c18', 'Simplified characters');
INSERT INTO public."Genres" VALUES ('aadf9810-54cc-427c-b6d9-3ff2dce9d6e7', 'Chang pian xiao shuo');
INSERT INTO public."Genres" VALUES ('a989bbe2-7e52-47a8-a7a8-0cfd23587158', 'Chinese language');
INSERT INTO public."Genres" VALUES ('cde90ef5-2161-4847-b6ad-35da25210db9', 'Motion pictures');
INSERT INTO public."Genres" VALUES ('cc1f7c01-c28e-4a11-9cce-5b50f7eeca0d', 'Twilight (meyer, stephenie)');
INSERT INTO public."Genres" VALUES ('9b2018b2-e8b5-4e9a-a2d9-2e236ca5ecfc', 'Escuelas secundarias');
INSERT INTO public."Genres" VALUES ('a70784eb-96f9-45e0-a9a4-b026bcb77aee', 'Vampiros');
INSERT INTO public."Genres" VALUES ('0f3aa117-9cb2-4d44-b3b3-e41feb6099e9', 'Cheese');
INSERT INTO public."Genres" VALUES ('4e420e27-9128-431c-993e-daec5aa4877b', 'Washington (state), fiction');
INSERT INTO public."Genres" VALUES ('7fbff0e3-dd3b-4659-bbe4-9ece64cf4149', 'Vampires, fiction');
INSERT INTO public."Genres" VALUES ('b61d726f-0597-41fa-affb-5f410fad0e23', 'High school students');
INSERT INTO public."Genres" VALUES ('c515d407-1693-4190-897d-14c09e0f3ad6', 'High schools');
INSERT INTO public."Genres" VALUES ('279a5a79-d641-428d-b394-7e9b0b900f55', 'Horror & ghost stories');
INSERT INTO public."Genres" VALUES ('0105d894-67d1-43e1-b917-9b7a51f49901', 'School & education');
INSERT INTO public."Genres" VALUES ('43fb61b8-3e19-40f7-9e36-0456d9e06eb6', 'Fairies--fiction.');
INSERT INTO public."Genres" VALUES ('83380588-2710-4afa-9582-9c6e6ea274ba', 'Young adult fiction, royalty');
INSERT INTO public."Genres" VALUES ('9c929a3a-3d62-42f9-9b89-9e935f2c2b83', 'Courts and courtiers, fiction');
INSERT INTO public."Genres" VALUES ('09805e3b-63ca-4ae3-bc50-8c29042c6777', 'Princes, fiction');
INSERT INTO public."Genres" VALUES ('0b7e75b7-9124-4bb7-9f47-5ef8b15e18d4', 'Orphans, fiction');
INSERT INTO public."Genres" VALUES ('1e0cb820-8359-4269-a3a5-8fbdf4050677', 'Princes');
INSERT INTO public."Genres" VALUES ('53453169-1534-49ea-a22c-e0226169c2d6', 'Princes--fiction.');
INSERT INTO public."Genres" VALUES ('e0fda348-ee52-4545-8d8b-609104b5992d', 'Orphans--fiction.');
INSERT INTO public."Genres" VALUES ('cb40caaf-313f-4d19-948a-158e85d46a78', 'Sisters--fiction.');
INSERT INTO public."Genres" VALUES ('c63eaf41-ed7d-4e58-a084-c5a0e7369395', 'Technology and civilization');
INSERT INTO public."Genres" VALUES ('13bcd858-cc78-4f14-8143-309d7f208592', 'Anthropology');
INSERT INTO public."Genres" VALUES ('d98f857b-83de-4f79-b3d4-0bb56ad88a11', 'Tecnología y civilización');
INSERT INTO public."Genres" VALUES ('b310f710-3691-48dd-a077-fbc0d5d45e94', 'Cronología histórica');
INSERT INTO public."Genres" VALUES ('af52721b-5e8b-4a0d-85f3-a92586644a56', 'Sci027000 sci086000 sci000000');
INSERT INTO public."Genres" VALUES ('4bd2692e-8670-47ca-8ac8-f0c23301f550', '599.9');
INSERT INTO public."Genres" VALUES ('4eef3508-b6d3-4bbd-b8e8-582c3b92ddcb', 'Cb113.h4 h3713 2015');
INSERT INTO public."Genres" VALUES ('45bbb1c5-ab2b-4819-9bc5-7fbb5cac2f4b', 'Human beings--history');
INSERT INTO public."Genres" VALUES ('593d51f4-5cfd-47cf-8316-51fa4593a842', 'Civilization--history');
INSERT INTO public."Genres" VALUES ('87abd351-cbeb-4b47-97af-c0905029937c', 'Cognition and culture');
INSERT INTO public."Genres" VALUES ('bbf0d362-4588-4fc9-be6f-07fbe6d01fe9', 'Economic history');
INSERT INTO public."Genres" VALUES ('a73c700d-0657-4765-911b-20f3d0c740b6', 'Psychology');
INSERT INTO public."Genres" VALUES ('7465c4fd-204c-4b52-b407-c5c5322a9ac0', 'Society');
INSERT INTO public."Genres" VALUES ('7a7aac5e-4c6a-4b6f-a94b-802c82951682', 'Zivilisation');
INSERT INTO public."Genres" VALUES ('1b870ae5-4a85-439c-a689-f081bae8c2cd', 'Sapiens');
INSERT INTO public."Genres" VALUES ('78303360-182b-4f0c-976b-311eed5740b2', 'Human');
INSERT INTO public."Genres" VALUES ('0d54953d-1255-4133-bebe-5a7ef40a9de4', 'Fysisk antropologi');
INSERT INTO public."Genres" VALUES ('946d3420-f2b9-4b39-849d-113b1e0a5795', 'Människan');
INSERT INTO public."Genres" VALUES ('8720b410-5943-40ef-8478-88cabef7021a', 'Humanité');
INSERT INTO public."Genres" VALUES ('5a2b5b9c-cbf3-4274-a8d1-644eb19b609d', 'Menschheit');
INSERT INTO public."Genres" VALUES ('5f513ab9-bdf3-494b-a96e-5e81321c9859', 'Evolution');
INSERT INTO public."Genres" VALUES ('7cb6a802-2b64-4cbe-996e-a8480c2664e1', 'Life sciences');
INSERT INTO public."Genres" VALUES ('1dbff9c4-09ce-4909-8b69-dff3d6b98dc8', 'Homme');
INSERT INTO public."Genres" VALUES ('7998ac9f-4691-4693-b2df-40e270216869', 'Civilisation');
INSERT INTO public."Genres" VALUES ('3f3c5064-faa8-43c0-852b-17cff0747af5', 'Humans');
INSERT INTO public."Genres" VALUES ('6284a1f2-4d91-4519-be89-44672e510fff', 'Histoire');
INSERT INTO public."Genres" VALUES ('de3b7935-2b68-4788-bc79-6e9a860c3d91', 'Histoire universelle');
INSERT INTO public."Genres" VALUES ('669288f1-de02-4de7-8e67-38ffdf55c942', 'Technologie et civilisation');
INSERT INTO public."Genres" VALUES ('b57ba7da-0ee2-4173-a494-b7e7824e7032', 'Chronologie historique');
INSERT INTO public."Genres" VALUES ('d18b861c-99e6-4f36-a836-0c8829635f53', 'Chronology, historical');
INSERT INTO public."Genres" VALUES ('8cca2a67-b51f-4c64-900b-32c0bdc36733', 'Civilization, history');
INSERT INTO public."Genres" VALUES ('64cbd613-6b40-408f-9e20-4e3bdb227f48', 'Weltgeschichte');
INSERT INTO public."Genres" VALUES ('87c94031-feab-42ea-a340-6e641dc69ba7', 'Science / general');
INSERT INTO public."Genres" VALUES ('a967ed2e-0737-4bec-9f7e-05aff2576729', 'Science');
INSERT INTO public."Genres" VALUES ('3cec2b7d-012b-4f22-b745-ebd6b898eff8', 'Non-fiction');
INSERT INTO public."Genres" VALUES ('2909eb51-90b5-4cdc-938c-b28e15ca5390', 'World history');
INSERT INTO public."Genres" VALUES ('e56984a6-8730-4fd4-862f-6c2f3dc07d94', 'Hombre');
INSERT INTO public."Genres" VALUES ('700876b0-f61a-4e87-85a8-4fa3fb7e3ea2', 'Civilization');
INSERT INTO public."Genres" VALUES ('894901d0-a4c6-45ce-9fa6-1f4b83f255cf', 'Historia');
INSERT INTO public."Genres" VALUES ('bdd70c9b-c681-49e6-97bd-ea86874c955c', 'Historia universal');
INSERT INTO public."Genres" VALUES ('f33f1cc2-226e-4d43-8742-a3c220c0fb7a', 'Historical chronology');
INSERT INTO public."Genres" VALUES ('5faa9ba1-661e-4eac-b2e4-62f3a1383580', 'Human beings');
INSERT INTO public."Genres" VALUES ('12fe7051-fe23-4ca7-9400-e8a48a2dc7ae', 'Philosophy, taoist');
INSERT INTO public."Genres" VALUES ('0cceb704-1728-432d-9d0a-8b8e1de26338', 'Spiritual warfare');
INSERT INTO public."Genres" VALUES ('44b5a17f-f1b9-4fb9-a6bb-7f21fe075636', 'Religion');
INSERT INTO public."Genres" VALUES ('3864bb33-615a-4cf7-a9ff-a1046ba1c721', 'Spirituality - general');
INSERT INTO public."Genres" VALUES ('809943ab-4df3-434e-ba8d-7389ff2ef283', 'Asia - general');
INSERT INTO public."Genres" VALUES ('772ea0e5-6474-45b3-a31d-9c019678bd20', 'Religious aspects of peace');
INSERT INTO public."Genres" VALUES ('9b1c2b4c-d023-4451-83a8-7d7215b44e58', 'Religious aspects');
INSERT INTO public."Genres" VALUES ('6622724d-6884-4a8a-8d05-a6a884b6bd32', 'Peace');
INSERT INTO public."Genres" VALUES ('9f5677bd-2f65-4f39-8409-cf243ca4bbaf', 'Conflict management');
INSERT INTO public."Genres" VALUES ('9213bff4-244a-4614-8c73-84c553d14aac', 'Philosophy / eastern');
INSERT INTO public."Genres" VALUES ('cbb4fb8f-9c94-4888-9901-87545ef73e61', 'Competition (psychology)');
INSERT INTO public."Genres" VALUES ('7f8c70cc-34f8-4179-9f14-8a1f9cac01e7', 'War (philosophy)');
INSERT INTO public."Genres" VALUES ('1ad1635f-6a9c-4a97-b571-faabd81bd2a8', 'Military history');
INSERT INTO public."Genres" VALUES ('3e7cbda7-8a4e-4d89-8fb9-86eca5cfa1af', 'Pictorial works');
INSERT INTO public."Genres" VALUES ('fa15617b-50f9-464c-8350-4f5951f00cf6', 'Taoísmo');
INSERT INTO public."Genres" VALUES ('782b5086-59fd-4107-a3de-5876a454df30', 'Ciência militar');
INSERT INTO public."Genres" VALUES ('36abbc63-28dc-45d2-8b4c-8c8510acd097', 'U101 .s95 1983');
INSERT INTO public."Genres" VALUES ('de4e8358-32ce-4358-817b-95566c540c41', 'Self-help techniques');
INSERT INTO public."Genres" VALUES ('b25ec2bf-a349-401f-b5f5-6ab902cf6aac', 'Reference');
INSERT INTO public."Genres" VALUES ('9d8fc459-af55-4f20-8b2d-0fcd1134c35f', 'Art militaire');
INSERT INTO public."Genres" VALUES ('335d0030-4ae5-462f-a49a-ce97ee5c5bb4', 'Sunzi bing fa (sunzi)');
INSERT INTO public."Genres" VALUES ('600f7450-d95a-42ce-ba64-3eff97b26400', 'Illustrations');
INSERT INTO public."Genres" VALUES ('586d8e0e-debf-47d0-bc70-a1e722b2d57a', 'History -- asia -- china');
INSERT INTO public."Genres" VALUES ('0563ba0a-9cd2-4c33-9c17-cf157785ad5e', 'Stratégie');
INSERT INTO public."Genres" VALUES ('9ec39c11-4fa4-496d-96ff-d97468087e5d', 'Illustration of books');
INSERT INTO public."Genres" VALUES ('8996a572-9dc5-4f3a-a958-f99a38f8e61c', 'War and society');
INSERT INTO public."Genres" VALUES ('72818a19-544a-4f9b-88a0-8a337e79da9b', 'War -- early works to 1800');
INSERT INTO public."Genres" VALUES ('7d594326-2aaa-4837-b5c2-9e757ceb230c', 'Philosophy, chinese');
INSERT INTO public."Genres" VALUES ('1aff102b-772a-4a25-a86c-402b343e2741', 'Political science, history');
INSERT INTO public."Genres" VALUES ('5b0088c5-c562-4171-aaf2-498a9041240a', 'Philosophy, asian');
INSERT INTO public."Genres" VALUES ('d77105dc-4f71-4817-8029-d18e10196d85', 'Philosophy and ethics');
INSERT INTO public."Genres" VALUES ('96904489-ae9e-4da2-b777-ab3c23e8d262', 'Military and warfare');
INSERT INTO public."Genres" VALUES ('0d9c170e-845a-4ee8-98ad-ecf8cc9277a5', 'Asian philosophy');
INSERT INTO public."Genres" VALUES ('fb0a6242-a8c6-4d9c-a02e-06ea2fb4234a', 'Strategy & weapons of war');
INSERT INTO public."Genres" VALUES ('eb8c7ae4-dfb1-4ab3-8b61-024d9918cf85', 'Chinese history');
INSERT INTO public."Genres" VALUES ('e512f3d6-3ae1-4bcb-a9d7-a1ceadaf3a4c', '355.02');
INSERT INTO public."Genres" VALUES ('4e806120-ffbf-4138-abba-c8a0fd59ccfd', 'U101 .s95 1994');
INSERT INTO public."Genres" VALUES ('99a0a291-458d-4c82-be0d-26062b9deef9', 'Literary collections');
INSERT INTO public."Genres" VALUES ('dfd1a23f-a1ed-4c26-bbfa-4674fe9b8737', 'Organizational behavior');
INSERT INTO public."Genres" VALUES ('fde78633-d05d-4d4c-bbdb-fb37093e8fbc', 'Management science');
INSERT INTO public."Genres" VALUES ('be43b3e1-f8ac-49a9-9cb1-eca01cca85e0', 'Succès dans les affaires');
INSERT INTO public."Genres" VALUES ('ee2e64e2-d2e9-4379-9545-77fbc0746e46', 'Gestion d''entreprise');
INSERT INTO public."Genres" VALUES ('f2a53942-d905-4133-8eec-717098dce9ff', 'Verk före 1800');
INSERT INTO public."Genres" VALUES ('33ba8625-4653-4357-b36f-56c2ee736b61', 'Krigskonst');
INSERT INTO public."Genres" VALUES ('ccb04f88-3a46-4e63-a570-0ab755202e32', 'Technology & engineering');
INSERT INTO public."Genres" VALUES ('77a55382-1e52-431e-b07a-c42f8d6962a2', 'Other');
INSERT INTO public."Genres" VALUES ('8b7ccc27-deea-4bcc-9995-c2deaf1e7ff8', 'Estrategia');
INSERT INTO public."Genres" VALUES ('d41900d9-1a8c-4e8f-b071-74eb5548004d', 'Guerra');
INSERT INTO public."Genres" VALUES ('e32dd44b-d247-49ee-83a6-044b1bf903c7', 'Art et science militaires');
INSERT INTO public."Genres" VALUES ('9158ff1a-115b-42b6-b13e-8920603615b6', 'Ouvrages avant 1800');
INSERT INTO public."Genres" VALUES ('db42ca3b-3ef2-46b2-88ec-7eb28cbb4010', 'Guerre');
INSERT INTO public."Genres" VALUES ('8b937906-29bd-4241-8687-67d6ceb24b29', 'War, history');
INSERT INTO public."Genres" VALUES ('c5730dea-cb74-4f7f-a391-8ad3cce224c3', 'Tactics');
INSERT INTO public."Genres" VALUES ('5cac75e4-a920-4356-9e20-dea6544def4d', 'Strategic planning');
INSERT INTO public."Genres" VALUES ('9b39c41b-0b1a-4ed9-b9d1-c52d7a229c64', 'Selling');
INSERT INTO public."Genres" VALUES ('176375cb-95a4-4740-acdc-6802ef6bd3b0', 'Salesmanship');
INSERT INTO public."Genres" VALUES ('970e960e-a2d1-4bf9-9b8a-9332eabf9fee', 'Sales');
INSERT INTO public."Genres" VALUES ('4c59b7ce-5322-42f1-a734-3dca6e773488', 'Persuasion');
INSERT INTO public."Genres" VALUES ('335fa8c2-a6ef-4510-b7b6-7727d577fa97', 'History / military / general');
INSERT INTO public."Genres" VALUES ('eb336560-10a6-48a5-b6ed-c473784aa423', 'Sales & selling - management');
INSERT INTO public."Genres" VALUES ('65083803-228e-40d3-a7f9-37bda965365f', 'Marketing - general');
INSERT INTO public."Genres" VALUES ('b48f6e81-16ac-438c-8bac-7e42b712c02e', 'China');
INSERT INTO public."Genres" VALUES ('527db867-7ea8-4d16-9b10-df69e514f77e', 'Literature: classics');
INSERT INTO public."Genres" VALUES ('4a967319-f363-4e81-9232-8dc95dc440df', 'Social history');
INSERT INTO public."Genres" VALUES ('03e24207-f9b6-4b66-8e7a-fc91a7693d85', 'Politics & government');
INSERT INTO public."Genres" VALUES ('a8fe7af9-98bc-4f10-83e5-5f4d0ea16e11', 'History - military / war');
INSERT INTO public."Genres" VALUES ('af7a8ca3-d180-4bb0-8d22-ad1de0c4d339', 'Military history - ancient');
INSERT INTO public."Genres" VALUES ('a563c39a-a26c-4a81-8407-915a3cfe3b75', 'Negotiating');
INSERT INTO public."Genres" VALUES ('233b6d8b-8026-4d2f-8ad4-969433144fb4', 'Management - general');
INSERT INTO public."Genres" VALUES ('c00f8a77-2fda-46b9-a81f-2b74b122c9b2', 'Reference - general');
INSERT INTO public."Genres" VALUES ('eb905dad-660c-4c6a-886a-866104812932', 'Business & economics');
INSERT INTO public."Genres" VALUES ('989c8276-3afc-43e9-aa75-8cfdff50d209', 'Business/economics');
INSERT INTO public."Genres" VALUES ('9949d076-1587-4dff-9daa-127f67eeb83a', 'Business strategy');
INSERT INTO public."Genres" VALUES ('d6c76ea4-0eac-4245-9871-079cb494c5af', 'Military - general');
INSERT INTO public."Genres" VALUES ('8d062490-6e12-46c4-bae5-357771babf16', 'History / military / strategy');
INSERT INTO public."Genres" VALUES ('76ce7d8e-09b0-4680-93f6-d5ee8a7cdc77', 'Eastern - general');
INSERT INTO public."Genres" VALUES ('ac7351ef-9987-486a-b4c4-0a993b980098', 'Eastern');
INSERT INTO public."Genres" VALUES ('c61c7617-b543-4fd5-ae03-18bc93b66d5f', 'Military science');
INSERT INTO public."Genres" VALUES ('ed3aa1b3-109d-4b47-804e-0cab0f4fee9c', 'Warfare & defence');
INSERT INTO public."Genres" VALUES ('74d47770-e375-424f-ba1a-a2c5600af0c0', 'Exito en los negocios');
INSERT INTO public."Genres" VALUES ('97e5aa47-adae-4ac1-ab36-3b1f38f2343a', 'Administración');
INSERT INTO public."Genres" VALUES ('d0f7de7b-46e1-4695-980f-d00ee8a10eac', 'Parenting');
INSERT INTO public."Genres" VALUES ('5494dc42-5423-4088-90c6-09646836952d', 'Competition');
INSERT INTO public."Genres" VALUES ('246852ae-123e-4506-8529-7d3881c05915', 'Criticism and interpretation');
INSERT INTO public."Genres" VALUES ('a7c33404-7673-471e-8d69-55a3d34278c9', 'Parent and teenager');
INSERT INTO public."Genres" VALUES ('38302df2-5239-40fd-b159-0862b13d295b', 'Art et science militaire');
INSERT INTO public."Genres" VALUES ('9dff59e0-6806-4d84-a2b7-eaa85bc09941', 'Tangut language');
INSERT INTO public."Genres" VALUES ('8e569767-4d41-48d0-98fc-09bcb8a7d7cd', 'Executive ability');
INSERT INTO public."Genres" VALUES ('4a6261ef-62f0-43e0-aee3-a424a27344db', 'Sales management');
INSERT INTO public."Genres" VALUES ('dd3cb838-1bc0-4f04-ac7c-8320d5f4c762', 'Aptitudes de mando');
INSERT INTO public."Genres" VALUES ('fda09d1e-9692-4b5a-9691-a793cd76bd52', 'Éxito en los negocios');
INSERT INTO public."Genres" VALUES ('a50c8085-c187-4ddc-88ba-7935822ec106', 'Obras anteriores a 1800');
INSERT INTO public."Genres" VALUES ('096ee501-b21d-444d-9a65-545d6ab23969', 'Sales promotion');
INSERT INTO public."Genres" VALUES ('8f945b95-4933-4bab-b9e5-d05c9e4a10ac', 'Ciencia militar');
INSERT INTO public."Genres" VALUES ('2bff74b0-4827-41d9-8bbf-263fa2fe2800', 'Marketing');
INSERT INTO public."Genres" VALUES ('00eba844-4dc2-4986-b11b-e68a70e5cb70', 'Industrial management');
INSERT INTO public."Genres" VALUES ('3651ff6e-cccb-47ea-893e-2824577f3755', 'Success in business');
INSERT INTO public."Genres" VALUES ('0f19d317-8d06-4d2f-903f-f1cc0ee34b76', 'War');
INSERT INTO public."Genres" VALUES ('514b9c0b-25d2-40ec-bd1d-5764f2487d75', 'Leadership');
INSERT INTO public."Genres" VALUES ('6b944209-8d8f-4bb9-b74c-956b25514193', 'Management');
INSERT INTO public."Genres" VALUES ('92acdc7b-48f0-4d3b-a3be-27768503c30a', 'Strategy');
INSERT INTO public."Genres" VALUES ('4766c64a-0d72-4c57-acd3-6ec4b72ec70c', 'Military');
INSERT INTO public."Genres" VALUES ('ccf0a939-c765-4e8f-8c6f-d4f65904fd8c', 'Nonfiction');
INSERT INTO public."Genres" VALUES ('51da6f36-3850-462b-bb9f-6044de9a5794', 'Philosophy');
INSERT INTO public."Genres" VALUES ('83c6ed21-b2d6-44e0-b3c5-3ce7aa5054a1', 'Self-improvement');
INSERT INTO public."Genres" VALUES ('fe734d3f-75fc-4521-8e6d-6ff0fa121752', 'Business');
INSERT INTO public."Genres" VALUES ('0aab6125-fbe5-4473-ad80-d19b6e3e9155', 'Military art and science');
INSERT INTO public."Genres" VALUES ('cf5e483a-65b8-4978-99d5-b0c370bfdb36', 'Early works to 1800');
INSERT INTO public."Genres" VALUES ('539dcf39-15bf-4c10-89b1-01a96126488f', 'Steamy');
INSERT INTO public."Genres" VALUES ('99760690-cadc-41b8-9b65-b0ad2a1f32f5', 'Slow burn');
INSERT INTO public."Genres" VALUES ('8754311f-ce7e-49d9-a0e0-63b116f3d5fa', 'Bodyguard romance');
INSERT INTO public."Genres" VALUES ('2bd31b00-4a93-43d5-b74e-bd8d1accbb7a', 'Romantic suspense');
INSERT INTO public."Genres" VALUES ('038be3a5-228d-4355-9bcf-467e8fb882f5', 'Fiction, psychological');
INSERT INTO public."Genres" VALUES ('353b1657-5621-4e69-a089-da1c435102c9', 'Fiction / thrillers / general');
INSERT INTO public."Genres" VALUES ('61fd44c5-ac1d-4831-8b75-0c25b0c249e2', 'Psychotherapy patients');
INSERT INTO public."Genres" VALUES ('dbeb061f-7be5-4a3b-98ec-1c1ea5cb730c', 'Artists');
INSERT INTO public."Genres" VALUES ('0963acf0-3714-4158-b4c7-5d75d279ebd0', 'Family violence');
INSERT INTO public."Genres" VALUES ('3adf0fa9-216b-402c-b9f7-4e5302b18f71', 'Fiction, thrillers, general');
INSERT INTO public."Genres" VALUES ('d8e6b253-ffe3-4cfb-811c-4b65fe5f9a46', 'Marriage, fiction');
INSERT INTO public."Genres" VALUES ('691d1ca1-005b-4c6d-b8e0-0c0b4de96522', 'Artists, fiction');
INSERT INTO public."Genres" VALUES ('6e157f40-090f-4357-9e24-63d15d477583', 'Fiction, thrillers');
INSERT INTO public."Genres" VALUES ('e40103b3-e36f-4ea5-b467-906e90042741', 'Biographers');
INSERT INTO public."Genres" VALUES ('215d1fa0-8d44-4ac9-ae1f-63a847ed2e44', 'Actors and actresses');
INSERT INTO public."Genres" VALUES ('4f185040-3a56-4cee-b3da-6ff9146e86d7', 'Lgbtq novels');
INSERT INTO public."Genres" VALUES ('a96869c5-05b1-4b11-b045-d0d4eb12f704', 'Authorship');
INSERT INTO public."Genres" VALUES ('c17c6c80-11df-4663-8bf2-d7d3d774d0ed', 'Biography');
INSERT INTO public."Genres" VALUES ('50c89f45-14a5-40a5-aab8-6eebd9d5f170', 'Motion picture industry');
INSERT INTO public."Genres" VALUES ('0923a249-6234-483e-bd6f-7e25d5662783', 'Women journalists');
INSERT INTO public."Genres" VALUES ('dd39ca5f-9cc6-457d-852b-57df8c8d001d', 'The elder wand');
INSERT INTO public."Genres" VALUES ('baf4354e-af63-4645-93a6-8f35f000caee', 'Ron');
INSERT INTO public."Genres" VALUES ('2333daf8-3912-43e4-a9f4-d1ebb6b24e58', 'Death eater');
INSERT INTO public."Genres" VALUES ('8cc8e220-f18f-492c-a729-108a5362d457', 'Schools (buildings)');
INSERT INTO public."Genres" VALUES ('8cd685e0-0482-4bc8-9e59-391e30e07275', 'Schools (institutions)');
INSERT INTO public."Genres" VALUES ('7438da5f-e6b4-4b44-942c-8602111ce66e', 'Illusion (performing art)');
INSERT INTO public."Genres" VALUES ('0582574d-1663-41e1-908b-8761ad84b469', 'Quête (littérature)');
INSERT INTO public."Genres" VALUES ('7b020d31-93cd-4fbe-aee9-420252fab61c', 'Méchanceté');
INSERT INTO public."Genres" VALUES ('eac00fe7-92f7-4a41-8619-03f7f2df11df', 'Fictional works');
INSERT INTO public."Genres" VALUES ('427bb752-d92d-4f4e-8864-bb58344778d5', 'Orphans & foster homes');
INSERT INTO public."Genres" VALUES ('349aeb36-2c41-410f-8db6-764d13088535', 'Inglaterra -- ficción juvenil');
INSERT INTO public."Genres" VALUES ('705b8baf-47a5-403a-be5f-b7f2ccd1d0a7', 'England -- fiction');
INSERT INTO public."Genres" VALUES ('8bca394c-e24b-45b7-a56c-815acb4e4884', 'Escuelas -- ficción juvenil');
INSERT INTO public."Genres" VALUES ('8c6aa0be-d4a3-4185-bce5-11f9b6222aa5', 'Magia -- ficción juvenil');
INSERT INTO public."Genres" VALUES ('e36a0ea9-c571-4f3a-a020-65a8be0bf2bb', 'Magos -- ficción juvenil');
INSERT INTO public."Genres" VALUES ('99bd60ef-f9bd-4205-8c67-1b26905b59d9', 'Magic -- fiction');
INSERT INTO public."Genres" VALUES ('7fd0043b-77d4-4182-9370-2825884f96f3', 'Wizards -- fiction');
INSERT INTO public."Genres" VALUES ('4a3ad52f-fc28-4894-966e-5cba6cab895c', 'Boarding schools');
INSERT INTO public."Genres" VALUES ('e1ba4de8-dc24-4599-acbc-2644787633c4', 'Ecoles');
INSERT INTO public."Genres" VALUES ('395948d8-72a5-4503-9b00-3724ca4848ba', 'Roman fantastique');
INSERT INTO public."Genres" VALUES ('4c212020-29b0-43db-ad8c-cc409154b888', 'Sorcellerie');
INSERT INTO public."Genres" VALUES ('606a6749-80af-4256-9ce4-c5882a6ac399', 'Mort');
INSERT INTO public."Genres" VALUES ('160938df-4f6b-46f6-8b80-42fd13be12af', 'Roman pour la jeunesse');
INSERT INTO public."Genres" VALUES ('06341e77-2861-486f-a48b-c528e00d2000', 'Magiciens');
INSERT INTO public."Genres" VALUES ('91232cc1-9681-4d13-8da1-ab3f9c324978', 'Witchcraft');
INSERT INTO public."Genres" VALUES ('3a4567c4-a471-4640-b61b-3a30bae440b2', 'Kids');
INSERT INTO public."Genres" VALUES ('91602e68-83f2-47e5-8092-a46e5f793090', 'Wizardry');
INSERT INTO public."Genres" VALUES ('cd272716-0282-41f3-a2ad-8e393fd4311f', 'Boarding school');
INSERT INTO public."Genres" VALUES ('2534b549-c34c-4d56-883f-6db474f06b2f', 'Children''s literature');
INSERT INTO public."Genres" VALUES ('6de86a13-baba-44bb-a520-a3125b1255a4', 'Children');
INSERT INTO public."Genres" VALUES ('45ab6e4b-5cc2-4d41-aadf-64fffb7223aa', 'Young adult');
INSERT INTO public."Genres" VALUES ('2abea7d1-3125-4539-93e4-0c7c3fd14c4b', 'Foster homes');
INSERT INTO public."Genres" VALUES ('0fff19dc-405d-44d8-ae63-bdc9055cff38', 'Action');
INSERT INTO public."Genres" VALUES ('786ed204-3b06-4cf8-98cf-97ead1594c78', 'Heroics');
INSERT INTO public."Genres" VALUES ('95a79183-733a-49e6-9b05-8d4cd7956d7a', 'Dark magic');
INSERT INTO public."Genres" VALUES ('85575126-651e-4adb-a7f0-5d056216c3f8', 'Novela fantástica');
INSERT INTO public."Genres" VALUES ('02736c4e-11b5-4af4-a0cc-6106854f2619', 'Death');
INSERT INTO public."Genres" VALUES ('e9994875-9a0a-40ed-a243-d128a1d3eabf', 'Dementors');
INSERT INTO public."Genres" VALUES ('f46c5e10-d1a0-418f-b624-de1fedecfd45', 'Secrecy in fiction');
INSERT INTO public."Genres" VALUES ('62206b42-a7e7-4820-bffc-c22faee2f57d', 'Family secrets in fiction');
INSERT INTO public."Genres" VALUES ('f93f455f-bcf2-4bcd-be47-d34e5074c0da', 'Fiction, gay');
INSERT INTO public."Genres" VALUES ('02bae706-fd66-4074-9eb6-f2bebaca28fb', 'Fiction, humorous, general');
INSERT INTO public."Genres" VALUES ('757736ef-7e01-447e-bb7b-30a8e5b1f12b', 'Fiction, lgbtq+, gay');
INSERT INTO public."Genres" VALUES ('af5d3869-94dd-419b-bdd5-5e312be5d8eb', 'Lgbtq romance');
INSERT INTO public."Genres" VALUES ('1269c52e-ee9d-456c-974a-4fc770a07c66', 'Humor');
INSERT INTO public."Genres" VALUES ('99c609de-fdcd-4d97-8f7c-eae2fcee637f', 'Gay men, fiction');
INSERT INTO public."Genres" VALUES ('21c725e3-adda-4800-bbd0-985f0978dc5e', 'Fiction, humorous');
INSERT INTO public."Genres" VALUES ('37f75d3c-5465-4abe-ab7d-b58ff45e667d', 'Suicide');
INSERT INTO public."Genres" VALUES ('1933fc1e-e78f-4707-b357-5d4ec796c2e0', 'Youth');
INSERT INTO public."Genres" VALUES ('86d19aa1-6ebf-4680-8364-f16f54b2dcdd', 'Anxiety');
INSERT INTO public."Genres" VALUES ('d46c814c-8ba7-4f7a-9793-ca9059b4d803', 'Men');
INSERT INTO public."Genres" VALUES ('24df193d-0b33-4ea9-a61e-74e9dff351b1', 'Strong female lead');
INSERT INTO public."Genres" VALUES ('93e1eed0-12e1-46dd-886e-bf62a920a8da', 'Alpha male');
INSERT INTO public."Genres" VALUES ('860834b1-94b8-4bf4-9dee-8050c06ed3df', 'Steamy romance');
INSERT INTO public."Genres" VALUES ('3af3889a-086b-4b38-9016-1634cced1a08', 'Office romance');
INSERT INTO public."Genres" VALUES ('4bfbe8d0-f9af-4bfb-b0b1-80744a7f32d2', 'Beaches');
INSERT INTO public."Genres" VALUES ('10a5a8ff-b7eb-487f-af1e-db9016e0262b', 'Vacations, fiction');
INSERT INTO public."Genres" VALUES ('ed77020f-301a-43d7-9e88-31a4938a8193', 'Summer, fiction');
INSERT INTO public."Genres" VALUES ('6984f997-1898-4226-8e4b-16401adfc780', 'Seashore, fiction');
INSERT INTO public."Genres" VALUES ('43c22f54-89f4-4b53-bea3-7e348f126d2f', 'Sixteen-year-old girls');
INSERT INTO public."Genres" VALUES ('26ff5b33-964c-4d36-8747-4fc20a3fc775', 'Realistic fiction');
INSERT INTO public."Genres" VALUES ('e315eeb9-6e21-46a0-8756-120f2d2661b1', 'Teenage boy/girl');
INSERT INTO public."Genres" VALUES ('0ceb85bb-4289-40a9-a514-c8b4974c801a', 'Teenage girls');
INSERT INTO public."Genres" VALUES ('cc4afd5c-3fbc-4d4c-b718-4e0d3ec10790', 'Vacation homes');
INSERT INTO public."Genres" VALUES ('abca6c73-fa24-4424-9925-fa2c8bc8d5ba', 'Summer');
INSERT INTO public."Genres" VALUES ('57b9e1f2-e25c-4588-9cef-235e29e0e1ec', 'Adventure stories');
INSERT INTO public."Genres" VALUES ('4a0262a8-db8a-47f7-ac3d-e42e6cb7a787', 'Schultheater');
INSERT INTO public."Genres" VALUES ('6d7c5b84-1c17-4c2f-97ce-141d36b6bc2a', 'Hobbits (personnages fictifs)');
INSERT INTO public."Genres" VALUES ('ce44bea2-fdca-4122-9a6a-25c1d1161778', 'Untranslated');
INSERT INTO public."Genres" VALUES ('a84e4872-8c51-4500-a841-336deddcb6a4', 'Fiction, media tie-in');
INSERT INTO public."Genres" VALUES ('891af7c5-2723-47f9-9f8b-a32a14b09626', 'Hobbit (tolkien, j.r.r.)');
INSERT INTO public."Genres" VALUES ('f5628eb2-a220-42e7-9ad8-e689c92d6895', 'Characters');
INSERT INTO public."Genres" VALUES ('a9ed3c11-6c32-4f01-be70-a5a7fd29b7d9', 'Gollum (fictitious character)');
INSERT INTO public."Genres" VALUES ('167c06b6-018b-40b3-b3a3-66785f9e6bd2', 'Dwarfs');
INSERT INTO public."Genres" VALUES ('29e4ca27-c59e-4669-853a-ca57dfd3a451', 'Fantasy in fiction');
INSERT INTO public."Genres" VALUES ('5ad38eab-2547-4fce-94ed-b560fa4e0808', 'Ficción fantástica inglesa');
INSERT INTO public."Genres" VALUES ('e6744dd2-b40b-4ae6-9d62-211e626ba4c1', 'Dragons in fiction');
INSERT INTO public."Genres" VALUES ('f6dae245-1f36-4ef1-99a6-75707b0397a8', 'Toy and movable books');
INSERT INTO public."Genres" VALUES ('7002f150-72b2-4c0e-bbed-7c2f0e2322ea', 'Juvenile fantasy fiction');
INSERT INTO public."Genres" VALUES ('94e31621-1562-4dc4-8821-ce4e3626c355', 'Specimens');
INSERT INTO public."Genres" VALUES ('00599d20-8008-4913-af89-f947e8491675', 'English fantasy fiction');
INSERT INTO public."Genres" VALUES ('abd2955d-a459-4912-a6fd-7e3e2fc6aeb5', 'Teen & young adult literature');
INSERT INTO public."Genres" VALUES ('f7b7b613-4baa-49f8-9169-f2689b3019a9', 'Media tie-in');
INSERT INTO public."Genres" VALUES ('44856dcf-a680-4b84-bf79-098d8acd9402', 'Juvenile fantasy');
INSERT INTO public."Genres" VALUES ('0ea5aaa2-31ad-4350-834f-d5bbb90abc49', 'The one ring');
INSERT INTO public."Genres" VALUES ('2c1892a0-6e78-414e-8303-73bbab220455', 'Giant spiders');
INSERT INTO public."Genres" VALUES ('74f2acd2-b5de-4bc9-b588-e5ab6f0be0d9', 'Goblins');
INSERT INTO public."Genres" VALUES ('207d43c0-c24b-468f-9ef6-444f3ef252b2', 'Trolls');
INSERT INTO public."Genres" VALUES ('972d92b4-8618-48d1-9783-739070e221d8', 'Elves');
INSERT INTO public."Genres" VALUES ('aa1aafea-7154-4ab4-bb34-4b74d282220d', 'Dwarves');
INSERT INTO public."Genres" VALUES ('fa6b27e6-35f7-4251-b746-08651f47dbe8', 'Hobbits');
INSERT INTO public."Genres" VALUES ('85358e03-19b9-477f-8975-1f8685b023ec', 'Eagles');
INSERT INTO public."Genres" VALUES ('81542434-c012-4352-b81c-413e95b99c95', 'Thrushes');
INSERT INTO public."Genres" VALUES ('41bd0bb3-29f4-48eb-8ca6-a1c9a03d5d1b', 'Invisibility');
INSERT INTO public."Genres" VALUES ('594a6d50-dc70-46b4-aaad-79d65c9c513a', 'Battle of five armies');
INSERT INTO public."Genres" VALUES ('e2538288-cee0-40d9-af5a-fbd79d0ffdb4', 'Arkenstone');
INSERT INTO public."Genres" VALUES ('f7fb79af-2fcc-46fc-9ef5-dd6f064b978a', 'Drum machine');
INSERT INTO public."Genres" VALUES ('90d0e6c2-a1e4-49ee-98bf-c3f124296172', 'Commerce');
INSERT INTO public."Genres" VALUES ('e4ab899e-816c-4451-8e33-b704c411b6c2', 'Taxation');
INSERT INTO public."Genres" VALUES ('09641f85-c0d8-40ca-aec3-def4c159c5c7', 'Shipping');
INSERT INTO public."Genres" VALUES ('3ddcabfc-2e14-4611-893d-ce4bdcd3937b', 'Courts ect.');
INSERT INTO public."Genres" VALUES ('eca667a6-7f65-4e59-a7dd-61824ae65b31', 'Faerie');
INSERT INTO public."Genres" VALUES ('74e0ec53-ddf7-469e-a76c-b4fdf4ef317f', 'Magi');
INSERT INTO public."Genres" VALUES ('05d83a27-ecc3-444b-a901-e9a12782ccd7', 'Kärlek');
INSERT INTO public."Genres" VALUES ('c40de2eb-0201-4584-9041-d4e51de65fde', 'Älvor');
INSERT INTO public."Genres" VALUES ('2dbd0ae4-8205-4ea0-9dac-005ceb479b3e', 'Children''s audiobooks');
INSERT INTO public."Genres" VALUES ('d954f60d-b8f7-46f7-b6fc-91ddb06da0f2', 'Memory -- fiction');
INSERT INTO public."Genres" VALUES ('c1868189-aff7-43ec-9f3f-9fa4823c08b3', 'Male friendship -- fiction');
INSERT INTO public."Genres" VALUES ('243b2f77-73ec-4526-96f3-4c1093315b03', 'Homosexuels masculins');
INSERT INTO public."Genres" VALUES ('9faa5813-7b13-4be0-b932-019388e86dd9', 'Gay men');
INSERT INTO public."Genres" VALUES ('fca842cf-36b3-41de-9275-ebfb3188d976', 'New york (n.y.), fiction');
INSERT INTO public."Genres" VALUES ('1d389d6e-a102-4285-a42c-fc698d2aa3ec', 'Familias');
INSERT INTO public."Genres" VALUES ('5566cd04-d2e7-4967-8a59-67bf84312f51', 'Memoria');
INSERT INTO public."Genres" VALUES ('67e38b60-4bc8-44a7-889f-ee1f6299050b', 'Male friendship');
INSERT INTO public."Genres" VALUES ('430a2f8b-9e9d-4b98-a011-456948ec7cce', 'Fiction / sagas');
INSERT INTO public."Genres" VALUES ('b1b85744-91ec-4476-a880-6b42b23ab3ca', 'Fiction / coming of age');
INSERT INTO public."Genres" VALUES ('f869315b-27c5-4390-9f6d-05353bc4409c', 'Memory');
INSERT INTO public."Genres" VALUES ('af9e17f0-3339-42ff-9581-45c6e793f3ed', 'Dysfunctional families');
INSERT INTO public."Genres" VALUES ('c9874d83-654d-46ab-bdf9-3f38505abc6c', 'Child abuse');
INSERT INTO public."Genres" VALUES ('5ba29d02-afa9-4024-b3e1-6d7b9c2cf28c', 'Sagas');
INSERT INTO public."Genres" VALUES ('1ab4bb4d-12e9-4d2f-99a4-045be9543b4d', 'Attitude to death');
INSERT INTO public."Genres" VALUES ('3b96aecc-5cde-4ea3-8461-5aca9bfc6176', 'Thyroid neoplasms');
INSERT INTO public."Genres" VALUES ('8e07786f-ace8-46d2-9368-39cd9c6cb77f', 'Cancer--young adult fiction');
INSERT INTO public."Genres" VALUES ('14998d73-dcb4-4cbe-99e7-480da6f5f72f', 'Sick young adult fiction');
INSERT INTO public."Genres" VALUES ('6b3709c4-e8cd-4c1d-b559-033ff8171bc4', 'Death & dying');
INSERT INTO public."Genres" VALUES ('4911e7cc-f763-454a-998d-c939a106aeb9', 'Neoplasms');
INSERT INTO public."Genres" VALUES ('2856a193-de64-4983-b9a4-2b5d5869e669', 'Self-esteem & self-reliance');
INSERT INTO public."Genres" VALUES ('a579f279-d662-41c5-9bb3-2b2f7c71baad', 'Adolescent');
INSERT INTO public."Genres" VALUES ('ab98f2be-fe42-45f9-865a-01f950978921', 'Ficcion juvenil');
INSERT INTO public."Genres" VALUES ('16075e32-e239-4d7d-8159-285605fa0c49', 'Enfermos terminales');
INSERT INTO public."Genres" VALUES ('c974d70e-3456-49d6-9779-bce6f0cc3f64', 'Eye cancer');
INSERT INTO public."Genres" VALUES ('d5a6c453-f9d6-4069-84fd-66689489b3c7', 'Osteosarcoma');
INSERT INTO public."Genres" VALUES ('60c24b10-7392-46e6-be98-c098e4490a62', 'Jeunesse');
INSERT INTO public."Genres" VALUES ('680da8a8-93e4-4770-a205-74a406f922e0', 'Médecins');
INSERT INTO public."Genres" VALUES ('0197ffee-ab15-45c0-9107-1d60d7e67510', 'Morale pratique');
INSERT INTO public."Genres" VALUES ('947587db-a60a-4b07-ba78-f52c239e4c3c', 'Malades en phase terminale');
INSERT INTO public."Genres" VALUES ('2711f5ad-6683-4a64-a724-c3b01173924c', 'Cancer chez l''adolescent');
INSERT INTO public."Genres" VALUES ('eb0698c5-64ee-4983-809c-085203e35fb8', 'Patients');
INSERT INTO public."Genres" VALUES ('ffaeccb7-24ca-4f39-8e84-f805616b40d2', 'Cáncer');
INSERT INTO public."Genres" VALUES ('2335f487-d8ed-4e63-833a-1c78eb2917ab', 'Niños');
INSERT INTO public."Genres" VALUES ('711f5dc6-3cd9-4e21-a019-22189658a17b', 'Niños moribundos');
INSERT INTO public."Genres" VALUES ('11ef4946-71fb-4ecb-80bb-e7f80e7f9bc6', 'Cancer in children');
INSERT INTO public."Genres" VALUES ('cd0c42af-7315-49f9-8f67-0722fece4e92', 'Self-help groups');
INSERT INTO public."Genres" VALUES ('75e71e3f-da54-487d-b184-5c4d089ecc83', 'Chez l''enfant');
INSERT INTO public."Genres" VALUES ('55c2d220-a1c2-4de2-aaa7-cae674c820cc', 'Histoires d''amour');
INSERT INTO public."Genres" VALUES ('dad52c13-cec3-4276-98f9-e90dc96fea4c', 'Cancéreux');
INSERT INTO public."Genres" VALUES ('8d9a2343-2cbf-4b94-8dd6-739362d229e6', 'Physicians');
INSERT INTO public."Genres" VALUES ('7121270d-8bd6-42f6-80f8-cc611b39671d', 'Sick');
INSERT INTO public."Genres" VALUES ('c0713a58-0573-496d-8d3a-071cac3c39e6', 'Conduct of life');
INSERT INTO public."Genres" VALUES ('805418e9-05f4-4346-ad07-37f024be2f64', 'Terminally ill children');
INSERT INTO public."Genres" VALUES ('4cf94467-9d46-4187-9fa7-3614a7d5b196', 'Cancer in adolescence');
INSERT INTO public."Genres" VALUES ('e171a851-8117-4175-ba34-729cf7a28e52', 'Cancer, fiction');
INSERT INTO public."Genres" VALUES ('f91be8c4-de1f-4b97-b4e6-dbf072b40963', 'Terminally ill');
INSERT INTO public."Genres" VALUES ('bbb70d64-c35d-467d-bd71-6153c4ae98fd', 'Cancer');
INSERT INTO public."Genres" VALUES ('51096f73-c31d-40f6-8b23-d0a1ea4035c0', 'Love—fiction');
INSERT INTO public."Genres" VALUES ('3b238394-46ce-4358-89b4-3bc3197276a1', 'Terminally ill—fiction');
INSERT INTO public."Genres" VALUES ('b44948fb-189a-487f-a37e-6e1cafd483fe', 'Cancer—fiction');
INSERT INTO public."Genres" VALUES ('9f98e51d-e678-47de-87a9-dbe04e2b355a', 'Slavery');
INSERT INTO public."Genres" VALUES ('45910fcd-7b80-4af9-b010-9344636f48af', 'Trafficking');
INSERT INTO public."Genres" VALUES ('3063c2fc-5e54-411c-8a3f-b3a0b2b6e9cc', 'Blood play');
INSERT INTO public."Genres" VALUES ('45e3b7fa-45f6-4e93-a228-383b8436fe63', 'Scars');
INSERT INTO public."Genres" VALUES ('61c09177-7541-4747-82a1-7e05d82c9e6c', 'Possessive hero');
INSERT INTO public."Genres" VALUES ('473633d3-5fae-4a8e-ab46-5fae41d5b265', 'Tortured heroine');
INSERT INTO public."Genres" VALUES ('544b4544-4fc3-45dc-a4fb-21117113a506', 'Dual pov');
INSERT INTO public."Genres" VALUES ('a2c12519-26ae-4fe7-ae8d-f45fff1426f7', 'Abduction');
INSERT INTO public."Genres" VALUES ('41c3f6fe-a0de-42f1-b3c5-574a3f4f4074', 'Witches and warlocks');
INSERT INTO public."Genres" VALUES ('eee68e83-f24e-464b-927c-ce45c499723a', 'Joung adults');
INSERT INTO public."Genres" VALUES ('7676e18d-3f79-4272-a0d1-e58de68d9991', 'Troldmænd');
INSERT INTO public."Genres" VALUES ('a4deba97-47c0-4490-b1af-0e3a4fb5c04c', 'Eventyrlige fortællinger');
INSERT INTO public."Genres" VALUES ('6ba48f42-90d1-44b1-84a6-4639da3837da', 'Magic - fiction');
INSERT INTO public."Genres" VALUES ('3bd09897-4af9-4b0d-a6eb-d27c1a1d263a', 'Coming of age - fiction');
INSERT INTO public."Genres" VALUES ('769d3074-f260-44d5-a52d-80c964a94c0a', 'Schools - fiction');
INSERT INTO public."Genres" VALUES ('a0200d9c-31bc-4cd9-b9f9-688ffa37fc7e', 'Hate');
INSERT INTO public."Genres" VALUES ('c1c7e4d6-18ec-4ad5-98e5-76e2f3831fdc', 'Imaginärer schauplatz');
INSERT INTO public."Genres" VALUES ('267d9135-9290-475e-835a-3f18ae8ece78', 'Außenseiter');
INSERT INTO public."Genres" VALUES ('5ce6f606-f553-4125-a424-6d6afca78bb1', 'Teacher-student relationships');
INSERT INTO public."Genres" VALUES ('504a9a21-b597-4a80-b3aa-679ac9b2de2d', 'Dueling');
INSERT INTO public."Genres" VALUES ('e1e3a89c-0513-429e-89ba-7230337bf9d9', 'Das gute');
INSERT INTO public."Genres" VALUES ('bf83e135-b142-474d-97d5-f2834414d1e8', 'Telepathie');
INSERT INTO public."Genres" VALUES ('1f945f71-0d8c-4dd6-a52f-0422733e4edd', 'Jugendgruppe');
INSERT INTO public."Genres" VALUES ('a4fb1bf8-c31a-462a-a571-5651fa5a99da', 'Rollentausch');
INSERT INTO public."Genres" VALUES ('e06758e4-5c24-455a-85f2-8ebbcdebd5ec', 'Freundschaft');
INSERT INTO public."Genres" VALUES ('ef815797-86d1-440d-ae10-87cea8dd6093', 'Schüler');
INSERT INTO public."Genres" VALUES ('244bf6ed-686e-4662-b7fd-c2e4f4c1b8ee', 'Lebensgefahr');
INSERT INTO public."Genres" VALUES ('012552cd-7fde-4942-966a-e1c18465ce90', 'Das böse');
INSERT INTO public."Genres" VALUES ('2fac1d3e-9012-424b-8663-6dc71e4a03b6', 'Parapsychology');
INSERT INTO public."Genres" VALUES ('e49ddbf5-03a4-4226-87a8-6633beae6883', 'Military aspects');
INSERT INTO public."Genres" VALUES ('458764ec-e641-4b4d-ab3c-9e86827f816f', 'Boarding school students');
INSERT INTO public."Genres" VALUES ('a16e3c6f-76e0-49c7-b039-83e127247d67', 'Existenzkampf');
INSERT INTO public."Genres" VALUES ('9b9567b1-8eb9-4369-98e1-409b5f54c754', 'Weissagung');
INSERT INTO public."Genres" VALUES ('680f309e-beea-42f9-abf1-d0ec87f69513', 'Internat');
INSERT INTO public."Genres" VALUES ('93aed9b2-2910-467b-9dae-f9ec1f5be502', 'Lebensrettung');
INSERT INTO public."Genres" VALUES ('406de749-dbff-488c-be87-1ecee0932e44', 'Arabic language materials');
INSERT INTO public."Genres" VALUES ('fc53b19b-dc69-4a04-82cc-17a6a5c33c9f', 'Sorciaeres');
INSERT INTO public."Genres" VALUES ('5edfb64d-b024-4100-860f-5b3fded96793', '{acute}ecoles');
INSERT INTO public."Genres" VALUES ('895e54fb-b36f-49ea-aac8-fefdfbeeeaff', 'Political satire');
INSERT INTO public."Genres" VALUES ('953331a8-b2cb-4ec8-af1b-124af191fee5', 'Regensburg');
INSERT INTO public."Genres" VALUES ('1ee31537-b6f5-43c1-9b35-8e97af70d5fc', 'Allegories');
INSERT INTO public."Genres" VALUES ('06238e54-816b-46b2-9ca9-0b7fb5bcef4e', 'In literature');
INSERT INTO public."Genres" VALUES ('d639df18-f98c-45ac-9138-ca38414ce717', 'Animaux domestiques');
INSERT INTO public."Genres" VALUES ('8536f628-39d1-4d64-a6d3-589ee3b2c897', 'Politique-fiction');
INSERT INTO public."Genres" VALUES ('91546b63-235c-41fc-9793-9d04b389312d', 'Skönlitteratur');
INSERT INTO public."Genres" VALUES ('39aec451-86fb-4917-a324-35571ff7ed5e', 'Englischunterricht');
INSERT INTO public."Genres" VALUES ('7b88fb8b-a829-46ea-8b95-0d6d0fbc0f62', 'Political corruption');
INSERT INTO public."Genres" VALUES ('021348eb-a00c-4267-be7d-21381e2c341e', 'Livestock');
INSERT INTO public."Genres" VALUES ('20745054-b8b1-4877-af12-2157e46c6537', 'Farms');
INSERT INTO public."Genres" VALUES ('b3602001-5772-425c-bbd6-ad23e625feaa', 'Power (social sciences)');
INSERT INTO public."Genres" VALUES ('38c46bc3-737d-42a9-b21f-afabe2c86e6d', 'Animals');
INSERT INTO public."Genres" VALUES ('b6d19174-7924-4fc5-8d03-1c235e16ec74', 'Animals in literature');
INSERT INTO public."Genres" VALUES ('71748651-003d-4d32-953b-47574c13ef9e', 'Animales domésticos');
INSERT INTO public."Genres" VALUES ('ba98e4bc-5c03-4e9d-a412-8f6ae19436df', 'English political satire');
INSERT INTO public."Genres" VALUES ('6416b625-2553-4f8f-a36c-200cf2ec3f1b', 'Lectures et morceaux choisis');
INSERT INTO public."Genres" VALUES ('411fbf45-327d-400c-8d43-ae98358b344b', 'Zhong pian xiao shuo');
INSERT INTO public."Genres" VALUES ('d1903e2d-d764-4bb2-95de-6b99db78fdb1', 'Domestic animals');
INSERT INTO public."Genres" VALUES ('02ec6670-296b-48a2-b907-1c3fe8a1b5c6', 'Behavior, fiction');
INSERT INTO public."Genres" VALUES ('1291a351-c0f5-44df-b4d7-bb8f92eaefdc', 'Animals, fiction');
INSERT INTO public."Genres" VALUES ('31fbefac-aa56-4213-abab-b2ab0d362b54', 'Fiction, satire');
INSERT INTO public."Genres" VALUES ('907ddade-4fab-4def-88cf-63ee11ce5249', 'Animal drama');
INSERT INTO public."Genres" VALUES ('596750ad-4896-4f1c-b03b-0d80c0bcd113', 'Classic');
INSERT INTO public."Genres" VALUES ('aa07364c-6256-4fcc-b1b0-467000cba389', 'French fiction');
INSERT INTO public."Genres" VALUES ('66ac7858-ade7-4ecb-aaae-e23efe1f06a0', 'Pop-up books');
INSERT INTO public."Genres" VALUES ('92e199fb-2826-4ff4-9a9c-897903eb02af', 'Children''s stories, turkish');
INSERT INTO public."Genres" VALUES ('c20c56c5-610f-45c1-96c4-1ef334b4b84d', 'Translations into turkish');
INSERT INTO public."Genres" VALUES ('33c9626a-735b-440c-afa0-b5f61fb3e8d9', 'Translations into german');
INSERT INTO public."Genres" VALUES ('945fae28-677d-4397-b155-bf11745bb3bc', 'Translations into yiddish');
INSERT INTO public."Genres" VALUES ('9dbc320f-0170-47e0-b62a-dd2f57e929e8', 'French fantasy fiction');
INSERT INTO public."Genres" VALUES ('4936294c-1215-4ccd-b10d-a0c707879d8b', 'Fiction - general');
INSERT INTO public."Genres" VALUES ('31c7f713-afb2-4146-af79-27fe5ba2127e', 'Planets');
INSERT INTO public."Genres" VALUES ('24e87472-17c4-4a7b-aba7-4ad387834ef7', 'Juvenile films');
INSERT INTO public."Genres" VALUES ('fd2ab3e4-ed11-4cd1-8403-a0cf6240442e', 'Extraterrestrial beings');
INSERT INTO public."Genres" VALUES ('07e0e56f-99b2-41bb-8c32-26875583e221', 'Short novel');
INSERT INTO public."Genres" VALUES ('3d66f004-fa63-44db-9421-23a7a662fd0a', 'Translations into english');
INSERT INTO public."Genres" VALUES ('17f5ddf7-e527-4928-8e7d-c123794d2c48', 'Children''s literature, french');
INSERT INTO public."Genres" VALUES ('e18a9ddf-c57d-43a2-bf27-71f5262f31f9', 'Deserts');
INSERT INTO public."Genres" VALUES ('51c9bb03-fdf6-4651-819b-d83989f213d8', 'Foxes');
INSERT INTO public."Genres" VALUES ('8eebfcc8-c3be-4384-9292-be0299e8b5dd', 'Legends');
INSERT INTO public."Genres" VALUES ('06a88466-abae-4538-885b-aa75ebae0f5c', 'Juvenile');
INSERT INTO public."Genres" VALUES ('460eec26-7295-437a-a2b3-9e753b29c422', 'Deaf children');
INSERT INTO public."Genres" VALUES ('743afa82-3bc1-4348-8562-544465217874', 'Novela fantástica');
INSERT INTO public."Genres" VALUES ('18e879af-f43d-4708-acf4-94485068d6b9', 'Cuentos de hadas');
INSERT INTO public."Genres" VALUES ('e1c9c4c5-2825-4fb2-b34e-903104981c3c', 'Príncipes -- novela juvenil');
INSERT INTO public."Genres" VALUES ('f9844933-9c1d-4c18-af9c-633008454f08', 'Princes -- juvenile fiction');
INSERT INTO public."Genres" VALUES ('b6ae3a21-ec54-440c-8788-b4cb0751c6a3', 'Príncipes');
INSERT INTO public."Genres" VALUES ('77d212fa-3e49-4f4f-b56d-bf2bad3add4b', 'Fantasmes');
INSERT INTO public."Genres" VALUES ('c44e9602-4900-4a58-a17f-f9dc2ce00782', 'Asteroids');
INSERT INTO public."Genres" VALUES ('905aa81b-42a5-400c-ad3a-6330e8372ad8', 'Pride and vanity');
INSERT INTO public."Genres" VALUES ('7008fc79-c327-436b-a595-518dcfad5de9', 'Children''s stories, french');
INSERT INTO public."Genres" VALUES ('f0fdf179-7bad-47da-a9ef-83abb8ba1cfd', 'Travel, fiction');
INSERT INTO public."Genres" VALUES ('0fb9f19a-4cb1-4afc-a410-b24112a77ebb', 'French language, readers');
INSERT INTO public."Genres" VALUES ('1c5eefe6-2e57-45a1-a199-5730bbe3c062', 'Fairy tales');
INSERT INTO public."Genres" VALUES ('9a6f8d92-f4e3-4af8-aeed-ebcffc98ad8d', 'Loneliness');
INSERT INTO public."Genres" VALUES ('1463a20b-699e-4747-ae32-9614110cae74', 'Loss');
INSERT INTO public."Genres" VALUES ('ad70cb6d-13f7-4205-b827-30cb87038fd1', 'Childhood');
INSERT INTO public."Genres" VALUES ('205ef3c1-3853-4d75-9120-3e665cba80c7', 'Mechanical hound');
INSERT INTO public."Genres" VALUES ('749cf7f2-ebad-4f34-b532-e2c905d0b1be', '813/.54');
INSERT INTO public."Genres" VALUES ('c4613ea6-98b9-4be0-94fb-2ad76c7faa13', 'Ps3503.r167 f3 2012');
INSERT INTO public."Genres" VALUES ('4d0d1975-0f27-4ef0-8e00-b77788c5983e', 'Censorship--fiction');
INSERT INTO public."Genres" VALUES ('5025f731-83b7-4e6e-b5e4-544966091f92', 'Book burning--fiction');
INSERT INTO public."Genres" VALUES ('c17cfe55-9af8-4f0a-a21b-c43c14660301', 'Science fiction, american');
INSERT INTO public."Genres" VALUES ('c544958d-040f-428a-8920-ffd44682b1c8', 'Language arts');
INSERT INTO public."Genres" VALUES ('b6459003-28ba-468a-a35e-c11d73e202d6', 'Education');
INSERT INTO public."Genres" VALUES ('548c9fa0-ce09-4116-8b58-bf0aac121f20', 'Zhang pian xiao shuo');
INSERT INTO public."Genres" VALUES ('a9e13c08-cecb-4c72-a20f-4141bb555de2', 'Autodafé de livres');
INSERT INTO public."Genres" VALUES ('2e04e8af-af45-451d-ab2a-8c60b94136aa', 'Terrorisme d''état');
INSERT INTO public."Genres" VALUES ('42b1e28f-4f30-4ae4-8b56-05bcc609ba2b', 'Bücherverbrennung');
INSERT INTO public."Genres" VALUES ('16fa7aed-5df3-48cf-9c22-e331ebf7af4d', 'Totalitarianisms');
INSERT INTO public."Genres" VALUES ('86774d7b-9bda-4e25-a5c3-aaaed3a6b1b1', 'Terrorismo');
INSERT INTO public."Genres" VALUES ('396056f8-ff81-428c-b7d2-70d5c18f3ae0', 'Award:retro_hugo');
INSERT INTO public."Genres" VALUES ('ffae25bf-449f-4f4a-97fb-6ebd2a3a2f4e', 'Terrorism');
INSERT INTO public."Genres" VALUES ('6ddc74d4-51f5-4b97-b62e-7e5034b9c53d', 'American science fiction');
INSERT INTO public."Genres" VALUES ('1434329f-664a-4d3f-8738-1f8b7d4d24e6', 'Book burning');
INSERT INTO public."Genres" VALUES ('1bfc8eb4-cd99-403d-bcfb-67ca266ce5b2', 'State-sponsored terrorism');
INSERT INTO public."Genres" VALUES ('93ba62dc-4001-4840-81ff-1c741b7a4c4d', 'Censura');
INSERT INTO public."Genres" VALUES ('3cd233c3-4107-414a-a662-c03f929a3083', 'Terrorismo estatal');
INSERT INTO public."Genres" VALUES ('3114fc7c-38ec-4e94-88e7-7d50acc9fe53', 'Girl next door');
INSERT INTO public."Genres" VALUES ('cab3f6c5-96a1-48aa-8528-67d307b96723', 'Farm life');
INSERT INTO public."Genres" VALUES ('5a87ce25-b34c-443a-9da1-d17df3b075b4', 'Crianã§a');
INSERT INTO public."Genres" VALUES ('a503563e-285e-42a4-b893-a8d601f0d4e0', 'Newbery honor book');
INSERT INTO public."Genres" VALUES ('be4ac263-0323-4aec-87bb-21cb563a6273', 'Children''s stories, italian');
INSERT INTO public."Genres" VALUES ('2c2c26c9-f8a5-46c1-a005-71172d3af1e2', 'Newbery medal');
INSERT INTO public."Genres" VALUES ('b56f73b4-efab-4c0a-aeca-b8e3f208ba9e', 'Tong hua');
INSERT INTO public."Genres" VALUES ('78c411f8-e4ab-4ab8-85c0-74ddafaf77ad', 'Araignées');
INSERT INTO public."Genres" VALUES ('2a5e2f89-65b8-4de8-8260-a8fb12a71c1b', 'Exploitations agricoles');
INSERT INTO public."Genres" VALUES ('4956708c-bc25-4367-93b4-3c8cb8a80d86', 'Porcs');
INSERT INTO public."Genres" VALUES ('1e53eb7e-d549-48c4-8f90-832711b2d71f', 'Authors, juvenile literature');
INSERT INTO public."Genres" VALUES ('f9967296-c11c-4c7d-9e98-64f2a4eae325', 'Insects, fiction');
INSERT INTO public."Genres" VALUES ('afa55b48-4bc8-4dc8-8e57-95502d23eae9', 'Pets, fiction');
INSERT INTO public."Genres" VALUES ('1914da5c-2149-4e88-83e5-9b7bf9557627', 'French language materials');
INSERT INTO public."Genres" VALUES ('3b023a47-2b1e-4a7c-a6a3-dc92c046df92', 'Materiales en español');
INSERT INTO public."Genres" VALUES ('f9a958db-e2d1-4033-b3bb-388432128840', 'Stories');
INSERT INTO public."Genres" VALUES ('19e7bb6b-c2c4-4369-b3bb-61a1e56e0d88', 'Swans');
INSERT INTO public."Genres" VALUES ('81044bb1-07a9-4899-a053-63131eb36bac', 'Mice');
INSERT INTO public."Genres" VALUES ('c34e0df6-a40e-4acf-b441-6ec208d16bab', 'Trumpeter swan');
INSERT INTO public."Genres" VALUES ('bb9b61af-ca90-42bd-abd0-833d7027139d', 'Farm life, fiction');
INSERT INTO public."Genres" VALUES ('3fe28cf8-9f8e-44a6-aba2-6e564951287d', 'Domestic animals, fiction');
INSERT INTO public."Genres" VALUES ('a7745e13-8a3a-4f2f-b26a-ce7b580ecdb7', 'Pigs, fiction');
INSERT INTO public."Genres" VALUES ('9b863328-3153-4c01-80b5-41ae8835d83d', 'Spiders, fiction');
INSERT INTO public."Genres" VALUES ('13d61bf8-1c12-4e1c-9770-75bff4bae4c8', 'Newbery honor');
INSERT INTO public."Genres" VALUES ('f087508b-9b83-4945-a946-b3415f803e9a', 'Award winning books');
INSERT INTO public."Genres" VALUES ('a9d61075-8957-4823-bd7f-2c041b34d656', 'Spanish stories');
INSERT INTO public."Genres" VALUES ('b2f8aa73-6050-4da6-8b86-ce9f1431b9e2', 'English');
INSERT INTO public."Genres" VALUES ('ccc4809c-a972-4002-97cb-efa9014ce255', 'Korean language materials');
INSERT INTO public."Genres" VALUES ('6217af07-943f-47eb-83bc-3df759c5902c', 'Vida agrícola');
INSERT INTO public."Genres" VALUES ('8069a18d-693d-4b60-a693-e7be3378c462', 'Arañas');
INSERT INTO public."Genres" VALUES ('0c79b356-75cf-4e09-b8c0-d4bd438f7e72', 'Cerdos');
INSERT INTO public."Genres" VALUES ('f6bc5474-ddae-4c37-9c15-2a49628a7e6d', 'American farm life');
INSERT INTO public."Genres" VALUES ('70f7c8f8-3384-49cf-8e91-79cc1c20ddcf', 'Folklore');
INSERT INTO public."Genres" VALUES ('5f787e48-142e-4ad7-b0a8-e3396ffd41ee', 'Pigs');
INSERT INTO public."Genres" VALUES ('ede3297c-9c56-4faa-be60-c85cbc202d34', 'Pets');
INSERT INTO public."Genres" VALUES ('4e839033-55e1-4062-a808-50246de7eae2', 'Swine');
INSERT INTO public."Genres" VALUES ('976271cf-18de-4833-ab83-a66fff272132', 'Spiders');
INSERT INTO public."Genres" VALUES ('d3e2980e-8f9e-4f17-a789-113d970d8593', 'Trojan war');
INSERT INTO public."Genres" VALUES ('b0e6e7d9-e7d6-4c88-a605-c9fa7aef6bab', 'Gay fiction');
INSERT INTO public."Genres" VALUES ('a324162b-fc37-48e9-8d96-c9ddf9f2197d', 'Guerre de troie');
INSERT INTO public."Genres" VALUES ('857c8a88-73eb-476a-baab-b2c249ccf49e', 'Amitié masculine');
INSERT INTO public."Genres" VALUES ('9d25da3c-05f7-46b5-b3c2-0896974a9c16', 'Stonewall book awards');
INSERT INTO public."Genres" VALUES ('a1ddc63b-fe60-4267-914b-594b377ea2a6', 'Lgbtq historical fiction');
INSERT INTO public."Genres" VALUES ('fd957e12-8b88-4dd4-af25-e8a30941ad66', 'Fiction, war & military');
INSERT INTO public."Genres" VALUES ('004ef4b3-7a52-471f-9490-839ef6cf854e', 'Fiction, historical');
INSERT INTO public."Genres" VALUES ('a0170595-ec26-4bf6-aa86-d1be427c359d', 'Greeks');
INSERT INTO public."Genres" VALUES ('74fdb84c-a78f-4954-863c-2f485960a9bc', 'Thetis');
INSERT INTO public."Genres" VALUES ('689bedf2-a419-4161-b240-c2addb25f384', 'Gay love');
INSERT INTO public."Genres" VALUES ('9e64f8ae-8ec5-4b0b-aec4-bf45aeb5418c', 'Achilles (greek mythology)');


--
-- TOC entry 3491 (class 0 OID 17247)
-- Dependencies: 224
-- Data for Name: HaveReadIt; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."HaveReadIt" VALUES ('e9de1729-4c08-47df-b1e9-6516d6189047', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:11:04.723');
INSERT INTO public."HaveReadIt" VALUES ('8e0697bd-2c9e-4e9c-8c11-bd8f76c26863', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:12:58.064');
INSERT INTO public."HaveReadIt" VALUES ('b9f573b2-3ed0-452c-8587-9acfb09f2d4d', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:13:57.857');
INSERT INTO public."HaveReadIt" VALUES ('eb538d72-eacf-44e4-bd9e-62371f8bf80b', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:14:33.372');
INSERT INTO public."HaveReadIt" VALUES ('d615bb98-76aa-41af-9115-65fefff0fbbc', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:14:51.741');
INSERT INTO public."HaveReadIt" VALUES ('b3569041-341f-40af-ad76-b3f813e75705', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:14:58.13');
INSERT INTO public."HaveReadIt" VALUES ('17686e7d-81b0-4fa5-81ca-c050eaf7f1e2', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:15:56.861');
INSERT INTO public."HaveReadIt" VALUES ('06cf1fd4-1a33-4a8c-b3ee-2cca026f9c3b', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:16:07.864');
INSERT INTO public."HaveReadIt" VALUES ('be8ef8ce-11e9-40ef-acf9-bc183c8ad7aa', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:17:21.516');
INSERT INTO public."HaveReadIt" VALUES ('3333a215-efdf-4098-82a0-b2141fe991f4', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:17:34.966');
INSERT INTO public."HaveReadIt" VALUES ('2671398d-6c21-4248-9b05-aab66c71e60b', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:18:45.958');
INSERT INTO public."HaveReadIt" VALUES ('f6e5bb70-3609-482f-ab94-57d90365ec0d', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:19:24.835');
INSERT INTO public."HaveReadIt" VALUES ('2296f027-c2b3-4868-985d-1aef9b42c8db', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:20:32.116');
INSERT INTO public."HaveReadIt" VALUES ('ad8ddd18-b258-4209-8a03-38db3968b273', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:21:52.698');
INSERT INTO public."HaveReadIt" VALUES ('771b828f-0f3a-4037-a22f-217d60cb0d92', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:23:17.078');
INSERT INTO public."HaveReadIt" VALUES ('b24378ce-158c-4625-8d62-4249aa9a48d1', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:23:38.398');
INSERT INTO public."HaveReadIt" VALUES ('0f84dc2c-4251-484d-8122-087acc1554c6', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:23:47.08');
INSERT INTO public."HaveReadIt" VALUES ('3371ee84-0dc5-491e-b09d-143ca7b26af7', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:24:08.047');
INSERT INTO public."HaveReadIt" VALUES ('ca24c593-fe29-426d-83eb-6c887a6cf5c7', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:24:46.221');
INSERT INTO public."HaveReadIt" VALUES ('7b2fdbf8-459a-4ff7-8398-1cdedde3ec1a', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:25:40.787');
INSERT INTO public."HaveReadIt" VALUES ('85c702fa-c26c-4776-b81b-9f68f2ee742b', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:25:57.362');
INSERT INTO public."HaveReadIt" VALUES ('7d742e72-7571-4320-a512-4b349de577cc', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:26:37.517');
INSERT INTO public."HaveReadIt" VALUES ('571f285a-da03-416a-a1c2-1a73ff06cbaf', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:27:23.736');
INSERT INTO public."HaveReadIt" VALUES ('9f5cf819-2558-4164-82fc-8984ec9360bc', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:27:42.698');
INSERT INTO public."HaveReadIt" VALUES ('06a94a04-393d-4913-953d-b4522bd66338', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:29:18.948');
INSERT INTO public."HaveReadIt" VALUES ('f1e1a9d7-7902-46cf-9a06-900d41e75c1c', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:29:40.87');
INSERT INTO public."HaveReadIt" VALUES ('3c0a92c0-156d-4728-917c-70440f63df4b', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:29:44.573');
INSERT INTO public."HaveReadIt" VALUES ('a12f52a0-a6c8-4af0-84ed-3ac60677abc0', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:29:49.828');
INSERT INTO public."HaveReadIt" VALUES ('dd3e87f4-ecfc-4f30-9493-74ec7eac7e97', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:29:56.583');
INSERT INTO public."HaveReadIt" VALUES ('dadf5c14-af12-4f1a-8208-829ffec9fd34', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:30:03.703');
INSERT INTO public."HaveReadIt" VALUES ('c5e474cc-5530-45e0-95d3-957f746f3533', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:32:07.562');
INSERT INTO public."HaveReadIt" VALUES ('54f6d566-4e78-4444-9bcd-1cf39b595b81', 'lajoska3000@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-03-22 15:33:03.675');
INSERT INTO public."HaveReadIt" VALUES ('37c8361e-fbd5-414c-a717-17975edec41f', 'lajoska3000@gmail.com', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff', '2026-03-22 15:34:36.591');
INSERT INTO public."HaveReadIt" VALUES ('7f9061c8-d4cb-4539-aa05-63c16ff2b3c3', 'lajoska3000@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', '2026-03-22 15:35:54.402');
INSERT INTO public."HaveReadIt" VALUES ('6e1ee005-22d5-42ec-9d97-b630848bf9e9', 'lajoska3000@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', '2026-03-22 15:36:37.954');
INSERT INTO public."HaveReadIt" VALUES ('f5bda1b4-6f49-4e40-9ea5-3735dcb508b4', 'lajoska3000@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', '2026-03-22 15:37:11.374');
INSERT INTO public."HaveReadIt" VALUES ('0c290ee6-826c-4d4a-b6e0-21c048da435f', 'lajoska3000@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', '2026-03-22 15:38:24.801');
INSERT INTO public."HaveReadIt" VALUES ('be348aa7-e113-40fd-b1bf-6cac15091d5c', 'lajoska3000@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', '2026-03-22 15:38:27.907');
INSERT INTO public."HaveReadIt" VALUES ('ba3e0870-0e0d-4d5e-a13b-6a7a9d08d58d', 'lajoska3000@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', '2026-03-22 15:39:34.422');
INSERT INTO public."HaveReadIt" VALUES ('173b7574-a198-4801-ad51-90f8067e40a3', 'lajoska3000@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', '2026-03-22 15:39:46.358');
INSERT INTO public."HaveReadIt" VALUES ('29ad3813-12ea-4c4b-a4e3-68a0d842b21b', 'lajoska3000@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', '2026-03-22 15:39:58.044');
INSERT INTO public."HaveReadIt" VALUES ('af07660b-1dc9-4e61-9508-6b418f01b0d2', 'lajoska3000@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', '2026-03-22 15:46:08.275');
INSERT INTO public."HaveReadIt" VALUES ('92fabe9d-d63c-48f4-8d20-5b1d7d33fea4', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:41:27.111');
INSERT INTO public."HaveReadIt" VALUES ('be2e8b81-a3f2-4e78-aceb-14286dae4904', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:42:34.824');
INSERT INTO public."HaveReadIt" VALUES ('2814364c-9fa4-4804-a1c1-425507f18aaf', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:42:50.346');
INSERT INTO public."HaveReadIt" VALUES ('73d6c544-387b-491b-9288-38a102c9ff72', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:43:49.314');
INSERT INTO public."HaveReadIt" VALUES ('9f46df7c-79ef-49bf-bc47-d627b02af173', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:44:00.63');
INSERT INTO public."HaveReadIt" VALUES ('234d892c-3d88-40bd-bd7e-e024a54cd901', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:44:24.915');
INSERT INTO public."HaveReadIt" VALUES ('824be1c8-aa13-4adf-af05-1fe2da1da6d4', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:45:12.109');
INSERT INTO public."HaveReadIt" VALUES ('5a90fb17-c055-46e7-ae62-d8ca92767f16', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:45:49.348');
INSERT INTO public."HaveReadIt" VALUES ('4709bb29-d5d8-426b-8634-793eb4862a4d', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:46:07.694');
INSERT INTO public."HaveReadIt" VALUES ('6cb70c3c-414c-471c-a11b-b24d3800cbe0', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:46:19.112');
INSERT INTO public."HaveReadIt" VALUES ('72dc4674-614b-46f2-8547-aa79c74dffc3', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:46:30.772');
INSERT INTO public."HaveReadIt" VALUES ('38e84b68-93ac-410b-bfe5-72247482a526', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-22 18:46:51.037');
INSERT INTO public."HaveReadIt" VALUES ('39564313-e2f0-4ed0-8767-652bbc097f8d', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 18:46:58.619');
INSERT INTO public."HaveReadIt" VALUES ('4b036f00-daa4-40e6-987a-92b44960da1a', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 18:49:53.12');
INSERT INTO public."HaveReadIt" VALUES ('464e9bb6-7b94-4831-97ce-938897f33741', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 18:50:20.536');
INSERT INTO public."HaveReadIt" VALUES ('8590603e-586b-427a-a658-bda09a7109f7', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 18:50:49.121');
INSERT INTO public."HaveReadIt" VALUES ('fe1ff358-d1ab-4bfe-8b3c-6d53b43927ee', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 18:55:26.624');
INSERT INTO public."HaveReadIt" VALUES ('9dfd5bb2-ff3e-4431-9a3f-05e232f20fe1', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 18:57:26.869');
INSERT INTO public."HaveReadIt" VALUES ('24005653-d389-4605-a8b0-5a380eff52db', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 18:59:15.417');
INSERT INTO public."HaveReadIt" VALUES ('f72598db-6140-420e-8b9f-a48fa3c3fb9b', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 18:59:20.737');
INSERT INTO public."HaveReadIt" VALUES ('4ddf7881-3fec-458d-a96a-197cb1650837', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 19:00:15.253');
INSERT INTO public."HaveReadIt" VALUES ('cfbb78ce-299f-483a-95a7-bff0ab77bb6d', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 19:02:40.314');
INSERT INTO public."HaveReadIt" VALUES ('97bdfce9-b5da-475d-a9cd-1a7547b02dfb', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 19:05:42.644');
INSERT INTO public."HaveReadIt" VALUES ('b750f75a-20c7-4200-a587-75ef72f0dc70', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 19:06:52.169');
INSERT INTO public."HaveReadIt" VALUES ('e7939976-cb01-4714-8030-fe4479a37f80', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 19:07:18.786');
INSERT INTO public."HaveReadIt" VALUES ('fc9778c7-596d-4ab3-a72f-7639729f51f5', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 19:08:12.886');
INSERT INTO public."HaveReadIt" VALUES ('a6fb034f-a780-4438-8036-795e9f3c6cac', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 19:08:40.454');
INSERT INTO public."HaveReadIt" VALUES ('abb2d906-2842-41ff-8b9b-050e68600f7f', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-22 19:10:06.442');
INSERT INTO public."HaveReadIt" VALUES ('bdc377c4-5d50-4198-8b0e-ec1de95c0bd5', 'lajoska3000@gmail.com', '205b3854-f644-45f9-8c12-2791bbcf9b62', '2026-03-22 19:10:19.844');
INSERT INTO public."HaveReadIt" VALUES ('91ff4d03-20e4-4650-86b8-981f84eda636', 'lajoska3000@gmail.com', '205b3854-f644-45f9-8c12-2791bbcf9b62', '2026-03-22 19:10:50.79');
INSERT INTO public."HaveReadIt" VALUES ('770b0ad4-7f6a-45f5-b3b7-7248a20f4dc2', 'lajoska3000@gmail.com', '205b3854-f644-45f9-8c12-2791bbcf9b62', '2026-03-22 19:11:05.435');
INSERT INTO public."HaveReadIt" VALUES ('db9541e1-8b4e-44ff-be5f-e7545651a40f', 'lajoska3000@gmail.com', '205b3854-f644-45f9-8c12-2791bbcf9b62', '2026-03-22 19:11:41.814');
INSERT INTO public."HaveReadIt" VALUES ('57a42e10-cd6f-4c0c-b8d3-cfce950b1a86', 'lajoska3000@gmail.com', '7b6e0ab6-d10f-43b0-a235-543eb576926b', '2026-03-22 19:40:12.789');
INSERT INTO public."HaveReadIt" VALUES ('7679e2b2-117a-45ed-a17e-fca590c7a827', 'lajoska3000@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-03-22 19:40:23.83');
INSERT INTO public."HaveReadIt" VALUES ('b207a96e-d22c-44bc-92f3-8f7701f4713e', 'lajoska3000@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-03-22 19:42:19.755');
INSERT INTO public."HaveReadIt" VALUES ('219a0611-9b8f-42e8-bb63-32a8061fcbf7', 'lajoska3000@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-03-22 19:52:42.419');
INSERT INTO public."HaveReadIt" VALUES ('9cb77cd4-830c-42c7-b734-8e94fb621d5b', 'lajoska3000@gmail.com', '29bba103-a874-4340-9f88-25059ec4a2b4', '2026-03-22 19:52:56.147');
INSERT INTO public."HaveReadIt" VALUES ('bafc5c9e-743e-468b-b0e8-61c37a77d1d5', 'lajoska3000@gmail.com', '29bba103-a874-4340-9f88-25059ec4a2b4', '2026-03-22 19:53:35.918');
INSERT INTO public."HaveReadIt" VALUES ('50a37c38-8edf-4563-99ba-a483c70b9b50', 'lajoska3000@gmail.com', '29bba103-a874-4340-9f88-25059ec4a2b4', '2026-03-22 19:53:48.772');
INSERT INTO public."HaveReadIt" VALUES ('77f3f528-dac4-4393-9029-ffd4081448d7', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-23 10:10:13.655');
INSERT INTO public."HaveReadIt" VALUES ('3d961cd0-8593-48b2-92d4-5e1330c6b7e1', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-23 10:10:31.535');
INSERT INTO public."HaveReadIt" VALUES ('4440337f-89d9-4aca-8daf-32c5ac026e6c', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-23 10:10:36.94');
INSERT INTO public."HaveReadIt" VALUES ('7444dafb-40e2-40a0-94b3-7c8da05acc0d', 'lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-03-23 10:11:04.294');
INSERT INTO public."HaveReadIt" VALUES ('1bad1c72-b928-4e7b-86e4-60c43425ffd1', 'lajoska3000@gmail.com', '0be78d56-30eb-4641-8267-804cbdbdb94c', '2026-03-23 10:13:39.245');
INSERT INTO public."HaveReadIt" VALUES ('5f958dd6-cf79-4117-9ee8-d1c7a8dff071', 'lajoska3000@gmail.com', '4503d7fb-4b27-43f9-9e65-89f2c430b527', '2026-03-23 10:14:36.362');
INSERT INTO public."HaveReadIt" VALUES ('459ee462-bd60-4c34-919c-d9c3c4fcb2d5', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:28:14.542');
INSERT INTO public."HaveReadIt" VALUES ('34e4c57a-ff78-4e2d-a984-842588b18c06', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:30:54.137');
INSERT INTO public."HaveReadIt" VALUES ('dcde78d1-4441-45b7-a3fb-bc7ac470e15d', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:31:50.266');
INSERT INTO public."HaveReadIt" VALUES ('ae1204f5-9487-4b67-b0f4-8063e4f8cda8', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:32:45.124');
INSERT INTO public."HaveReadIt" VALUES ('f1492a37-0a39-40dd-9630-fd09f2620fe4', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:33:10.231');
INSERT INTO public."HaveReadIt" VALUES ('4fe57fad-248c-4487-8c8b-caa143c3c7e1', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:33:32.852');
INSERT INTO public."HaveReadIt" VALUES ('9920bd66-d734-438c-94b4-122a2cd6487f', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:33:42.631');
INSERT INTO public."HaveReadIt" VALUES ('722d229f-38ad-4fa4-ac1e-de4e0bf195e5', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:36:46.006');
INSERT INTO public."HaveReadIt" VALUES ('9c9d9664-0882-4e02-9fdb-0361b0645cb1', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:37:03.009');
INSERT INTO public."HaveReadIt" VALUES ('05dd2f0e-4e30-4357-b469-a5b97ecf99b2', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:38:15.524');
INSERT INTO public."HaveReadIt" VALUES ('39acea76-a8fa-4fd1-bdcb-f11a8d4852af', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:38:38.318');
INSERT INTO public."HaveReadIt" VALUES ('f0ba90ab-38fe-47ba-8853-f8c37bf30717', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:38:47.789');
INSERT INTO public."HaveReadIt" VALUES ('24a310ab-56d8-42be-a77b-be8351daf0d5', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:39:04.132');
INSERT INTO public."HaveReadIt" VALUES ('3b20b843-73d2-471d-9f3c-820827a0d95e', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:39:45.139');
INSERT INTO public."HaveReadIt" VALUES ('20972e23-6a51-48fd-9edf-eceeb3951a7d', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:40:04.999');
INSERT INTO public."HaveReadIt" VALUES ('72ede4fe-dd20-4510-9ae7-aa5c6b8103d9', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:40:16.862');
INSERT INTO public."HaveReadIt" VALUES ('0468fe79-da63-4688-816b-ad5fe4a75d62', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:40:30.714');
INSERT INTO public."HaveReadIt" VALUES ('5c2e5a09-6e4b-40b8-9d4e-d5467ef85d2c', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:40:42.31');
INSERT INTO public."HaveReadIt" VALUES ('ef16d54b-4a19-4efb-94b6-7a1691bd37ba', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:40:49.957');
INSERT INTO public."HaveReadIt" VALUES ('9dbdf1ef-d178-4d16-83e9-6e3ae64ed6c8', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:41:43.21');
INSERT INTO public."HaveReadIt" VALUES ('8cdb3b3d-d7ad-4ab1-881e-6d4a17151f18', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:41:55.864');
INSERT INTO public."HaveReadIt" VALUES ('b431e6e3-8a3e-4a72-840f-1de4dc9cc642', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:42:10.224');
INSERT INTO public."HaveReadIt" VALUES ('19f6f96b-dcec-4ee7-8860-143fe54d7bc3', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:42:21.468');
INSERT INTO public."HaveReadIt" VALUES ('e89a8c1f-4c80-4cb1-921f-26a56c4070fd', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:42:30.901');
INSERT INTO public."HaveReadIt" VALUES ('e9b68503-ed36-47e4-b2b3-5d727db2a954', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:42:48.643');
INSERT INTO public."HaveReadIt" VALUES ('2acc4d40-0253-4a14-8e00-973113d9d611', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:44:15.618');
INSERT INTO public."HaveReadIt" VALUES ('6a9cab58-d51b-4f6e-878d-ec15aa4d73d7', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 10:46:57.157');
INSERT INTO public."HaveReadIt" VALUES ('55e92ece-0c1f-4794-bd39-680a3335709f', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 11:11:32.466');
INSERT INTO public."HaveReadIt" VALUES ('7fb2cd49-d71f-4dec-848c-059056fbffcf', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 12:23:16.415');
INSERT INTO public."HaveReadIt" VALUES ('1177646a-00f6-4cf5-b4d6-5401165386fe', 'lajoska3000@gmail.com', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '2026-03-23 12:23:48.892');
INSERT INTO public."HaveReadIt" VALUES ('75b9105c-50f6-4019-be76-db0482414051', 'lajoska3000@gmail.com', '4503d7fb-4b27-43f9-9e65-89f2c430b527', '2026-03-23 12:24:19.384');
INSERT INTO public."HaveReadIt" VALUES ('73e14cf4-eb2f-41e9-811e-baed2fbc6b0d', 'lajoska3000@gmail.com', '4503d7fb-4b27-43f9-9e65-89f2c430b527', '2026-03-23 12:24:32.884');
INSERT INTO public."HaveReadIt" VALUES ('110e2405-a9cb-46e9-a26e-89322ae3090c', 'lajoska3000@gmail.com', '548b7c15-2d60-4ded-bc9b-7261432c2e05', '2026-03-23 12:24:34.403');
INSERT INTO public."HaveReadIt" VALUES ('26dc6e1a-c37d-4e31-96e2-55b8e65565b1', 'lajoska3000@gmail.com', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '2026-03-23 12:30:08.514');
INSERT INTO public."HaveReadIt" VALUES ('d4c8f38e-0cd2-4558-9e62-ba0463b24795', 'lajoska3000@gmail.com', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '2026-03-23 12:30:25.921');
INSERT INTO public."HaveReadIt" VALUES ('ff52f9cb-ccd1-4b7e-83da-3d898acfcfa5', 'lajoska3000@gmail.com', '7b6e0ab6-d10f-43b0-a235-543eb576926b', '2026-03-23 12:30:27.736');
INSERT INTO public."HaveReadIt" VALUES ('87e806e6-a381-4896-83e8-e3fd6c39e4d6', 'lajoska3000@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-03-23 12:33:23.989');
INSERT INTO public."HaveReadIt" VALUES ('2b28ed4d-3fa6-44c7-b456-4c8fdb5fb53e', 'lajoska3000@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-03-23 12:37:30.782');
INSERT INTO public."HaveReadIt" VALUES ('38295922-beb9-441a-94a9-64d5a2c1c283', 'lajoska3000@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-03-23 12:42:28.401');
INSERT INTO public."HaveReadIt" VALUES ('bb60ac14-f557-4cad-a3f3-af270a09fed7', 'lajoska3000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 12:43:30.998');
INSERT INTO public."HaveReadIt" VALUES ('eb7f4a11-29c2-450b-99c2-b91d5210f108', 'lajoska3000@gmail.com', '7b6e0ab6-d10f-43b0-a235-543eb576926b', '2026-03-23 12:47:14.362');
INSERT INTO public."HaveReadIt" VALUES ('d0e61cc1-6e88-4791-bef8-0bc5f9052768', 'lajoska3020@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-03-23 14:23:14.666');
INSERT INTO public."HaveReadIt" VALUES ('f2ae22bf-7052-48aa-960b-bcebe74af401', 'lajoska3020@gmail.com', '548b7c15-2d60-4ded-bc9b-7261432c2e05', '2026-03-23 14:25:55.432');
INSERT INTO public."HaveReadIt" VALUES ('2fb11c24-2c29-4f42-892e-e630975e6e10', 'lajoska3020@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-03-23 14:26:07.782');
INSERT INTO public."HaveReadIt" VALUES ('6dd988fb-dbe3-4c66-9557-b68ea32beaa0', 'lajoska3020@gmail.com', '548b7c15-2d60-4ded-bc9b-7261432c2e05', '2026-03-23 14:26:12.166');
INSERT INTO public."HaveReadIt" VALUES ('f2beb6ab-202e-4753-95e4-fe81b206ea59', 'lajoska3020@gmail.com', '548b7c15-2d60-4ded-bc9b-7261432c2e05', '2026-03-23 14:27:42.376');
INSERT INTO public."HaveReadIt" VALUES ('9b989877-ffd9-495c-a726-894c01bb821e', 'lajoska3020@gmail.com', '2ebe6e37-a860-4d1e-b408-51d7d7d2ff2b', '2026-03-23 14:27:43.514');
INSERT INTO public."HaveReadIt" VALUES ('614abd84-1a1e-4364-bf98-f48bbd614c72', 'lajoska3020@gmail.com', '961f3c72-1485-4d78-bad0-20a54e8e5c88', '2026-03-23 14:28:11.142');
INSERT INTO public."HaveReadIt" VALUES ('136d04cd-b8e0-421c-aa46-d2a4783bd42b', 'lajoska3020@gmail.com', '92f8c5ef-4171-40d4-9229-dc39ad424ee1', '2026-03-23 14:29:20.667');
INSERT INTO public."HaveReadIt" VALUES ('f5f41d3d-ecc1-4296-900d-daf11a7433b0', 'lajoska3020@gmail.com', '92f8c5ef-4171-40d4-9229-dc39ad424ee1', '2026-03-23 14:30:59.178');
INSERT INTO public."HaveReadIt" VALUES ('50a83621-f357-4382-9464-e05d1b49eebc', 'lajoska3020@gmail.com', '4503d7fb-4b27-43f9-9e65-89f2c430b527', '2026-03-23 14:31:01.258');
INSERT INTO public."HaveReadIt" VALUES ('b70b0e53-042c-4cae-bd9b-0e13d59ec34b', 'lajoska3020@gmail.com', '4503d7fb-4b27-43f9-9e65-89f2c430b527', '2026-03-23 14:31:07.119');
INSERT INTO public."HaveReadIt" VALUES ('a8e99111-b899-4125-9a91-83854bd3c1ee', 'lajoska3020@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-03-23 14:31:39.589');
INSERT INTO public."HaveReadIt" VALUES ('8e69d4b6-9a1b-4c15-add1-69fac9ab1f15', 'lajoska3020@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-03-23 14:32:17.877');
INSERT INTO public."HaveReadIt" VALUES ('d12ac7eb-0a35-4422-b4fe-6cda6297da2c', 'lajoska3021@gmail.com', '662e31e1-a71d-4ec5-81c7-85915dd52fa7', '2026-03-23 15:05:45.99');
INSERT INTO public."HaveReadIt" VALUES ('d7be3b66-1a5d-4452-993c-28f0c32b58b9', 'lajoska3021@gmail.com', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff', '2026-03-23 16:21:02.174');
INSERT INTO public."HaveReadIt" VALUES ('53d96999-2384-449e-94b2-3426f93b2ba2', 'lajoska3021@gmail.com', '0be78d56-30eb-4641-8267-804cbdbdb94c', '2026-03-23 18:56:09.629');
INSERT INTO public."HaveReadIt" VALUES ('537c26b0-ed1f-44ee-8456-12680e47dc6b', 'lajoska3021@gmail.com', '0be78d56-30eb-4641-8267-804cbdbdb94c', '2026-03-23 19:06:30.785');
INSERT INTO public."HaveReadIt" VALUES ('ca49736f-fab9-4b13-a275-3529bf9dd058', 'lajoska3021@gmail.com', '53f9df57-43c1-4a4b-a465-80cf117d5568', '2026-03-30 18:19:06.582');
INSERT INTO public."HaveReadIt" VALUES ('6c71b16e-e3a7-4347-a41c-80c1068c67c6', 'lajoska3021@gmail.com', '0be78d56-30eb-4641-8267-804cbdbdb94c', '2026-03-30 19:01:56.252');
INSERT INTO public."HaveReadIt" VALUES ('b5f51fee-89d1-411a-a293-c3907d97238f', 'lajoska3021@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', '2026-03-30 19:02:01.889');
INSERT INTO public."HaveReadIt" VALUES ('80d7007d-19ba-46a9-a693-73eed6df0cb5', 'lajoska3021@gmail.com', '0be78d56-30eb-4641-8267-804cbdbdb94c', '2026-03-31 16:05:33.33');
INSERT INTO public."HaveReadIt" VALUES ('a3bdab53-0c08-4d9e-a995-0192623080c2', 'lajoska3021@gmail.com', '8c2cced0-b873-444b-a4e4-9228c63bd21e', '2026-03-31 17:59:25.485');
INSERT INTO public."HaveReadIt" VALUES ('64a44f55-119a-4c00-aef4-ef9ac744fc5d', 'lajoska3021@gmail.com', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '2026-04-06 06:28:21.75');
INSERT INTO public."HaveReadIt" VALUES ('a07f2a95-17aa-4e96-a5f0-29f5473a11fd', 'lajoska3021@gmail.com', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '2026-04-06 06:34:18.18');
INSERT INTO public."HaveReadIt" VALUES ('236d659c-6db2-4a67-8d23-8e56554a7e6d', 'lajoska3021@gmail.com', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '2026-04-06 07:29:28.803');
INSERT INTO public."HaveReadIt" VALUES ('125a0b45-8391-4662-a3cd-d391a5964e33', 'lajoska3021@gmail.com', '0be78d56-30eb-4641-8267-804cbdbdb94c', '2026-04-06 08:30:01.172');
INSERT INTO public."HaveReadIt" VALUES ('d44692c3-4b68-413f-84cf-32f4e38cf462', 'lajoska3021@gmail.com', 'abe8fd45-3521-4769-99b6-8c019f7d108c', '2026-04-06 08:43:28.614');
INSERT INTO public."HaveReadIt" VALUES ('96d85e2d-81a7-429a-880b-b6a5ec7bdc52', 'lajoska3021@gmail.com', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '2026-04-06 08:46:13.838');
INSERT INTO public."HaveReadIt" VALUES ('f757bb52-02fa-4240-86f1-bd1465aa2538', 'lajoska3021@gmail.com', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '2026-04-06 08:46:21.971');
INSERT INTO public."HaveReadIt" VALUES ('7bde3cb7-69dd-483b-9571-b184bb007c37', 'lajoska3021@gmail.com', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '2026-04-06 08:46:32.087');
INSERT INTO public."HaveReadIt" VALUES ('3a98394f-f6fa-43e9-a041-4cf6d8a4963b', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 09:14:51.739');
INSERT INTO public."HaveReadIt" VALUES ('5690d993-fcaf-48e2-a713-413d3993eaeb', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:15:18.847');
INSERT INTO public."HaveReadIt" VALUES ('4bd54a7b-19d3-4fd7-9ef8-d6298316bbeb', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:16:55.944');
INSERT INTO public."HaveReadIt" VALUES ('5aca42be-fc81-4e72-bdb4-ff64a57e1147', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:18:24.62');
INSERT INTO public."HaveReadIt" VALUES ('7adeacff-7a46-468c-8344-29dee53370de', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:18:36.818');
INSERT INTO public."HaveReadIt" VALUES ('973822a0-0d95-4645-a8e0-9c0c4c312945', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:21:43.57');
INSERT INTO public."HaveReadIt" VALUES ('9b224a2a-ed1c-4964-a403-0e8fb106c437', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:22:39.784');
INSERT INTO public."HaveReadIt" VALUES ('0efc0ef0-b1be-4351-9245-eb26fb1476be', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:25:57.736');
INSERT INTO public."HaveReadIt" VALUES ('5eec26f4-bfe8-4250-8689-26158bbc8946', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:26:09.002');
INSERT INTO public."HaveReadIt" VALUES ('01cc3eea-18bc-4474-add6-e90ff75a1490', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:28:31.52');
INSERT INTO public."HaveReadIt" VALUES ('117067f0-3f68-40d9-9e8e-a543c890d824', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:28:36.139');
INSERT INTO public."HaveReadIt" VALUES ('5f1418eb-f918-4f32-b4fe-38af377e774a', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:29:04.572');
INSERT INTO public."HaveReadIt" VALUES ('38ad272a-3f8b-4229-b06d-df989fe0af94', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:31:54.349');
INSERT INTO public."HaveReadIt" VALUES ('ce57cc45-9795-491f-8282-0dd3b1fcfb8b', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:33:09.34');
INSERT INTO public."HaveReadIt" VALUES ('fbac883c-9f8a-4808-b707-1a360e6eeda6', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:33:24.323');
INSERT INTO public."HaveReadIt" VALUES ('4785b05a-108d-4933-9b7b-088429e9a090', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:33:31.266');
INSERT INTO public."HaveReadIt" VALUES ('795d3f4b-30c4-4d81-b5f5-2c5dfed16a70', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:33:48.847');
INSERT INTO public."HaveReadIt" VALUES ('63d0cc1e-95e2-4010-90b9-8f0e752d69ec', 'lajoska3021@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-06 09:33:59.358');
INSERT INTO public."HaveReadIt" VALUES ('826d073f-34f8-4294-815e-d1fb02aa4652', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 09:53:56.558');
INSERT INTO public."HaveReadIt" VALUES ('aa3e205e-14be-4383-9b21-60e7d37e3f7a', 'lajoska3021@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-04-06 09:54:08.203');
INSERT INTO public."HaveReadIt" VALUES ('5c465672-3790-4c1d-9d73-d3b5e8bec8b6', 'lajoska3021@gmail.com', 'feab4aba-356a-4608-898d-c115a9c1ee6c', '2026-04-06 09:54:31.901');
INSERT INTO public."HaveReadIt" VALUES ('c7c444e6-4375-42ab-97a3-10e6fb2451e1', 'lajoska3021@gmail.com', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '2026-04-06 09:54:45.325');
INSERT INTO public."HaveReadIt" VALUES ('76e2bf90-27b7-4988-a8c5-c5a3f87d1f98', 'lajoska3021@gmail.com', 'f77972af-cd6f-45bb-abef-ed30ec2dd5d0', '2026-04-06 09:55:07.352');
INSERT INTO public."HaveReadIt" VALUES ('d45ed97a-ea0a-4511-bda0-e92ff9f816b0', 'lajoska3021@gmail.com', 'f73dec77-acdd-45ef-86f9-c32abee8f74e', '2026-04-06 09:55:14.681');
INSERT INTO public."HaveReadIt" VALUES ('2e611057-792c-4b38-88d6-807ac21e97fc', 'lajoska3021@gmail.com', 'f73dec77-acdd-45ef-86f9-c32abee8f74e', '2026-04-06 09:56:17.533');
INSERT INTO public."HaveReadIt" VALUES ('068c3d77-4df0-44e8-ac28-a0b13b34c360', 'lajoska3021@gmail.com', 'f73dec77-acdd-45ef-86f9-c32abee8f74e', '2026-04-06 09:56:28.964');
INSERT INTO public."HaveReadIt" VALUES ('4b71b0be-d3db-4a67-b331-7a0bc100187f', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 10:08:15.759');
INSERT INTO public."HaveReadIt" VALUES ('19f3c2b7-6bbc-4310-b110-4f741a3bef3f', 'lajoska3021@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-04-06 10:08:23');
INSERT INTO public."HaveReadIt" VALUES ('46e03ced-7aab-47a3-8932-c58ba40e8078', 'lajoska3021@gmail.com', '58380636-2b87-45b0-8529-b4e568eb7ace', '2026-04-06 10:08:28.494');
INSERT INTO public."HaveReadIt" VALUES ('b154658f-c38c-459f-bdf0-cb777b0940f9', 'lajoska3021@gmail.com', '205b3854-f644-45f9-8c12-2791bbcf9b62', '2026-04-06 10:08:33.729');
INSERT INTO public."HaveReadIt" VALUES ('edf30b89-10b8-46c5-8902-0e97a618f295', 'lajoska3021@gmail.com', 'b91b9b10-b8a9-4f44-bf87-ea985a45fde2', '2026-04-06 10:08:37.644');
INSERT INTO public."HaveReadIt" VALUES ('cfc930f9-b9e7-4d73-bb17-6fa8dbe5c3ba', 'lajoska3021@gmail.com', '205b3854-f644-45f9-8c12-2791bbcf9b62', '2026-04-06 10:08:42.11');
INSERT INTO public."HaveReadIt" VALUES ('2a26d27c-74dc-4a25-b084-188d625323ee', 'lajoska3021@gmail.com', '205b3854-f644-45f9-8c12-2791bbcf9b62', '2026-04-06 10:22:45.282');
INSERT INTO public."HaveReadIt" VALUES ('3569deb6-0905-49c8-bd2d-689864e8a33c', 'lajoska3021@gmail.com', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '2026-04-06 10:25:19.401');
INSERT INTO public."HaveReadIt" VALUES ('73acf69e-6014-4d90-b2fa-47fb3c0a9801', 'lajoska3021@gmail.com', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '2026-04-06 10:27:48.643');
INSERT INTO public."HaveReadIt" VALUES ('d6500d74-9f0d-41d0-a328-2fd45cd30eae', 'lajoska3021@gmail.com', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '2026-04-06 10:43:40.319');
INSERT INTO public."HaveReadIt" VALUES ('009d94b3-ccd0-4af7-9c29-883760a9d315', 'lajoska3021@gmail.com', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '2026-04-06 10:43:50.733');
INSERT INTO public."HaveReadIt" VALUES ('7fd7c0ca-9e0a-4337-8abb-283e9eaf1680', 'lajoska3021@gmail.com', 'eac6b74c-bc13-40c1-a18a-7a1c9b3f7a74', '2026-04-06 10:46:30.198');
INSERT INTO public."HaveReadIt" VALUES ('705cfcaa-a9e2-45cb-983e-ab285b7b902d', 'lajoska3021@gmail.com', 'ef89cb1e-c8b5-46be-aeb4-ccd0dbe2efa1', '2026-04-06 10:49:52.61');
INSERT INTO public."HaveReadIt" VALUES ('b1c88c00-23d1-44f2-aaca-4794bad5db48', 'lajoska3021@gmail.com', 'f73dec77-acdd-45ef-86f9-c32abee8f74e', '2026-04-06 10:50:01.671');
INSERT INTO public."HaveReadIt" VALUES ('4c5ec88e-4503-4f76-8fe8-70e7577983dc', 'lajoska3021@gmail.com', 'faeed4a6-1f38-4168-bf7b-c206dd53fe77', '2026-04-06 10:51:41.787');
INSERT INTO public."HaveReadIt" VALUES ('83371dfb-d678-4fa8-8ab2-a4144066c7d8', 'lajoska3021@gmail.com', 'feab4aba-356a-4608-898d-c115a9c1ee6c', '2026-04-06 10:51:45.575');
INSERT INTO public."HaveReadIt" VALUES ('dfe2927c-85cd-43cf-a037-b0d857b22814', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 12:09:33.833');
INSERT INTO public."HaveReadIt" VALUES ('509f3256-42c1-4e73-add2-ad0675ecceaa', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 12:10:29.83');
INSERT INTO public."HaveReadIt" VALUES ('da7987f9-f8ed-4421-94bf-b3436af1dd50', 'lajoska3021@gmail.com', '548b7c15-2d60-4ded-bc9b-7261432c2e05', '2026-04-06 13:36:29.637');
INSERT INTO public."HaveReadIt" VALUES ('84235a1f-bb0e-47a1-b30e-c2cb32ba1ba8', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:34:53.259');
INSERT INTO public."HaveReadIt" VALUES ('03eeacc1-b749-4146-b525-665c5bdbdf92', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:35:05.916');
INSERT INTO public."HaveReadIt" VALUES ('22c86d70-b532-4722-865a-0f5f7c1a6b6a', 'lajoska20000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:37:48.128');
INSERT INTO public."HaveReadIt" VALUES ('36d311db-0130-44a1-82f1-f5b3ba466bf6', 'lajoska20000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:37:55.915');
INSERT INTO public."HaveReadIt" VALUES ('029bb14a-bd6e-427e-a1c4-556bfd1f7f27', 'lajoska20000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:38:22.433');
INSERT INTO public."HaveReadIt" VALUES ('8caa3b7e-d39d-4aee-8d96-3d0650ce4bc8', 'lajoska20000@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:41:08.249');
INSERT INTO public."HaveReadIt" VALUES ('c1ad3c24-0e91-448c-8428-e020d38f743b', 'lajos200@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:42:25.55');
INSERT INTO public."HaveReadIt" VALUES ('a91299d4-495e-4f78-9fcc-45b40d06782f', 'lajos200@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:43:20.016');
INSERT INTO public."HaveReadIt" VALUES ('203ac911-dcaa-46d7-bbcf-07e6d5de9c7b', 'lajos200@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:43:26.405');
INSERT INTO public."HaveReadIt" VALUES ('f1a5809b-0ba7-410a-b7e8-cb449841803e', 'lajos200@gmail.com', 'd0b0c6aa-de2f-4024-be19-5634f878b933', '2026-04-06 15:43:44.204');
INSERT INTO public."HaveReadIt" VALUES ('ce5a092d-df99-463b-8d41-05c1b57cdf4e', 'lajos200@gmail.com', '14728228-cbb8-48d8-9f59-109402188de6', '2026-04-06 15:43:52.537');
INSERT INTO public."HaveReadIt" VALUES ('4517d4f5-7056-4317-be4e-9ee5fd0b28a1', 'lajos200@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-04-06 15:44:16.645');
INSERT INTO public."HaveReadIt" VALUES ('27e39fdb-a9ce-4d76-b9bf-25466d366ad1', 'lajos200@gmail.com', '6b38d95c-25de-4bd4-b7c1-5c56186e3a19', '2026-04-06 15:45:45.488');
INSERT INTO public."HaveReadIt" VALUES ('b36e0ba9-ed5c-4c40-a3a0-9a04af644c22', 'lajos200@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:45:53.241');
INSERT INTO public."HaveReadIt" VALUES ('640be060-1d2e-455f-8c75-970521bf19fe', 'lajos200@gmail.com', '0be78d56-30eb-4641-8267-804cbdbdb94c', '2026-04-06 15:47:33.815');
INSERT INTO public."HaveReadIt" VALUES ('0a3d0217-2a0f-451a-bf55-415536a5c9b9', 'lajos200@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:47:40.827');
INSERT INTO public."HaveReadIt" VALUES ('799cfa47-801f-4b8f-acb6-eddc00e94bff', 'lajosma20@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:49:47.648');
INSERT INTO public."HaveReadIt" VALUES ('6dba6288-f2ab-4acc-8b0d-bb1bb0fa7c0f', 'lajosma20@gmail.com', 'feab4aba-356a-4608-898d-c115a9c1ee6c', '2026-04-06 15:49:55.675');
INSERT INTO public."HaveReadIt" VALUES ('ec63d818-4bde-4b34-935b-807eea1b090f', 'lajosma20@gmail.com', '8ad8a0cf-5a5a-49da-8317-a88fd3d91647', '2026-04-06 15:50:36.554');
INSERT INTO public."HaveReadIt" VALUES ('b78c32b0-e84f-4f24-8f0a-62e59bf18ff6', 'lajosma20@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:50:43.768');
INSERT INTO public."HaveReadIt" VALUES ('abbf19a3-6eb5-43f8-84e9-a71abbdcf786', 'lajosma20@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:51:00.747');
INSERT INTO public."HaveReadIt" VALUES ('eb770aec-3f2a-4178-af30-7933eae9a0fa', 'lajosma20@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:51:49.369');
INSERT INTO public."HaveReadIt" VALUES ('3100b201-de03-480a-96df-f7e112e8d1b9', 'lajosma20@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:51:55.522');
INSERT INTO public."HaveReadIt" VALUES ('c9c43e4a-73e0-4ab8-83ce-d71094f64eb0', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:54:25.61');
INSERT INTO public."HaveReadIt" VALUES ('57d580f9-01ef-4f76-83dd-40daadf7134a', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 15:54:35.229');
INSERT INTO public."HaveReadIt" VALUES ('356339fd-4422-4db8-a397-6dd724b80abd', 'lajoska3021@gmail.com', 'abe8fd45-3521-4769-99b6-8c019f7d108c', '2026-04-06 15:55:38.823');
INSERT INTO public."HaveReadIt" VALUES ('5122af37-11c1-496c-b85f-0e6372f8148a', 'lajoska3021@gmail.com', '205b3854-f644-45f9-8c12-2791bbcf9b62', '2026-04-06 16:01:17.452');
INSERT INTO public."HaveReadIt" VALUES ('d8c6de25-93fb-482d-9828-67896a479d7c', 'lajoska3021@gmail.com', '720f9c4f-a47c-43e7-b6ee-0d7204482734', '2026-04-06 16:01:25.822');
INSERT INTO public."HaveReadIt" VALUES ('a9489811-273d-4805-a7db-b1d9faf13cee', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 16:26:03.958');
INSERT INTO public."HaveReadIt" VALUES ('abe5b650-564f-4f1c-a530-6df0b1cee84a', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-06 16:28:32.407');
INSERT INTO public."HaveReadIt" VALUES ('6d7720c9-2f77-4c56-8d75-9b35a8911b3c', 'lajoska3021@gmail.com', '0be78d56-30eb-4641-8267-804cbdbdb94c', '2026-04-06 18:26:46.546');
INSERT INTO public."HaveReadIt" VALUES ('2cf88fea-6c5a-43d5-bc85-6e439c805ae2', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 10:17:51.715');
INSERT INTO public."HaveReadIt" VALUES ('0fab3204-b448-4a17-b42d-a7df400a4e58', 'lajoska3021@gmail.com', '8c2cced0-b873-444b-a4e4-9228c63bd21e', '2026-04-13 10:18:47.373');
INSERT INTO public."HaveReadIt" VALUES ('97f16199-9b4c-4d2e-8205-892158c77ef8', 'lajoska3021@gmail.com', '8c2cced0-b873-444b-a4e4-9228c63bd21e', '2026-04-13 10:19:05.076');
INSERT INTO public."HaveReadIt" VALUES ('b447a55b-cd1f-493f-9741-df2ff3086d06', 'lajoska3021@gmail.com', '8c2cced0-b873-444b-a4e4-9228c63bd21e', '2026-04-13 10:19:50.488');
INSERT INTO public."HaveReadIt" VALUES ('1401959d-f261-4481-bdfd-e0d42c76c0cd', 'lajoska3021@gmail.com', '548b7c15-2d60-4ded-bc9b-7261432c2e05', '2026-04-13 10:20:28.222');
INSERT INTO public."HaveReadIt" VALUES ('b65472b1-8598-4a93-b647-a0be7365c9f5', 'lajoska3021@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 10:21:28.242');
INSERT INTO public."HaveReadIt" VALUES ('e6eaefce-4210-4f08-a14d-b2f138738a0f', 'lajoska3021@gmail.com', '508e7941-37f6-449e-bd2f-4f266edd6da2', '2026-04-13 10:21:53.604');
INSERT INTO public."HaveReadIt" VALUES ('35a6ac0f-db8e-4587-acbf-04d0e26f7081', 'hegeduspeter0911@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', '2026-04-13 10:25:51.068');
INSERT INTO public."HaveReadIt" VALUES ('f94e4e53-5c55-4a9a-9574-32ae6778e8fb', 'szalontaicseko166@gmail.com', 'f73dec77-acdd-45ef-86f9-c32abee8f74e', '2026-04-13 10:25:53.154');
INSERT INTO public."HaveReadIt" VALUES ('2c146ebd-29c2-46f3-ab92-eab1ff62c3c8', 'szalontaicseko166@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 10:27:02.986');
INSERT INTO public."HaveReadIt" VALUES ('7ef7f790-7c07-40eb-ad7a-dd3e754fabcd', 'szalontaicseko166@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 10:28:48.759');
INSERT INTO public."HaveReadIt" VALUES ('e62a00b0-ef37-45cc-bc58-a7763f2376a0', 'hegeduspeter0911@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 10:28:49.805');
INSERT INTO public."HaveReadIt" VALUES ('fda24196-7c93-4936-8892-d2de692ed0dd', 'balogyorgy@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 18:44:03.678');
INSERT INTO public."HaveReadIt" VALUES ('7b3cf4d2-ed6a-414b-b4d4-f1b70da51b3d', 'balogyorgy@gmail.com', 'feab4aba-356a-4608-898d-c115a9c1ee6c', '2026-04-13 18:44:31.267');
INSERT INTO public."HaveReadIt" VALUES ('c8f14238-5312-4b7d-a9ec-c1309e076c3d', 'balogyorgy@gmail.com', 'd0c01d19-f647-4443-b173-8fb6db6c62d6', '2026-04-13 18:45:23.485');
INSERT INTO public."HaveReadIt" VALUES ('88913530-da30-4186-8a7f-5d88269c867a', 'balogyorgy@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 18:45:42.204');
INSERT INTO public."HaveReadIt" VALUES ('5c64a0ba-6cbf-4b53-92ba-e0a765d3600c', 'balogyorgy@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 19:19:32.493');
INSERT INTO public."HaveReadIt" VALUES ('ccc81eab-eaa2-4dde-a1c5-57976145f049', 'lajosma21@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 19:26:11.682');
INSERT INTO public."HaveReadIt" VALUES ('09a3d269-dd32-4708-a071-0c3a7e59c60e', 'hero@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 19:38:59.68');
INSERT INTO public."HaveReadIt" VALUES ('daace4c1-628a-406a-b112-fe907d06053d', 'hero@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 19:39:39.766');
INSERT INTO public."HaveReadIt" VALUES ('6412f8f5-1b9b-4a84-b7fd-bf7241a9e01e', 'hero@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 19:40:40.601');
INSERT INTO public."HaveReadIt" VALUES ('ef945f2d-2937-4ea5-8206-e2f8f6b14dd6', 'lajosma25@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 20:11:58.473');
INSERT INTO public."HaveReadIt" VALUES ('a2b979d3-21ac-4f0e-aebf-8c0f7632fa31', 'lajosma25@gmail.com', 'abe8fd45-3521-4769-99b6-8c019f7d108c', '2026-04-13 20:23:57.615');
INSERT INTO public."HaveReadIt" VALUES ('da242da1-0f53-4c8a-a986-9e54247e46e4', 'lajosma25@gmail.com', 'abe8fd45-3521-4769-99b6-8c019f7d108c', '2026-04-13 20:32:42.746');
INSERT INTO public."HaveReadIt" VALUES ('8eff62ec-bcf5-4c33-9c3a-52e078454eee', 'lajosma25@gmail.com', '7ca733f0-bf4f-48b9-ae7c-dd3233823588', '2026-04-13 20:32:48.663');
INSERT INTO public."HaveReadIt" VALUES ('dd65c642-2f78-4fc7-80e8-b12dfa2a4629', 'lajosma25@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-04-13 20:33:06.512');
INSERT INTO public."HaveReadIt" VALUES ('a81d42db-c441-461f-9683-44c9eceaf8ce', 'lajosma25@gmail.com', '81ca6f0f-7731-4d3e-9a30-e0f9fa5c75f6', '2026-04-13 20:35:13.285');
INSERT INTO public."HaveReadIt" VALUES ('0b71825b-3ea1-4beb-80da-ac53a267a1a3', 'lajosma25@gmail.com', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff', '2026-04-13 20:35:28.559');
INSERT INTO public."HaveReadIt" VALUES ('80ca47b3-13e3-4e54-9628-1159a81948f6', 'lajosma25@gmail.com', 'abe8fd45-3521-4769-99b6-8c019f7d108c', '2026-04-13 20:40:31.827');
INSERT INTO public."HaveReadIt" VALUES ('4df78a27-c6f4-470a-8fe2-b2f3ca89dc84', 'lajosma25@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 20:41:32.29');
INSERT INTO public."HaveReadIt" VALUES ('e98c8ec7-f903-4e42-85b7-9728bec0755b', 'lajosma25@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 20:56:29.764');
INSERT INTO public."HaveReadIt" VALUES ('fec63414-bfc9-418f-89ba-a8c6f89496a7', 'lajosma25@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 20:56:57.203');
INSERT INTO public."HaveReadIt" VALUES ('0ad87940-d762-4c70-ba83-2f46460d6ef4', 'lajosma25@gmail.com', 'abe8fd45-3521-4769-99b6-8c019f7d108c', '2026-04-13 20:57:13.066');
INSERT INTO public."HaveReadIt" VALUES ('6c5c3ccf-bfa1-4cdf-99d9-f10665dea62d', 'lajosma26@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 21:37:20.583');
INSERT INTO public."HaveReadIt" VALUES ('2734b266-0a4d-403e-9d29-396aeeed71dc', 'lajosma27@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 21:43:00.119');
INSERT INTO public."HaveReadIt" VALUES ('dc2bac58-9b90-48fc-8ee6-298cac3cf35d', 'lajosma27@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 21:43:25.325');
INSERT INTO public."HaveReadIt" VALUES ('7018764a-ecf1-40a3-ac9c-7abaaf2d2af9', 'lajosma28@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 21:48:06.667');
INSERT INTO public."HaveReadIt" VALUES ('a04e2c2f-6a78-4427-a762-9878728b4a6a', 'lajosma28@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 21:48:26.539');
INSERT INTO public."HaveReadIt" VALUES ('fb25d61c-89e5-44c7-bd04-90502f9e3577', 'lajosma29@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-13 21:50:02.477');
INSERT INTO public."HaveReadIt" VALUES ('db13a687-a7ea-472f-a144-ea0b6030f270', 'almafa@gmail.com', '2d8e20b4-76cc-4b1c-af52-11417a68ebdd', '2026-04-14 06:19:44.924');
INSERT INTO public."HaveReadIt" VALUES ('8484d1ca-97e1-4d3f-8d87-0809bcebe0df', 'teszt3@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-14 08:05:57.868');
INSERT INTO public."HaveReadIt" VALUES ('33234519-5e6d-42fd-833f-0a4358e4c3f6', 'teszt3@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-14 08:07:00.629');
INSERT INTO public."HaveReadIt" VALUES ('31f95ddc-0567-4634-8a53-d6746a699e7f', 'lajosma30@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-14 08:35:29.496');
INSERT INTO public."HaveReadIt" VALUES ('0374a9fc-4244-4e67-8a51-b94957fc799a', 'lajosma30@gmail.com', '4b111f06-9433-4128-8f1f-17e76b8ad1fd', '2026-04-14 08:36:09.074');


--
-- TOC entry 3495 (class 0 OID 17322)
-- Dependencies: 228
-- Data for Name: Rating; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."Rating" VALUES ('lajoska3000@gmail.com', '86f55ad0-c48c-4be7-aac1-a4162ae7aeff', 3, '2026-03-22 15:34:42.012');
INSERT INTO public."Rating" VALUES ('lajoska3000@gmail.com', '99251f46-c7d2-4392-b160-20340b8e5602', 5, '2026-03-22 15:35:59.507');
INSERT INTO public."Rating" VALUES ('lajoska3000@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', 5, '2026-03-22 18:46:27.015');
INSERT INTO public."Rating" VALUES ('hegeduspeter0911@gmail.com', '2af42d2e-ca83-4519-8725-7bcf5fa69a06', 4, '2026-04-13 10:26:04.672');


--
-- TOC entry 3485 (class 0 OID 17189)
-- Dependencies: 218
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public."User" VALUES ('baloghjanos20041208@gmail.com', 'baloghjanos20041208@gmail.com', 'b97f71ff-bf37-4d0d-89bb-d8f0f802faad', '2026-03-07 09:44:56.262', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-03-07 09:44:56.262');
INSERT INTO public."User" VALUES ('lajos98@gmail.com', 'lajos98@gmail.com', 'b1e6dcbd-929b-421e-b8d8-7516db284ffa', '2026-03-07 09:56:40.235', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-03-07 09:56:40.235');
INSERT INTO public."User" VALUES ('lajos99@gmail.com', 'lajos99@gmail.com', 'd3e92ff1-91af-41aa-8345-0a8111382e84', '2026-03-07 11:20:57.571', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-03-07 11:20:57.571');
INSERT INTO public."User" VALUES ('lajos11@gmail.com', 'lajos11@gmail.com', '1f8fe83f-da3c-47df-9dc5-285e6f09b19d', '2026-03-07 12:38:21.838', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-03-07 12:38:21.838');
INSERT INTO public."User" VALUES ('lajoska98@gmail.com', 'lajoska98@gmail.com', 'ca76d59f-dcb8-4e75-8ec5-652ffa428ca1', '2026-03-08 13:09:50.859', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-03-08 13:09:50.859');
INSERT INTO public."User" VALUES ('lajos100@gmail.com', 'lajos100@gmail.com', '9ecd7391-c0e8-45bf-b09c-25a0e141abe2', '2026-03-08 15:53:35.576', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-03-08 15:53:35.576');
INSERT INTO public."User" VALUES ('lajos988@gmail.com', 'lajos988@gmail.com', '1ba0f337-78c1-4791-ac4b-86c13260d9e7', '2026-03-09 10:53:43.023', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-03-09 10:53:43.023');
INSERT INTO public."User" VALUES ('lajoska2000@gmail.com', 'lajoska2000@gmail.com', 'f59184ae-5e57-407f-b036-1b3ca06b13db', '2026-03-17 16:26:24.335', 'http://localhost:4566/user-pictures/lajoska2000-large-e2c327e6.webp', 'http://localhost:4566/user-pictures/lajoska2000-small-e2500282.webp', 'lajoska2000-large-e2c327e6.webp', 'Lajoska', 'lajoska2000-small-e2500282.webp', '2026-03-17 16:36:06.167');
INSERT INTO public."User" VALUES ('lajosma20@gmail.com', 'lajosma20@gmail.com', 'a5436eed-234d-4888-8c2d-bcfc8a1bd8a5', '2026-04-06 15:49:22.281', 'http://localhost:4566/user-pictures/lajosma20-large-c426828f.webp', 'http://localhost:4566/user-pictures/lajosma20-small-fa121f79.webp', 'lajosma20-large-c426828f.webp', 'Hddgd', 'lajosma20-small-fa121f79.webp', '2026-04-06 15:49:43.935');
INSERT INTO public."User" VALUES ('lajoska3000@gmail.com', 'lajoska3000@gmail.com', 'd51401a8-1583-4fd0-8c58-02d93d208025', '2026-03-17 16:36:59.062', 'http://localhost:4566/user-pictures/lajoska3000-large-e8e8ff1a.webp', 'http://localhost:4566/user-pictures/lajoska3000-small-1e8b5999.webp', 'lajoska3000-large-e8e8ff1a.webp', 'Lajoska', 'lajoska3000-small-1e8b5999.webp', '2026-03-17 16:41:49.549');
INSERT INTO public."User" VALUES ('lajos1000@gmail.com', 'lajos1000@gmail.com', '5c622c6b-0e6e-4265-8eeb-d3691d119ced', '2026-03-11 10:51:55.997', 'http://localhost:4566/user-pictures/lajos1000-large-7d09d495.webp', 'http://localhost:4566/user-pictures/lajos1000-small-e0fc9ae7.webp', 'lajos1000-large-7d09d495.webp', 'Csekoo', 'lajos1000-small-e0fc9ae7.webp', '2026-03-17 16:15:23.229');
INSERT INTO public."User" VALUES ('lajoska2300@gmail.com', 'lajoska2300@gmail.com', '25979e86-a247-4b4b-a461-175a5f2cb6f6', '2026-03-23 12:58:55.974', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-03-23 12:58:55.974');
INSERT INTO public."User" VALUES ('lajos2000@gmail.com', 'lajos2000@gmail.com', '92330021-c8b3-433a-b633-66152b893ef9', '2026-03-17 16:16:06.509', 'http://localhost:4566/user-pictures/lajos2000-large-8d8c53eb.webp', 'http://localhost:4566/user-pictures/lajos2000-small-dc098a38.webp', 'lajos2000-large-8d8c53eb.webp', 'Lajoska', 'lajos2000-small-dc098a38.webp', '2026-03-17 16:19:46.468');
INSERT INTO public."User" VALUES ('lajoska3020@gmail.com', 'lajoska3020@gmail.com', 'c1079678-0f14-4ab8-ac6b-0fa41574a3e6', '2026-03-23 13:37:27.4', 'http://localhost:4566/user-pictures/lajoska3020-large-dbe19213.webp', 'http://localhost:4566/user-pictures/lajoska3020-small-06c379bf.webp', 'lajoska3020-large-dbe19213.webp', 'Sanyika', 'lajoska3020-small-06c379bf.webp', '2026-03-23 14:22:50.202');
INSERT INTO public."User" VALUES ('lajoska3021@gmail.com', 'lajoska3021@gmail.com', '27faf339-44d6-4fa2-af7a-217a01182496', '2026-03-23 14:36:55.199', 'http://localhost:4566/user-pictures/lajoska3021-large-6928f8fd.webp', 'http://localhost:4566/user-pictures/lajoska3021-small-2791b8d6.webp', 'lajoska3021-large-6928f8fd.webp', 'HDMI', 'lajoska3021-small-2791b8d6.webp', '2026-04-06 15:26:02.786');
INSERT INTO public."User" VALUES ('lajos10000@gmail.com', 'lajos10000@gmail.com', 'be7989d6-aa0c-447c-a2f9-0e7e06990ab8', '2026-03-24 08:20:05.413', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-03-24 08:20:05.413');
INSERT INTO public."User" VALUES ('lajoska20000@gmail.com', 'lajoska20000@gmail.com', '1dd0606f-a119-41d1-bac7-d5c5228519fb', '2026-04-06 15:35:56.9', 'http://localhost:4566/user-pictures/lajoska20000-large-e9f33e1a.webp', 'http://localhost:4566/user-pictures/lajoska20000-small-bbf45333.webp', 'lajoska20000-large-e9f33e1a.webp', 'Hdmi', 'lajoska20000-small-bbf45333.webp', '2026-04-06 15:37:43.64');
INSERT INTO public."User" VALUES ('lajos200@gmail.com', 'lajos200@gmail.com', '71c973a5-bfc5-4369-8dd7-a2e0cba7a1c7', '2026-04-06 15:41:43.673', 'http://localhost:4566/user-pictures/lajos200-large-6212b7ed.webp', 'http://localhost:4566/user-pictures/lajos200-small-124a4722.webp', 'lajos200-large-6212b7ed.webp', 'Lajoskaka', 'lajos200-small-124a4722.webp', '2026-04-06 15:42:20.672');
INSERT INTO public."User" VALUES ('lajos2002@gmail.com', 'lajos2002@gmail.com', '875affe8-f885-42b0-ae05-7c82a8de179c', '2026-04-13 10:05:39.093', 'http://localhost:4566/user-pictures/lajos2002-large-936586d8.webp', 'http://localhost:4566/user-pictures/lajos2002-small-e81ee9ff.webp', 'lajos2002-large-936586d8.webp', NULL, 'lajos2002-small-e81ee9ff.webp', '2026-04-13 10:07:06.964');
INSERT INTO public."User" VALUES ('lajcsi@gmail.com', 'lajcsi@gmail.com', '13b4f71d-f0c4-48c8-acbf-01a063ecb0e6', '2026-04-13 19:20:18.321', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-04-13 19:20:18.321');
INSERT INTO public."User" VALUES ('szalontaicseko166@gmail.com', 'szalontaicseko166@gmail.com', 'cb4aeabb-012f-4317-ac6f-091943e28876', '2026-03-16 13:19:55.186', 'http://localhost:4566/user-pictures/szalontaicseko166-large-a11a97fe.webp', 'http://localhost:4566/user-pictures/szalontaicseko166-small-d1720be1.webp', 'szalontaicseko166-large-a11a97fe.webp', 'Nigaman', 'szalontaicseko166-small-d1720be1.webp', '2026-04-13 10:26:51.889');
INSERT INTO public."User" VALUES ('lajcsi2@gmail.com', 'lajcsi2@gmail.com', '2b3d2159-8b94-4e32-ab58-2f82288489ba', '2026-04-13 19:22:41.72', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-04-13 19:22:41.72');
INSERT INTO public."User" VALUES ('hegeduspeter0911@gmail.com', 'hegeduspeter0911@gmail.com', 'b312fb45-d2d7-4ac6-94ef-2934d5d02431', '2026-03-16 13:27:48.927', 'http://localhost:4566/user-pictures/hegeduspeter0911-large-5a3cdb99.webp', 'http://localhost:4566/user-pictures/hegeduspeter0911-small-06afae55.webp', 'hegeduspeter0911-large-5a3cdb99.webp', 'LepkefingLeo', 'hegeduspeter0911-small-06afae55.webp', '2026-04-13 10:28:38.395');
INSERT INTO public."User" VALUES ('balogyorgy@gmail.com', 'balogyorgy@gmail.com', '2c0fd3cb-0632-4d8a-af58-1e928ac5f610', '2026-04-13 18:36:24.806', 'http://localhost:4566/user-pictures/balogyorgy-large-ae5091ac.webp', 'http://localhost:4566/user-pictures/balogyorgy-small-0ba52540.webp', 'balogyorgy-large-ae5091ac.webp', 'Hero', 'balogyorgy-small-0ba52540.webp', '2026-04-13 18:53:29.106');
INSERT INTO public."User" VALUES ('lajosma21@gmail.com', 'lajosma21@gmail.com', '994d39c3-35a3-45d5-ba3f-90734f1ff5c1', '2026-04-13 19:25:16.343', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-04-13 19:25:16.343');
INSERT INTO public."User" VALUES ('lajosma22@gmail.com', 'lajosma22@gmail.com', '2d83a028-dfe0-4b82-8d13-f83c719e3fde', '2026-04-13 19:46:01.341', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-04-13 19:46:01.341');
INSERT INTO public."User" VALUES ('hero@gmail.com', 'hero@gmail.com', '57911f5e-a87f-421c-90c5-b5e949e0dc70', '2026-04-13 19:36:56.657', 'http://localhost:4566/user-pictures/hero-large-06c6847e.webp', 'http://localhost:4566/user-pictures/hero-small-62798026.webp', 'hero-large-06c6847e.webp', 'Guest340', 'hero-small-62798026.webp', '2026-04-13 19:40:26.15');
INSERT INTO public."User" VALUES ('lajosma23@gmail.com', 'lajosma23@gmail.com', 'cd41ffdd-af94-44e3-84be-323febdf4580', '2026-04-13 19:48:44.543', 'http://localhost:4566/user-pictures/lajosma23-large-22f5d051.webp', 'http://localhost:4566/user-pictures/lajosma23-small-5a3ad122.webp', 'lajosma23-large-22f5d051.webp', 'Guest744', 'lajosma23-small-5a3ad122.webp', '2026-04-13 19:50:11.823');
INSERT INTO public."User" VALUES ('kortefa@gmail.com', 'kortefa@gmail.com', 'a927d043-22b5-4d24-aa28-5f486aceac03', '2026-04-14 07:02:29.61', 'http://localhost:4566/user-pictures/kortefa-large-7c0b4215.webp', 'http://localhost:4566/user-pictures/kortefa-small-23f2c527.webp', 'kortefa-large-7c0b4215.webp', 'Tester the Molester', 'kortefa-small-23f2c527.webp', '2026-04-14 07:21:47.948');
INSERT INTO public."User" VALUES ('nickkurtdale@gmail.com', 'nickkurtdale@gmail.com', 'a8039f75-5512-4944-9cf4-081a70f89a7b', '2026-04-14 07:26:01.317', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-04-14 07:26:01.317');
INSERT INTO public."User" VALUES ('nickkurtdale67@gmail.com', 'nickkurtdale67@gmail.com', '911c8ab8-f99c-4126-9f70-0548c66f7f6d', '2026-04-14 07:28:16.673', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-04-14 07:28:16.673');
INSERT INTO public."User" VALUES ('aaaaa@gmail.com', 'aaaaa@gmail.com', '104a3bb5-feac-48f5-a895-ab4c08f15819', '2026-04-14 07:33:19.483', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-04-14 07:33:19.483');
INSERT INTO public."User" VALUES ('teszt@gmail.com', 'teszt@gmail.com', '548f9e83-c2ca-42ff-8bca-3d9ffae0024b', '2026-04-14 08:00:26.426', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-04-14 08:00:26.426');
INSERT INTO public."User" VALUES ('lajosma24@gmail.com', 'lajosma24@gmail.com', '0adfa4a0-8337-4567-8a06-684c8eee1b12', '2026-04-13 19:51:53.914', 'http://localhost:4566/user-pictures/lajosma24-large-7ac3cae7.webp', 'http://localhost:4566/user-pictures/lajosma24-small-d0f0b019.webp', 'lajosma24-large-7ac3cae7.webp', 'Lajoska', 'lajosma24-small-d0f0b019.webp', '2026-04-13 20:10:49.008');
INSERT INTO public."User" VALUES ('teszt2@gmail.com', 'teszt2@gmail.com', 'ac490a2c-9a99-417e-a403-5d73fb8bac74', '2026-04-14 08:02:42.89', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-04-14 08:02:42.89');
INSERT INTO public."User" VALUES ('lajosma25@gmail.com', 'lajosma25@gmail.com', '07be51fc-d371-43a0-b61b-611f04dcb730', '2026-04-13 20:11:14.566', 'http://localhost:4566/user-pictures/lajosma25-large-0cb1fa0c.webp', 'http://localhost:4566/user-pictures/lajosma25-small-287f85fa.webp', 'lajosma25-large-0cb1fa0c.webp', 'Guest526', 'lajosma25-small-287f85fa.webp', '2026-04-13 20:56:49.573');
INSERT INTO public."User" VALUES ('lajosma26@gmail.com', 'lajosma26@gmail.com', '991d30bc-b52d-46da-b944-9793068e25f0', '2026-04-13 20:58:05.712', 'http://localhost:4566/user-pictures/lajosma26-large-00ba45d4.webp', 'http://localhost:4566/user-pictures/lajosma26-small-10e60dfd.webp', 'lajosma26-large-00ba45d4.webp', 'Guest551', 'lajosma26-small-10e60dfd.webp', '2026-04-13 21:36:59.971');
INSERT INTO public."User" VALUES ('lajosma27@gmail.com', 'lajosma27@gmail.com', 'acd69ce5-b62f-4ef7-8bdf-16c7c379c29a', '2026-04-13 21:42:40.105', 'http://localhost:4566/user-pictures/lajosma27-large-b4f6f146.webp', 'http://localhost:4566/user-pictures/lajosma27-small-b67afd4f.webp', 'lajosma27-large-b4f6f146.webp', 'Guest91', 'lajosma27-small-b67afd4f.webp', '2026-04-13 21:42:56.701');
INSERT INTO public."User" VALUES ('lajosma28@gmail.com', 'lajosma28@gmail.com', '9166aa6c-538b-496f-80c9-046b8ffb1f2b', '2026-04-13 21:47:47.175', 'http://localhost:4566/user-pictures/lajosma28-large-cf7c5133.webp', 'http://localhost:4566/user-pictures/lajosma28-small-d03b001d.webp', 'lajosma28-large-cf7c5133.webp', 'Guest457', 'lajosma28-small-d03b001d.webp', '2026-04-13 21:48:02.421');
INSERT INTO public."User" VALUES ('lajosma29@gmail.com', 'lajosma29@gmail.com', 'ce770d34-14ab-47dd-91f5-10ad486f0ab9', '2026-04-13 21:49:41.279', 'http://localhost:4566/user-pictures/lajosma29-large-a45a8550.webp', 'http://localhost:4566/user-pictures/lajosma29-small-0360b53d.webp', 'lajosma29-large-a45a8550.webp', 'Guest481', 'lajosma29-small-0360b53d.webp', '2026-04-13 21:49:53.997');
INSERT INTO public."User" VALUES ('almafa@gmail.com', 'almafa@gmail.com', 'e007f179-575d-4e00-86e7-7e913bd4727b', '2026-04-14 06:19:04.355', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, 'Aha', NULL, '2026-04-14 06:19:34.194');
INSERT INTO public."User" VALUES ('teszt3@gmail.com', 'teszt3@gmail.com', '1ad6a98d-1191-4786-bef7-b09e85e48c6d', '2026-04-14 08:04:36.97', 'http://localhost:4566/user-pictures/teszt3-large-dd4d3ceb.webp', 'http://localhost:4566/user-pictures/teszt3-small-534b1889.webp', 'teszt3-large-dd4d3ceb.webp', 'Teszt3', 'teszt3-small-534b1889.webp', '2026-04-14 08:05:10.307');
INSERT INTO public."User" VALUES ('uudud82@gmail.com', 'uudud82@gmail.com', 'e7265f4e-e77f-4264-a8fc-a6cd3a75e2f0', '2026-04-14 08:58:16.981', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, 'Guest332', NULL, '2026-04-14 08:58:26.298');
INSERT INTO public."User" VALUES ('lajosma31@gmail.com', 'lajosma31@gmail.com', 'a82821ac-0253-4575-afca-86245dbbe617', '2026-04-14 09:04:51.545', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, NULL, NULL, '2026-04-14 09:04:51.545');
INSERT INTO public."User" VALUES ('lajosma30@gmail.com', 'lajosma30@gmail.com', '4dbcb051-c1cf-430e-96b5-548013a4d0e4', '2026-04-14 08:35:07.457', 'http://localhost:4566/user-pictures/lajosma30-large-92e41a28.webp', 'http://localhost:4566/user-pictures/lajosma30-small-ce1a1686.webp', 'lajosma30-large-92e41a28.webp', 'Yoda Mester', 'lajosma30-small-ce1a1686.webp', '2026-04-14 08:36:01.263');
INSERT INTO public."User" VALUES ('teszt428@gmail.com', 'teszt428@gmail.com', '850f0f42-121a-420c-a997-8327d9b4793e', '2026-04-14 08:38:28.407', 'http://localhost:4566/user-pictures/teszt428-large-57d4c0eb.webp', 'http://localhost:4566/user-pictures/teszt428-small-3d7b8113.webp', 'teszt428-large-57d4c0eb.webp', 'Yup', 'teszt428-small-3d7b8113.webp', '2026-04-14 08:39:01.892');
INSERT INTO public."User" VALUES ('kortefa2@gmail.com', 'kortefa2@gmail.com', 'cbc528bf-3fd2-4cbf-a920-be22a28858bb', '2026-04-14 08:57:18.629', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, 'Hell yeah', NULL, '2026-04-14 08:57:51.188');
INSERT INTO public."User" VALUES ('balogyorgy1@gmail.com', 'balogyorgy1@gmail.com', 'adbfcf36-a7a8-4f7d-ab32-cfce4277b78a', '2026-04-14 09:16:47.531', 'http://localhost:4566/user-pictures/anonymous-user.webp', 'http://localhost:4566/user-pictures/anonymous-user.webp', NULL, 'Guest35', NULL, '2026-04-14 09:21:00.106');


--
-- TOC entry 3484 (class 0 OID 17180)
-- Dependencies: 217
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public._prisma_migrations VALUES ('668eeea5-a496-4175-ae9f-ce59474cd27d', '17bd6d1aef501fb55518a6d4f39317d630c76e27900486498b9c1002510c2ecc', '2026-02-01 09:44:21.225852+00', '20251009105832_init', NULL, NULL, '2026-02-01 09:44:21.212297+00', 1);
INSERT INTO public._prisma_migrations VALUES ('c7517ef8-7a39-4cab-bdcd-eebd0f6f05b3', '79bd76e41f1a637819902caa9a6de2b13c5aaed997fc9896ce664f856dcefab8', '2026-02-01 09:44:21.243659+00', '20251226231243_add_favorites_comments_onupdate_ondelete', NULL, NULL, '2026-02-01 09:44:21.227671+00', 1);
INSERT INTO public._prisma_migrations VALUES ('2adc22c4-a952-489b-ac18-4c048aed44fa', '47c925c4f4d0736ac4935f5cbe25307cc12ed3de3c14223bdcb53c763c8c6a53', '2026-02-01 09:44:21.251963+00', '20251229103325_add_smaller_and_bigger_pic_field', NULL, NULL, '2026-02-01 09:44:21.24583+00', 1);
INSERT INTO public._prisma_migrations VALUES ('fc2cab6d-901b-4a38-b1e7-f7bf355d0819', '16c0c6e3f73e5da6d1fba5db6c3898e6784a8143a1ae107fd5c089cef23cb3d5', '2026-02-01 09:44:21.267073+00', '20251229163232_add_nickname_flexibility_and_rm_authorname_unique', NULL, NULL, '2026-02-01 09:44:21.254005+00', 1);
INSERT INTO public._prisma_migrations VALUES ('75955720-ff08-43f8-9287-685ab4b359a7', '6d12a75b958bf1ce4d1c15edb56c3175f98901aff4695d5d6f4e8cbff0732b7d', '2026-02-01 09:45:08.700186+00', '20260201094508_add_approve_status', NULL, NULL, '2026-02-01 09:45:08.691732+00', 1);


--
-- TOC entry 3289 (class 2606 OID 17202)
-- Name: Author Author_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Author"
    ADD CONSTRAINT "Author_pkey" PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 17224)
-- Name: BookGenres BookGenres_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."BookGenres"
    ADD CONSTRAINT "BookGenres_pkey" PRIMARY KEY ("bookId", "genreId");


--
-- TOC entry 3319 (class 2606 OID 17439)
-- Name: BookIsbn BookIsbn_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."BookIsbn"
    ADD CONSTRAINT "BookIsbn_pkey" PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 17246)
-- Name: BookStatistics BookStatistics_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."BookStatistics"
    ADD CONSTRAINT "BookStatistics_pkey" PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 17210)
-- Name: Book Book_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Book"
    ADD CONSTRAINT "Book_pkey" PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 17344)
-- Name: CommentLike CommentLike_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."CommentLike"
    ADD CONSTRAINT "CommentLike_pkey" PRIMARY KEY ("userId", "commentId");


--
-- TOC entry 3314 (class 2606 OID 17337)
-- Name: Comment Comment_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_pkey" PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 17321)
-- Name: FavoriteAuthor FavoriteAuthor_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."FavoriteAuthor"
    ADD CONSTRAINT "FavoriteAuthor_pkey" PRIMARY KEY ("userId", "authorId");


--
-- TOC entry 3308 (class 2606 OID 17314)
-- Name: FavoriteBook FavoriteBook_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."FavoriteBook"
    ADD CONSTRAINT "FavoriteBook_pkey" PRIMARY KEY ("userId", "bookId");


--
-- TOC entry 3306 (class 2606 OID 17307)
-- Name: FavoriteGenre FavoriteGenre_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."FavoriteGenre"
    ADD CONSTRAINT "FavoriteGenre_pkey" PRIMARY KEY ("userId", "genreId");


--
-- TOC entry 3297 (class 2606 OID 17217)
-- Name: Genres Genres_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Genres"
    ADD CONSTRAINT "Genres_pkey" PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 17254)
-- Name: HaveReadIt HaveReadIt_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."HaveReadIt"
    ADD CONSTRAINT "HaveReadIt_pkey" PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 17329)
-- Name: Rating Rating_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "Rating_pkey" PRIMARY KEY ("userId", "bookId");


--
-- TOC entry 3285 (class 2606 OID 17195)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 17188)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 1259 OID 17965)
-- Name: Author_name_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "Author_name_idx" ON public."Author" USING btree (name);


--
-- TOC entry 3287 (class 1259 OID 17964)
-- Name: Author_openLibraryId_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Author_openLibraryId_key" ON public."Author" USING btree ("openLibraryId");


--
-- TOC entry 3317 (class 1259 OID 17440)
-- Name: BookIsbn_isbnNumber_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "BookIsbn_isbnNumber_key" ON public."BookIsbn" USING btree ("isbnNumber");


--
-- TOC entry 3300 (class 1259 OID 17259)
-- Name: BookStatistics_bookId_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "BookStatistics_bookId_key" ON public."BookStatistics" USING btree ("bookId");


--
-- TOC entry 3290 (class 1259 OID 17966)
-- Name: Book_googleBookId_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Book_googleBookId_key" ON public."Book" USING btree ("googleBookId");


--
-- TOC entry 3291 (class 1259 OID 17967)
-- Name: Book_openLibraryId_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Book_openLibraryId_key" ON public."Book" USING btree ("openLibraryId");


--
-- TOC entry 3294 (class 1259 OID 17968)
-- Name: Book_title_authorId_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Book_title_authorId_key" ON public."Book" USING btree (title, "authorId");


--
-- TOC entry 3295 (class 1259 OID 17258)
-- Name: Genres_name_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Genres_name_key" ON public."Genres" USING btree (name);


--
-- TOC entry 3283 (class 1259 OID 17255)
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- TOC entry 3321 (class 2606 OID 17345)
-- Name: BookGenres BookGenres_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."BookGenres"
    ADD CONSTRAINT "BookGenres_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3322 (class 2606 OID 17350)
-- Name: BookGenres BookGenres_genreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."BookGenres"
    ADD CONSTRAINT "BookGenres_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES public."Genres"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3338 (class 2606 OID 17441)
-- Name: BookIsbn BookIsbn_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."BookIsbn"
    ADD CONSTRAINT "BookIsbn_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3323 (class 2606 OID 17415)
-- Name: BookStatistics BookStatistics_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."BookStatistics"
    ADD CONSTRAINT "BookStatistics_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3320 (class 2606 OID 17260)
-- Name: Book Book_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Book"
    ADD CONSTRAINT "Book_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."Author"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3336 (class 2606 OID 17410)
-- Name: CommentLike CommentLike_commentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."CommentLike"
    ADD CONSTRAINT "CommentLike_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES public."Comment"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3337 (class 2606 OID 17405)
-- Name: CommentLike CommentLike_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."CommentLike"
    ADD CONSTRAINT "CommentLike_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3334 (class 2606 OID 17400)
-- Name: Comment Comment_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3335 (class 2606 OID 17395)
-- Name: Comment Comment_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3330 (class 2606 OID 17380)
-- Name: FavoriteAuthor FavoriteAuthor_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."FavoriteAuthor"
    ADD CONSTRAINT "FavoriteAuthor_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."Author"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3331 (class 2606 OID 17375)
-- Name: FavoriteAuthor FavoriteAuthor_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."FavoriteAuthor"
    ADD CONSTRAINT "FavoriteAuthor_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3328 (class 2606 OID 17370)
-- Name: FavoriteBook FavoriteBook_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."FavoriteBook"
    ADD CONSTRAINT "FavoriteBook_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3329 (class 2606 OID 17365)
-- Name: FavoriteBook FavoriteBook_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."FavoriteBook"
    ADD CONSTRAINT "FavoriteBook_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3326 (class 2606 OID 17360)
-- Name: FavoriteGenre FavoriteGenre_genreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."FavoriteGenre"
    ADD CONSTRAINT "FavoriteGenre_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES public."Genres"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3327 (class 2606 OID 17355)
-- Name: FavoriteGenre FavoriteGenre_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."FavoriteGenre"
    ADD CONSTRAINT "FavoriteGenre_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3324 (class 2606 OID 17425)
-- Name: HaveReadIt HaveReadIt_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."HaveReadIt"
    ADD CONSTRAINT "HaveReadIt_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3325 (class 2606 OID 17420)
-- Name: HaveReadIt HaveReadIt_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."HaveReadIt"
    ADD CONSTRAINT "HaveReadIt_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3332 (class 2606 OID 17390)
-- Name: Rating Rating_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "Rating_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3333 (class 2606 OID 17385)
-- Name: Rating Rating_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "Rating_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: admin
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2026-04-16 08:46:21

--
-- PostgreSQL database dump complete
--

