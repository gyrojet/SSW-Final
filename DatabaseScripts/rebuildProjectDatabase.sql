BEGIN TRANSACTION;

-- Start clean
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Division;
DROP TABLE IF EXISTS BowlingUser;

CREATE TABLE BowlingUser (
    Id INTEGER PRIMARY KEY,
    UserName TEXT NOT NULL,
    PasswordHash TEXT NOT NULL,
    IsAdmin INTEGER NOT NULL CHECK (IsAdmin IN (0,1))
);

CREATE TABLE Division (
    DivisionId INTEGER PRIMARY KEY,
    DivisionName TEXT NOT NULL UNIQUE
);

CREATE TABLE Team (
    TeamId INTEGER PRIMARY KEY,
    TeamName TEXT NOT NULL,
    DivisionId INTEGER NOT NULL,
    RegistrationPaid INTEGER NOT NULL CHECK (RegistrationPaid IN (0,1)),
    PaymentDate TEXT,
    FOREIGN KEY (DivisionId) REFERENCES Division(DivisionId),
    CHECK (
        (RegistrationPaid = 1 AND PaymentDate IS NOT NULL) OR
        (RegistrationPaid = 0 AND PaymentDate IS NULL)
    )
);
CREATE TABLE Player (
    PlayerId INTEGER PRIMARY KEY,
    TeamId INTEGER NOT NULL,
    PlayerName TEXT NOT NULL,
    City TEXT NOT NULL,
    Province TEXT NOT NULL,
    Email TEXT NOT NULL,
    Phone TEXT NOT NULL,
    FOREIGN KEY (TeamId) REFERENCES Team(TeamId)
);

-- BowlingUser records
INSERT into BowlingUser values (1, 'smonk', 'AQAAAAIAAYagAAAAEAcMGLT/aGQKE7NhDmyW5xABrB/u72/idjdmtxYxfvE+8+/YEHBKnUhN10NnsYO1LQ==', 1),
                               (2, 'tlaw', 'AQAAAAIAAYagAAAAEAcMGLT/aGQKE7NhDmyW5xABrB/u72/idjdmtxYxfvE+8+/YEHBKnUhN10NnsYO1LQ==', 0);

-- Division records
INSERT INTO Division VALUES (1, 'Men''s');
INSERT INTO Division VALUES (2, 'Women''s');
INSERT INTO Division VALUES (3, 'Mixed');
INSERT INTO Division VALUES (4, 'Youth');
INSERT INTO Division VALUES (5, 'Senior');

-- Team records
insert into Team values (1,'Team Team Name',1,1,'2024-09-14');
insert into Team values (2,'Port-City Pirates',4,1,'2025-12-22');
insert into Team values (3,'Saint John Reindeers',2,0,NULL);
insert into Team values (4,'Josh Fans',3,1,'2025-07-17');
insert into Team values (5,'Kingston Cuppers',5,0,NULL);
insert into Team values (6,'Les Miserabowls ',4,1,'2026-02-10');
insert into Team values (7,'The Pinsons',1,1,'2024-12-25');
insert into Team values (8,'Dragon Bowl GT',2,1,'2026-09-30');
insert into Team values (9,'Josh Haters',3,1,'2025-11-20');
insert into Team values (10,'Counter-Strikers',5,0,NULL);
insert into Team values (11,'Avengers',1,1,'2026-02-25');
insert into Team values (12,'Justice League',5,1,'2026-05-11');
insert into Team values (13,'Joestars',1,1,'2026-10-01');
insert into Team values (14,'The Empire',1,1,'2026-09-12');
insert into Team values (15,'The Seven',1,0,NULL);
insert into Team values (16,'The Pinheads',5,1,'2026-06-24');
insert into Team values (17,'Guardians of the Gutter',3,1,'2026-07-20');
insert into Team values (18,'The Lucky Strikes',2,1,'2026-01-28');
insert into Team values (19,'Spare Me',3,1,'2026-09-05');
insert into Team values (20,'Jesus Take the Ball',5,0,NULL);
insert into Team values (21,'Our Father Who Art in the Gutter',5,1,'2026-10-03');
insert into Team values (22,'Alley Cats',2,1,'2026-05-24');
insert into Team values (23,'Kalahari Kings',4,0,NULL);
insert into Team values (24,'Magic Mohawks',5,1,'2026-10-26');
insert into Team values (25,'Holy Rollers',4,1,'2026-07-24');
insert into Team values (26,'Sosa FC',4,1,'2024-08-11');
insert into Team values (27,'Composite Bonders',1,1,'2024-08-15');
insert into Team values (28,'Channel FC',5,0,NULL);
insert into Team values (29,'Outlook Court',2,1,'2026-01-15');
insert into Team values (30,'River Jordan',3,1,'2025-02-09');
insert into Team values (31,'Split Happens',5,1,'2026-06-11');
insert into Team values (32,'Strike Force',2,1,'2026-03-27');
insert into Team values (33,'Folk Lane',4,0,NULL);
insert into Team values (34,'Gutter Kids',2,1,'2026-06-08');
insert into Team values (35,'Peak Performers',5,1,'2026-06-15');
insert into Team values (36,'Lucky Laners',2,1,'2026-05-09');
insert into Team values (37,'Women in STEM',4,0,NULL);
insert into Team values (38,'Super Intelligence Team',5,0,NULL);
insert into Team values (39,'Team Four Star',1,1,'2026-05-23');
insert into Team values (40,'Fireballs',3,1,'2026-05-08');
insert into Team values (41,'The Ballbarians',5,1,'2026-09-12');
insert into Team values (42,'High Rollers',1,1,'2026-09-15');
insert into Team values (43,'Rolling Thunder',2,0,NULL);
insert into Team values (44,'Pocket Pounders',3,1,'2026-09-20');
insert into Team values (45,'Pin Pals',4,0,NULL);
insert into Team values (46,'The Bowling Stones',2,1,'2026-03-05');
insert into Team values (47,'Slipping Jimmies',2,1,'2026-03-03');
insert into Team values (48,'The Chimichangas',3,1,'2026-01-18');
insert into Team values (49,'The Big Lebowskis',5,0,NULL);
insert into Team values (50,'Pin Pals',1,1,'2026-10-02');

-- Player records
insert into Player values (1,1,'Jacob Lash','Saint John','NB','the.lash.tm@gmail.com','506-636-4726');
insert into Player values (2,1,'Saul Goodman','Fredericton','NB','bettercallsaul@hotmail.com','506-503-4455');
insert into Player values (3,1,'Nathan Brooks','Moncton','NB','nathan.brooks@outlook.com','506-294-3581');
insert into Player values (4,1,'Sophia Bennett','Dieppe','NB','sophia.bennett@yahoo.com','506-382-7934');
insert into Player values (5,2,'Daniel Whitmore','Saint John','NB','danielwhitmore77@icloud.com','506-288-6247');
insert into Player values (6,2,'Emily Parker','Fredericton','NB','emily.parker@gmail.com','506-289-3408');
insert into Player values (7,2,'Jimmy McNulty','Moncton','NB','Mcnulty125@outlook.com','506-295-5823');
insert into Player values (8,2,'Abigail Foster','Miramichi','NB','abigail.foster@hotmail.com','506-307-4268');
insert into Player values (9,3,'Connor Mitchell','Bathurst','NB','connor.mitchell@yahoo.ca','506-350-7294');
insert into Player values (10,3,'Hannah Sullivan','Saint John','NB','hannah.sullivan@icloud.com','506-313-6517');
insert into Player values (11,3,'Benjamin Hayes','Fredericton','NB','benjamin.hayes@gmail.com','506-300-4835');
insert into Player values (12,3,'Rachel Donovan','Moncton','NB','rachel.donovan@outlook.com','506-317-6042');
insert into Player values (13,4,'Alexander Reid','Dieppe','NB','alex.reid@hotmail.com','506-383-2759');
insert into Player values (14,4,'Madison Fletcher','Saint John','NB','madison.fletcher@yahoo.com','506-318-5486');
insert into Player values (15,4,'Jacob Sinclair','Fredericton','NB','jacob.sinclair@icloud.com','506-304-7321');
insert into Player values (16,4,'Lauren Collins','Truro','NS','lauren.collins@gmail.com','902-893-6142');
insert into Player values (17,5,'Matthew Callahan','Miramichi','NB','matt.callahan63@outlook.com','506-308-5743');
insert into Player values (18,5,'Victoria Ellis','Bathurst','NB','victoria.ellis@hotmail.com','506-226-6841');
insert into Player values (19,5,'Ryan Gallagher','Halifax','NS','ryan.gallagher@yahoo.ca','902-932-3768');
insert into Player values (20,5,'Natalie Prescott','Sydney','NS','natalie.prescott@gmail.com','902-919-4257');
insert into Player values (21,6,'Harold Jenkins','Quispamsis','NB','harold.jenkins@outlook.com','506-678-5558');
insert into Player values (22,6,'Milo Klark','Toronto','ON','milo.klark@outlook.com','416-555-3323');
insert into Player values (23,6,'Kosh Jameson','Montreal','QU','kosh.jameson@gmail.com','263-234-1156');
insert into Player values (24,6,'Benny Potters','Edmonton','AL','ben.potters.@yahoo.com','587-980-0080');
insert into Player values (25,7,'Gomer Pinson','Fredericton','NB','gomer.pinson@gmail.com','506-225-8198');
insert into Player values (26,7,'Large Pinson','Fredericton','NB','large.pinson@gmail.com','506-343-1115');
insert into Player values (27,7,'Jabbie Pinson','Fredericton','NB','jabbie.pinson@gmail.com','428-990-9909');
insert into Player values (28,7,'Lart Pinson','Fredericton','NB','lart.pinson@gmail.com','428-323-6654');
insert into Player values (29,8,'Michael Lash','Saint John','NB','scaryMichael@gmail.com','506-325-2567');
insert into Player values (30,8,'Archibald J. Fetid','Moncton','NB','nastyMike@yahoo.com','428-444-4456');
insert into Player values (31,8,'Dave Strider','Regina','SK','turntechGodhead@yahoo.com','306-224-7830');
insert into Player values (32,8,'Salacious J, Freak','Victoria','BC','foul.stench@aol.com','778-668-6767');
insert into Player values (33,9,'Michael De Santa','Los Angeles','CA','michael.de.santa@gtav.com','328-555-0108');
insert into Player values (34,9,'Franklin Clinton','Los Angeles','CA','franklin.clinton@gtav.com','328-555-0156');
insert into Player values (35,9,'Trevor Philips','Los Angeles','CA','trevor.philips@gtav.com','273-555-0136');
insert into Player values (36,9,'Carl Johnson','San Andreas','CA','carl.johnson@gtasa.com','323-555-0192');
insert into Player values (37,10,'Thomas Morgan','Saint John','NB','thomas.morgan@outlook.com','506-882-8356');
insert into Player values (38,10,'Lily Dylan','Saint John','NB','lily.dylan@outlook.com','506-882-8350');
insert into Player values (39,10,'Kelly Henderson','Saint John','NB','kelly.henderson@outlook.com','506-882-4168');
insert into Player values (40,10,'Lola Armstrong','Saint John','NB','lola.armstrong@outlook.com','506-882-3250');
insert into Player values (41, 11, 'Harrison Ford', 'Jackson', 'WY', 'hford@gmail.com', '506-223-1212');
insert into Player values (42, 11, 'Mark Hamill', 'Los Angeles', 'CA', 'markhamill@gmail.com', '506-222-1555');
insert into Player values (43, 11, 'Carrie Fisher', 'Alderaan', 'IR', 'rebelleader@star.com', '506-144-1224');
insert into Player values (44, 11, 'Darth Vader', 'Death Star', 'MR', 'anakinskywalker@jedi.com', '506-145-2515');
insert into Player values (45, 12, 'Sheev Palpatine', 'Death Star', 'MR', 'notasithlord@evil.com', '506-066-0066');
insert into Player values (46, 12, 'Yoda', 'Jedi Temple', 'CT', 'oldasheck@gmail.com', '506-102-1557');
insert into Player values (47, 12, 'Ryan Gosling', 'Cornwall', 'ON', 'ryangosling@gmail.com', '506-126-8887');
insert into Player values (48, 12, 'Leslie Nielson', 'Regina', 'SK', 'lnielson@gmail.com', '506-561-7260');
insert into Player values (49, 13, 'Joseph Joestar', 'New York City', 'NY', 'newyorkcityslacker@gmail.com', '506-111-1552');
insert into Player values (50, 13, 'Josuke Higashikata', 'Morioh', 'MP', 'ragingpanda103@gmail.com', '506-535-1958');
insert into Player values (51, 13, 'Giorno Giovanna', 'Naples', 'CP', 'giogio1985@gmail.com', '506-195-2055');
insert into Player values (52, 13, 'Jolyne Cujoh', 'Tampa', 'FL', 'greendolphincontact@hotmail.com', '506-129-4044');
insert into Player values (53, 14, 'Bruce Wayne', 'Gotham City', 'IL', 'notbatman@gmail.com', '506-124-3535');
insert into Player values (54, 14, 'Clark Kent', 'Metropolis', 'IL', 'notsuperman@gmail.com', '506-121-1556');
insert into Player values (55, 14, 'Mr Boss', 'Miramichi', 'NB', 'smilingfriends@gmail.com', '506-151-6622');
insert into Player values (56, 14, 'Bizarro Flash', 'Earth', 'PE', 'bizarro@gmail.com', '506-999-9999');
insert into Player values (57, 15, 'Homelander', 'New York City', 'NY', 'homelander@vought.com', '202-395-3080');
insert into Player values (58, 15, 'A-Train', 'New York City', 'NY', 'atrain@vought.com', '202-395-3080');
insert into Player values (59, 15, 'The Deep', 'New York City', 'NY', 'deep@vought.com', '202-395-3080');
insert into Player values (60, 15, 'Black Noir', 'New York City', 'NY', 'blacknoir@vought.com', '202-395-3080');
insert into Player values (61, 16, 'Jimmy Pinhead', 'Kelowna', 'BC', 'jimmy.pin@gmail.com', '250-112-3456');
insert into Player values (62, 16, 'Suzie Pinhead', 'Kelowna', 'BC', 'spinhead01@hotmail.com', '250-910-0329');
insert into Player values (63, 16, 'Dave Pinhead', 'Kelowna', 'BC', 'dave.pinhead@gmail.com', '250-239-2839');
insert into Player values (64, 16, 'Melanie Pinhead', 'Kelowna', 'BC', 'melpinhead111@outlook.com', '250-678-0000');
insert into Player values (65, 17, 'Rex Splode', 'Chicago', 'IL', 'mantzoukas@globeguards.com', '312-999-9932');
insert into Player values (66, 17, 'Zandale Randolph', 'Chicago', 'IL', 'pharoah@globeguards.com', '773-003-3293');
insert into Player values (67, 17, 'Rus Livingston', 'Underground Martian City', 'MA', 'schwartz@globeguards.com', '773-030-2020');
insert into Player values (68, 17, 'Rudolph Conners', 'Chicago', 'IL', 'marquand@globeguards.com', '773-123-4567');
insert into Player values (69, 18, 'Jimmy McGill', 'Cicero', 'IL', 'jimmy.mcgill@outlook.com', '643-562-6418');
insert into Player values (70, 18, 'Mike Ehrmantraut', 'Philadelphia', 'PA', 'mike.ehr@outlook.com', '255-269-1611');
insert into Player values (71, 18, 'Lydia Rodarte-Quayle', 'Glasgow', 'SL', 'lydia.rodarte@outlook.com', '255-754-1247');
insert into Player values (72, 18, 'Kim Wexler', 'Red Cloud', 'NB', 'kim.wexler@outlook.com', '255-842-2484');
insert into Player values (73, 19, 'Ed Harris', 'Atlantic City', 'NJ', 'ed.harris14@outlook.com', '882-982-3578');
insert into Player values (74, 19, 'Viggo Mortensen', 'Watertown', 'NU', 'viggo.mortensen67@outlook.com', '882-294-5964');
insert into Player values (75, 19, 'Jeremy Irons', 'Cowes', 'QC', 'jeremy.ironss@outlook.com', '882-674-2478');
insert into Player values (76, 19, 'Lance Henricksen', 'Manhattan', 'YT', 'lance.hens14@hotmail.com', '656-358-3739');
insert into Player values (77, 20, 'John Helldiver', 'Gun', 'AB', 'john.helldiv4@hotmail.com', '656-557-3268');
insert into Player values (78, 20, 'Coretta Kelly', 'Port Mercy', 'MB', 'halo.enjoyer@hotmail.com', '656-136-4854');
insert into Player values (79, 20, 'General Brasch', 'No City is Worthy', 'SE', 'brash.gen143@hotmail.com', '345-234-9341');
insert into Player values (80, 20, 'Shipmaster Ingaki', 'St. Mary', 'NS', 'shipper.inaki@hotmail.com', '656-439-3523');
insert into Player values (81, 21, 'Brittany Wilcox', 'Saint John', 'NB', 'bwilcox@gmail.com', '506-798-7896');
insert into Player values (82, 21, 'Brooke Wilson', 'Saint John', 'NB', 'bwilson@gmail.com', '506-996-9865');
insert into Player values (83, 21, 'Tammy Wilcox', 'Saint John', 'NB', 'twilcox@live.ca', '708-896-7896');
insert into Player values (84, 21, 'Morgan Wilson', 'Saint John', 'NB', 'mwilson@icloud.ca', '489-888-9632');
insert into Player values (85, 22, 'Bella Swan', 'Forks', 'WA', 'loca@gmail.com', '519-889-9631');
insert into Player values (86, 22, 'Edward Cullen', 'Forks', 'WA', 'eddy@live.ca', '506-789-9635');
insert into Player values (87, 22, 'Charlie Swan', 'Forks', 'WA', 'thechief@forkspd.ca', '569-999-7896');
insert into Player values (88, 22, 'Rosalie Cullen', 'Forks', 'WA', 'rose@gmail.com', '456-896-7899');
insert into Player values (89, 23, 'Bob Green', 'Halifax', 'NS', 'bgreen@hotmail.com', '459-888-7896');
insert into Player values (90, 23, 'Tom Hanks', 'Halifax', 'NS', 'tommy@gmail.com', '456-963-7412');
insert into Player values (91, 23, 'Timmy Turner', 'Halifax', 'NS', 'tt@gmail.com', '963-999-7896');
insert into Player values (92, 23, 'Bill Clinton', 'Halifax', 'NS', 'billyc@icloud.com', '506-666-3697');
insert into Player values (93, 24, 'Travic Kelce', 'Toronto', 'ON', 'travyy@swifty.com', '456-896-7896');
insert into Player values (94, 24, 'Pat Mcgrath', 'Toronto', 'ON', 'pattypat@gmail.com', '456-789-8523');
insert into Player values (95, 24, 'Selena Gomez', 'Toronto', 'ON', 'selenerrare@rare.com', '546-789-4123');
insert into Player values (96, 24, 'Taylor Swift', 'Toronto', 'ON', 'ttpd@ttpd.ca', '698-896-8745');
insert into Player values (97, 25, 'Betty Jones', 'Sussex', 'NB', 'bettyj@gmail.com', '506-654-7753');
insert into Player values (98, 25, 'Willow Smith', 'Sussex', 'NB', 'willows@gmail.com', '506-789-8896');
insert into Player values (99, 25, 'Daisy Mae', 'Sussex', 'NB', 'daisy@hotmail.com', '506-789-5555');
insert into Player values (100, 25, 'Ivy Wilde', 'Sussex', 'NB', 'ivyw@live.com', '506-789-7777');
insert into Player values (101,26,'Josh Newman','Saint Andrews','NB','newjosh@yahoo.com','506-886-0988');
insert into Player values (102,26,'Daniel Samson','Saint John','NB','samsond@gmail.com','506-779-3445');
insert into Player values (103,26,'Katharina Celsco','Toronto','ON','kcelsco@outlook.com','416-355-0087');
insert into Player values (104,26,'Ronaldinho Cesear','Sao Paolo','BR','ronaldcesear@gmail.com','198-994-7345');
insert into Player values (105,27,'Olamide Olorunseun','Lagos','NG','olamideolorunseun@gmail.com','234-217-4005');
insert into Player values (106,27,'Ethan DaGuy','Miramichi','NB','daguy@yahoo.com','506-334-6888');
insert into Player values (107,27,'Silver Long','Abbotsford','BC','longsilv@yahoo.com','510-433-1253');
insert into Player values (108,27,'Peter Frank','Manchester','UK','frankpete@outlook.com','440-145-0987');
insert into Player values (109,28,'Michael Buble','London','UK','bublemsound@gmail.com','440-773-0978');
insert into Player values (110,28,'James Blake','Scranton','PA','jamesblake@gmail.com','232-990-7835');
insert into Player values (111,28,'Regent Thragg','Viltrum','VI','regent@gmail.com','123-098-8768');
insert into Player values (112,28,'Genghis Fan','Ottawa','ON','fangenghis@outlook.com','417-097-2674');
insert into Player values (113,29,'Polly Grand','Saint John','NB','pollygrand@gmail.com','506-334-4822');
insert into Player values (114,29,'Astro Bouy','Miramichi','NB','theebouy@yahoo.com','506-665-0285');
insert into Player values (115,29,'Rico Gonzalez','Sao Paolo','BR','ricog@gmail.com','198-759-3354');
insert into Player values (116,29,'Saint Minimum','Saint Andrews','NB','minimumsaint@gmail.com','506-775-9872');
insert into Player values (117,30,'Champagne Papi','Toronto','ON','aubreygraham@yahoo.com','416-984-9395');
insert into Player values (118,30,'Winston Burchill','Moncton','NB','burchwin@gmail.com','506-433-9143');
insert into Player values (119,30,'Chris Hansen','San Francisco','SF','hansenchris@gmail.com','415-483-9834');
insert into Player values (120,30,'Dave','London','UK','santan@gmail.com','440-224-9932');
insert into Player values (121, 31, 'John Michaels', 'Saint John', 'NB', 'jmichaels@gmail.com', '506-456-7847');
insert into Player values (122, 31, 'Raymond Dubly', 'Rosthey', 'NB', 'rayray320@hotmail.com', '506-897-1111');
insert into Player values (123, 31, 'Gordon Tyme', 'Charlottetown', 'PE', 'itsgordtyme@hotmail.com', '902-589-7742');
insert into Player values (124, 31, 'Liam Wilkins', 'Halifax', 'NS', 'liam.wilkins@gmail.com', '902-774-6348');
insert into Player values (125, 32, 'Trent Riply', 'New Glassgow', 'NS', 'trentthegent@hotmail.com', '782-348-8721');
insert into Player values (126, 32, 'Ryan Franks', 'Fredericton', 'NB', 'ryanfranks442@outlook.com', '506-997-4167');
insert into Player values (127, 32, 'Timothy Richards', 'Moncton', 'NB', 'timthetinman2@yahoo.com', '506-331-7441');
insert into Player values (128, 32, 'Velma Hubbards', 'Quebec City', 'QC', 'velma.hubbards@yahoo.com', '418-884-9964');
insert into Player values (129, 33, 'Rick Johnson', 'Miramichi', 'NB', 'rickyj99@hotmail.com', '506-452-8742');
insert into Player values (130, 33, 'Donald Roberts', 'Saint John', 'NB', 'd.roberts86@gmail.com', '506-333-4716');
insert into Player values (131, 33, 'Robert Haynes', 'Quispamsis', 'NB', 'haynesr333@gmail.com', '506-788-1547');
insert into Player values (132, 33, 'Kayla Sykes', 'Summerside', 'PE', 'ksykes22@hotmail.com', '902-555-8795');
insert into Player values (133, 34, 'Thomas Flownder', 'Saint John', 'NB', 't.flownder@gmail.com', '506-555-2351');
insert into Player values (134, 34, 'Sharon Marquez', 'Toronto', 'ON', 's.marquez@gmail.com', '249-555-5892');
insert into Player values (135, 34, 'Frankie White', 'Burnaby', 'BC', 'f.white420@yahoo.com', '236-842-2313');
insert into Player values (136, 34, 'Jason Williams', 'London', 'ON', 'jasonnn92@hotmail.com', '249-523-9562');
insert into Player values (137, 35, 'Kimberly Brown', 'Rosthey', 'NB', 'kimkim1978@live.ca', '506-678-2219');
insert into Player values (138, 35, 'Roy Waxer', 'Saint John', 'NB', 'waxer899@proton.me', '506-789-3482');
insert into Player values (139, 35, 'Jeff Kirkpatrick', 'St Stephen', 'NB', 'jjwilds4242@gmail.com', '506-642-2211');
insert into Player values (140, 35, 'Steve Buscemi', 'Cornwall', 'PE', 'itsmeSteve@stevesteve.com', '506-323-5421');
insert into Player values (141,36,'Jamie Doman','Saint John','NB','jamie.doman@gmail.com','506-391-5409');
insert into Player values (142,36,'Russell Griswold','Chicago','IL','russell.griswold@yahoo.ca','312-274-7141');
insert into Player values (143,36,'Alex Vance','New Mexico','NM','alex.vance2@yahoo.ca','575-323-2020');
insert into Player values (144,36,'Owen Wonne','Saint John','NB','owen.wonne@outlook.com','506-122-1693');
insert into Player values (145,37,'McLovin','Honululu','HI','mclovin@gmail.com','060-147-8744');
insert into Player values (146,37,'Brody Sailor','Saint John','NB','TheSleepyDog@gmail.com','506-658-8387');
insert into Player values (147,37,'Sam Altman','San Francisco','SF','TheAIGuy@openai.co','666-999-7777');
insert into Player values (148,37,'John Deadlock','Springfield','AB','TheLockiestOfTheDead@yahoo.ca','506-690-6769');
insert into Player values (149,38,'Abigail Callaghan','San Francisco','SF','abigail.callaghan@gmail.com','415-211-1420');
insert into Player values (150,38,'Lex Luthor','New York','NY','SupermanStinks@yahoo.ca','212-1938-044');
insert into Player values (151,38,'Connie Layes','Saint John','NB','Breezyday777@yahoo.ca','506-642-1629');
insert into Player values (152,38,'Wade Wilson','San Francisco','SF','wade4eva@yahoo.ca','415-120-1206');
insert into Player values (153,39,'Joe Mama','Gotham','DC','JoeTheBeast@gmail.com','600-900-7000');
insert into Player values (154,39,'Jim Lahey','Dartmouth','NS','Lahey@sunnyvale.ca','307-345-9987');
insert into Player values (155,39,'Rita Martin','Amhurst','NS','Rita.Martin@yahoo.com','506-234-0192');
insert into Player values (156,39,'Emily French','Dieppe','NB','Emily.Paris@outlook.com','506-405-1098');
insert into Player values (157,40,'Sophie Chatterton','Hillsdale','NB','SophieChats@yahoo.com','506-777-9056');
insert into Player values (158,40,'Kailey Roberts','Saint John','NB','kaileybaby@hotmail.com','506-650-2222');
insert into Player values (159,40,'Rory Hughes','Halifax','NS','hughes@outlook.com','506-329-7654');
insert into Player values (160,40,'Steve Harrington','Hawkins','IN','kingsteve@gmail.com','506-721-1234');
insert into Player values (161,41,'Daniel Brooks','Saint John','NB','daniel.brooks@gmail.com','506-555-0101');
insert into Player values (162,41,'Sarah Mitchell','Toronto','ON','sarah.mitchell@gmail.com','416-555-0102');
insert into Player values (163,41,'James Carter','Halifax','NS','james.carter@gmail.com','902-555-0103');
insert into Player values (164,41,'Emily Parker','Moncton','NB','emily.parker@gmail.com','506-555-0104');
insert into Player values (165,42,'Michael Thompson','Calgary','AB','michael.thompson@gmail.com','403-555-0105');
insert into Player values (166,42,'David Wilson','Fredericton','NB','david.wilson@outlook.com','506-555-0106');
insert into Player values (167,42,'Andrew Collins','Quispamsis','NB','andrew.collins@gmail.com','506-555-0107');
insert into Player values (168,42,'Joshua Bennett','Rothesay','NB','joshua.bennett@gmail.com','506-555-0108');
insert into Player values (169,43,'Jessica Morgan','Montreal','QC','jessica.morgan@gmail.com','514-555-0109');
insert into Player values (170,43,'Olivia Harris','Dieppe','NB','olivia.harris@outlook.com','506-555-0110');
insert into Player values (171,43,'Hannah Cooper','Moncton','NB','hannah.cooper@outlook.com','506-555-0111');
insert into Player values (172,43,'Sophia Edwards','Saint John','NB','sophia.edwards@outlook.com','506-555-0112');
insert into Player values (173,44,'Ethan Walker','Regina','SK','ethan.walker@gmail.com','306-555-0113');
insert into Player values (174,44,'Liam Robinson','Miramichi','NB','liam.robinson@gmail.com','506-555-0114');
insert into Player values (175,44,'Noah Campbell','Bathurst','NB','noah.campbell@outlook.com','506-555-0115');
insert into Player values (176,44,'Ava Peterson','St. John''s','NL','ava.peterson@outlook.com','709-555-0116');
insert into Player values (177,45,'Robert Anderson','Sussex','NB','robert.anderson@gmail.com','506-555-0117');
insert into Player values (178,45,'Patricia Lewis','Quebec City','QC','patricia.lewis@outlook.com','418-555-0118');
insert into Player values (179,45,'William Scott','Fredericton','NB','william.scott@gmail.com','506-555-0119');
insert into Player values (180,45,'Margaret Turner','Kelowna','BC','margaret.turner@gmail.com','250-555-0120');
insert into Player values (181, 46, 'Pedri Gonzalez', 'Barcelona', 'CT', 'pedri.gonzalez@fcb.com', '647-293-1825');
insert into Player values (182, 46, 'Lamine Yamal', 'Barcelona', 'CT', 'lamine.yamal@fcb.com', '438-671-9002');
insert into Player values (183, 46, 'Alejandro Balde', 'Barcelona', 'CT', 'alejandro.balde@fcb.com', '514-882-7496');
insert into Player values (184, 46, 'Fermin Lopez', 'Barcelona', 'CT', 'fermin.lopez@fcb.com', '289-350-4611');
insert into Player values (185, 47, 'Anthony Stewart The IVth', 'Amsterdam', 'ZE', 'anthony.iv.stewart@royalwave.com', '416-720-3928');
insert into Player values (186, 47, 'Josselyn Montpellieur', 'Bordeaux', 'NA', 'josselyn.monty@velvetmail.net', '437-554-0067');
insert into Player values (187, 47, 'Dresden Dusseldorf', 'Dortmund', 'NW', 'dresden.dd@nightbyte.io', '905-778-2394');
insert into Player values (188, 47, 'Dr. Remira Istambuli ', 'Ankara', 'AN', 'dr.remira.i@medinex.org', '204-613-5579');
insert into Player values (189, 48, 'Lionel Pessi', 'Rosario', 'SF', 'lionelpessi@goatmail.com', '613-972-4446');
insert into Player values (190, 48, 'Cristiano Penaldo', 'Funchal', 'MA', 'cpenaldo@kickzone.com', '705-663-1820');
insert into Player values (191, 48, 'Kylian Mbappenal', 'Paris', 'PA', 'kylian.mbapp@hypergoal.net', '782-290-5113');
insert into Player values (192, 48, 'Robert Lewangoalski', 'Warsaw', 'PO', 'robert.lg@strikemail.com', '902-714-2608');
insert into Player values (193, 49, 'Vivian Thompson', 'Indianapolis', 'IN', 'vivian.t@aurora-mail.com', '628-337-9010');
insert into Player values (194, 49, 'Anna Franks', 'Frankfurt', 'GE', 'anna.f@outlook.com', '310-840-9934');
insert into Player values (195, 49, 'Joan of Arc', 'Domremy-la-Pucelle', 'FR', 'joan.arc@flameborn.co', '312-670-5290');
insert into Player values (196, 49, 'Rosa Parks', 'Tuskegee', 'AL', 'rosa.p@couragehub.com', '415-907-2864');
insert into Player values (197, 50, 'Mark Zuckerberg', 'New York', 'NY', 'mark.z@metanet.ai', '236-419-8752');
insert into Player values (198, 50, 'Kevin Systrom', 'Hollinston', 'MA', 'kevin.s@pixlane.com', '778-302-6619');
insert into Player values (199, 50, 'Jack Patrick Dorsey', 'San Luis', 'MI', 'jack.pd@skycode.dev', '587-924-1035');
insert into Player values (200, 50, 'Evan Spiegel ', 'Los Angeles', 'CA', 'evan.s@ghostlabs.app', '431-667-2984');

COMMIT;
-- The End --
