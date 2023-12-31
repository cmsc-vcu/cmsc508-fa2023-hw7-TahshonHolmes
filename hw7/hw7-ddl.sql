# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS roles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id INT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(4096),
    tag VARCHAR(255),
    url VARCHAR(4096),
    time_commitment VARCHAR(255),
    PRIMARY KEY (id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment) VALUES
    (1, 'Skill 1', 'Description for Skill 1', 'Category 1', 'url1', 'High'),
    (2, 'Skill 2', 'Description for Skill 2', 'Category 2', 'url2', 'Medium'),
    (3, 'Skill 3', 'Description for Skill 3', 'Category 1', 'url3', 'Low'),
    (4, 'Skill 4', 'Description for Skill 4', 'Category 3', 'url4', 'Medium'),
    (5, 'Skill 5', 'Description for Skill 5', 'Category 2', 'url5', 'High'),
    (6, 'Skill 6', 'Description for Skill 6', 'Category 3', 'url6', 'Low'),
    (7, 'Skill 7', 'Description for Skill 7', 'Category 1', 'url7', 'Medium'),
    (8, 'Skill 8', 'Description for Skill 8', 'Category 2', 'url8', 'High');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int,
    first_name varchar(256) NOT NULL,
    last_name varchar(256) NOT NULL,
    email varchar(256),
    linkedin_url varchar(256),
    headshot_url varchar(256),
    discord_handle varchar(256),
    brief_bio varchar(4096),
    date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES
    (1, 'John', 'Person 1', 'john.person1@example.com', 'https://www.linkedin.com/in/johnperson1', 'headshot1.jpg', 'john.person1#1234', 'Experienced developer with a passion for coding.', '2023-11-01'),
    (2, 'Jane', 'Person 2', 'jane.person2@example.com', 'https://www.linkedin.com/in/janeperson2', 'headshot2.jpg', 'jane.person2#5678', 'Creative designer with an eye for detail.', '2023-11-02'),
    (3, 'Michael', 'Person 3', 'michael.person3@example.com', 'https://www.linkedin.com/in/michaelperson3', 'headshot3.jpg', 'michael.person3#9101', 'Aspiring developer eager to learn and grow.', '2023-11-03'),
    (4, 'Emily', 'Person 4', 'emily.person4@example.com', 'https://www.linkedin.com/in/emilyperson4', 'headshot4.jpg', 'emily.person4#1121', 'Passionate designer with a unique perspective.', '2023-11-04'),
    (5, 'Daniel', 'Person 5', 'daniel.person5@example.com', 'https://www.linkedin.com/in/danielperson5', 'headshot5.jpg', 'daniel.person5#3141', 'Enthusiastic developer with a focus on innovation.', '2023-11-05'),
    (6, 'Olivia', 'Person 6', 'olivia.person6@example.com', 'https://www.linkedin.com/in/oliviaperson6', 'headshot6.jpg', 'olivia.person6#5161', 'Detail-oriented designer with a flair for creativity.', '2023-11-06'),
    (7, 'Robert', 'Person 7', 'robert.person7@example.com', 'https://www.linkedin.com/in/robertperson7', 'headshot7.jpg', 'robert.person7#7181', 'Innovative developer with a keen interest in new technologies.', '2023-11-07'),
    (8, 'Samantha', 'Person 8', 'samantha.person8@example.com', 'https://www.linkedin.com/in/samanthaperson8', 'headshot8.jpg', 'samantha.person8#9201', 'Versatile designer with a passion for user experience.', '2023-11-08'),
    (9, 'William', 'Person 9', 'william.person9@example.com', 'https://www.linkedin.com/in/williamperson9', 'headshot9.jpg', 'william.person9#1221', 'Dedicated developer committed to delivering high-quality code.', '2023-11-09'),
    (10, 'Sophia', 'Person 10', 'sophia.person10@example.com', 'https://www.linkedin.com/in/sophiaperson10', 'headshot10.jpg', 'sophia.person10#3341', 'Creative designer with a focus on modern and elegant designs.', '2023-11-10');

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.
CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    PRIMARY KEY (id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES
    (1, 1, '2023-02-01'), (3, 1, '2023-02-01'), (6, 1, '2023-02-01'),
    (3, 2, '2023-03-01'), (4, 2, '2023-03-01'), (5, 2, '2023-03-01'),
    (1, 3, '2023-04-01'), (5, 3, '2023-04-01'),
    (3, 5, '2023-06-01'), (6, 5, '2023-06-01'),
    (2, 6, '2023-07-01'), (3, 6, '2023-07-01'), (4, 6, '2023-07-01'),
    (3, 7, '2023-08-01'), (5, 7, '2023-08-01'), (6, 7, '2023-08-01'),
    (1, 8, '2023-09-01'), (3, 8, '2023-09-01'), (5, 8, '2023-09-01'), (6, 8, '2023-09-01'),
    (2, 9, '2023-10-01'), (5, 9, '2023-10-01'), (6, 9, '2023-10-01'),
    (1, 10, '2023-11-01'), (4, 10, '2023-11-01'), (5, 10, '2023-11-01');

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles
CREATE TABLE roles (
    id INT,
    name VARCHAR(255),
    sort_priority INT,
    PRIMARY KEY (id)
);

--


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)
INSERT INTO roles (id, name, sort_priority) VALUES
    (10, 'Designer', 10),
    (20, 'Developer', 20),
    (30, 'Recruit', 30),
    (40, 'Team Lead', 40),
    (50, 'Boss', 50),
    (60, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment
CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_role_acquired DATE NOT NULL,
    PRIMARY KEY (id)
);



# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_role_acquired)
VALUES
    (1, 1, '2023-11-01'), -- Person 1 is Developer
    (2, 5, '2023-11-02'), (2, 6, '2023-11-02'), -- Person 2 is Boss, Mentor
    (3, 1, '2023-11-03'), (3, 4, '2023-11-03'), -- Person 3 is Developer and Team Lead
    (4, 3, '2023-11-04'), -- Person 4 is Recruit
    (5, 3, '2023-11-05'), -- person 5 is Recruit
    (6, 1, '2023-11-06'), (6, 2, '2023-11-06'), -- Person 6 is Developer and Designer
    (7, 2, '2023-11-07'), -- Person 7 is Designer
    (8, 2, '2023-11-08'), (8, 4, '2023-11-08'), -- Person 8 is Designer and Team Lead
    (9, 1, '2023-11-09'), -- Person 9 is Developer
    (10, 1, '2023-11-10'), (10, 2, '2023-11-10'); -- Person 10 is Developer and Designer
