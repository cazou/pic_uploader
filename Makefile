install:
	install -m 733 pic_uploader.sh /usr/bin/pic_uploader.sh
	install -m 644 pic_uploader.service /etc/systemd/system/pic_uploader.service
	install -m 644 pic_uploader.timer /etc/systemd/system/pic_uploader.timer
	systemctl daemon-reload
	systemctl enable pic_uploader.timer
	systemctl start pic_uploader.timer
