USE vk;
 DROP TABLE IF EXISTS black_list;
 CREATE TABLE black_list(
	blocker_user_id BIGINT UNSIGNED NOT NULL,
    blocked_user_id BIGINT UNSIGNED NOT NULL,
 	`status` ENUM('blocked', 'unblocked'),
 	requested_at DATETIME DEFAULT NOW(),
	confirmed_at DATETIME,
	
 	PRIMARY KEY (blocker_user_id, blocked_user_id),
	INDEX (blocker_user_id),
    INDEX (blocked_user_id),
    FOREIGN KEY (blocker_user_id) REFERENCES users(id),
    FOREIGN KEY (blocked_user_id) REFERENCES users(id)
);
 	
DROP TABLE IF EXISTS news_feed;
CREATE TABLE news_feed(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS news;
CREATE TABLE news(
	id SERIAL PRIMARY KEY,
	news_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	news_time DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (news_id) REFERENCES news_feed(id)
);

alter table likes
add news_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE vk.likes ADD CONSTRAINT likes_FK FOREIGN KEY (news_id) REFERENCES vk.news(id);
