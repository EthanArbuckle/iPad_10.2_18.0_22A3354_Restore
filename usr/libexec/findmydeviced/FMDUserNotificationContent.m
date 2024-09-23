@implementation FMDUserNotificationContent

- (FMDUserNotificationContent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDUserNotificationContent *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSString *v43;
  void *v44;
  void *v45;
  NSString *v46;
  void *v47;
  NSString *v48;
  void *v49;
  NSString *v50;
  void *v51;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)FMDUserNotificationContent;
  v6 = -[FMDUserNotificationContent init](&v53, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSString, v5);
    v8 = NSStringFromSelector("title");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDUserNotificationContent setTitle:](v6, "setTitle:", v10);

    v12 = objc_opt_class(NSString, v11);
    v13 = NSStringFromSelector("body");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v14));
    -[FMDUserNotificationContent setBody:](v6, "setBody:", v15);

    v17 = objc_opt_class(NSString, v16);
    v18 = NSStringFromSelector("categoryIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v19));
    -[FMDUserNotificationContent setCategoryIdentifier:](v6, "setCategoryIdentifier:", v20);

    v22 = objc_opt_class(NSString, v21);
    v23 = NSStringFromSelector("deviceId");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v24));
    -[FMDUserNotificationContent setDeviceId:](v6, "setDeviceId:", v25);

    v27 = objc_opt_class(NSString, v26);
    v28 = NSStringFromSelector("serialNumber");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v29));
    -[FMDUserNotificationContent setSerialNumber:](v6, "setSerialNumber:", v30);

    v32 = objc_opt_class(NSString, v31);
    v33 = NSStringFromSelector("identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v34));
    -[FMDUserNotificationContent setIdentifier:](v6, "setIdentifier:", v35);

    v37 = objc_opt_class(NSString, v36);
    v38 = NSStringFromSelector("locationTitle");
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v39));
    -[FMDUserNotificationContent setLocationTitle:](v6, "setLocationTitle:", v40);

    v42 = objc_opt_class(NSString, v41);
    v43 = NSStringFromSelector("locationMessage");
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v42, v44));
    -[FMDUserNotificationContent setLocationMessage:](v6, "setLocationMessage:", v45);

    v46 = NSStringFromSelector("latitude");
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    objc_msgSend(v4, "decodeDoubleForKey:", v47);
    -[FMDUserNotificationContent setLatitude:](v6, "setLatitude:");

    v48 = NSStringFromSelector("longitude");
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    objc_msgSend(v4, "decodeDoubleForKey:", v49);
    -[FMDUserNotificationContent setLongitude:](v6, "setLongitude:");

    v50 = NSStringFromSelector("interruptionLevel");
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    -[FMDUserNotificationContent setInterruptionLevel:](v6, "setInterruptionLevel:", objc_msgSend(v4, "decodeIntegerForKey:", v51));

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  double v29;
  double v30;
  NSString *v31;
  void *v32;
  double v33;
  double v34;
  NSString *v35;
  void *v36;
  unint64_t v37;
  NSString *v38;
  id v39;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUserNotificationContent title](self, "title"));
  v6 = NSStringFromSelector("title");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "encodeObject:forKey:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUserNotificationContent body](self, "body"));
  v9 = NSStringFromSelector("body");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "encodeObject:forKey:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUserNotificationContent categoryIdentifier](self, "categoryIdentifier"));
  v12 = NSStringFromSelector("categoryIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v4, "encodeObject:forKey:", v11, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUserNotificationContent deviceId](self, "deviceId"));
  v15 = NSStringFromSelector("deviceId");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v4, "encodeObject:forKey:", v14, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUserNotificationContent serialNumber](self, "serialNumber"));
  v18 = NSStringFromSelector("serialNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v4, "encodeObject:forKey:", v17, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUserNotificationContent identifier](self, "identifier"));
  v21 = NSStringFromSelector("identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v4, "encodeObject:forKey:", v20, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUserNotificationContent locationTitle](self, "locationTitle"));
  v24 = NSStringFromSelector("locationTitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v4, "encodeObject:forKey:", v23, v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUserNotificationContent locationMessage](self, "locationMessage"));
  v27 = NSStringFromSelector("locationMessage");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v4, "encodeObject:forKey:", v26, v28);

  -[FMDUserNotificationContent latitude](self, "latitude");
  v30 = v29;
  v31 = NSStringFromSelector("latitude");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  objc_msgSend(v4, "encodeDouble:forKey:", v32, v30);

  -[FMDUserNotificationContent longitude](self, "longitude");
  v34 = v33;
  v35 = NSStringFromSelector("longitude");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  objc_msgSend(v4, "encodeDouble:forKey:", v36, v34);

  v37 = -[FMDUserNotificationContent interruptionLevel](self, "interruptionLevel");
  v38 = NSStringFromSelector("interruptionLevel");
  v39 = (id)objc_claimAutoreleasedReturnValue(v38);
  objc_msgSend(v4, "encodeInteger:forKey:", v37, v39);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_categoryIdentifier, a3);
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)locationTitle
{
  return self->_locationTitle;
}

- (void)setLocationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_locationTitle, a3);
}

- (NSString)locationMessage
{
  return self->_locationMessage;
}

- (void)setLocationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_locationMessage, a3);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->_interruptionLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationMessage, 0);
  objc_storeStrong((id *)&self->_locationTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
