@implementation MTATimerPresetItem

+ (id)itemWithNumber:(int)a3 unit:(id)a4 duration:(double)a5 identifier:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  MTATimerPresetItem *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = *(_QWORD *)&a3;
  v9 = a6;
  v10 = a4;
  v11 = objc_opt_new(MTATimerPresetItem);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter mtDecimalStyleNumberFormatter](NSNumberFormatter, "mtDecimalStyleNumberFormatter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromNumber:", v13));
  -[MTATimerPresetItem setNumber:](v11, "setNumber:", v14);

  -[MTATimerPresetItem setUnit:](v11, "setUnit:", v10);
  -[MTATimerPresetItem setDuration:](v11, "setDuration:", a5);
  -[MTATimerPresetItem setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", v9);

  return v11;
}

+ (id)mockItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
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
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[12];

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_10009A4D0, 0));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-0")));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 1, v50, v49, 60.0));
  v52[0] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_10009A4D0, 0));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-1")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 2, v46, v45, 120.0));
  v52[1] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_10009A4D0, 0));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-2")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 3, v42, v41, 180.0));
  v52[2] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_10009A4D0, 0));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-3")));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 4, v38, v37, 240.0));
  v52[3] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_10009A4D0, 0));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-4")));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 5, v34, v33, 300.0));
  v52[4] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_10009A4D0, 0));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-5")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 10, v30, v29, 600.0));
  v52[5] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_10009A4D0, 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-6")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 15, v26, v25, 900.0));
  v52[6] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_10009A4D0, 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-7")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 20, v22, v21, 1200.0));
  v52[7] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_10009A4D0, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-8")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 30, v18, v17, 1800.0));
  v52[8] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_10009A4D0, 0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-9")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 45, v14, v2, 2700.0));
  v52[9] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HR"), &stru_10009A4D0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-10")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 1, v5, v6, 3600.0));
  v52[10] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("HR"), &stru_10009A4D0, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timer-11")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem itemWithNumber:unit:duration:identifier:](MTATimerPresetItem, "itemWithNumber:unit:duration:identifier:", 2, v9, v10, 7200.0));
  v52[11] = v11;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 12));

  return v13;
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

@end
