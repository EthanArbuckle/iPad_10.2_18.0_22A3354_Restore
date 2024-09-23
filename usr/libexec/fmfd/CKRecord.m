@implementation CKRecord

- (void)updateFromFence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("location"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("label"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "locationType")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("locationType"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placemark"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "locality"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("placemark_locality"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placemark"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "administrativeArea"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("placemark_administrativeArea"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placemark"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "country"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("placemark_country"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placemark"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "state"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("placemark_state"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placemark"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "streetAddress"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("placemark_streetAddress"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placemark"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "streetName"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("placemark_streetName"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "schedule"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v29, "startHour")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("schedule_startHour"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "schedule"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "startMin")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("schedule_startMin"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "schedule"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v35, "endHour")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, CFSTR("schedule_endHour"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "schedule"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v38, "endMin")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, CFSTR("schedule_endMin"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "schedule"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v41, "daysOfWeek")));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, CFSTR("schedule_daysOfWeek"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "schedule"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "timeZone"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "name"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, CFSTR("schedule_timeZone"));

  v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "muteEndDate"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v49, CFSTR("fence_muteEndDate"));

}

@end
