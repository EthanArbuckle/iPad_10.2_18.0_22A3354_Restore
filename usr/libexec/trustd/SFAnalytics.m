@implementation SFAnalytics

- (void)trustd_logDetailedEventforEventNamed:(id)a3 attributesCallback:(id)a4 timestampBucket:(unsigned int)a5
{
  id v8;
  uint64_t (**v9)(_QWORD);
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint32_t v18;
  float v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  unsigned int v25;
  _QWORD block[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = (uint64_t (**)(_QWORD))a4;
  v10 = v8;
  if (qword_100082BC8)
  {
    sub_1000144B0((void *)qword_100082BC0);
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = sub_1000315DC;
    v33 = sub_1000315EC;
    v34 = 0;
    v11 = qword_100082BC8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AD2C;
    block[3] = &unk_100076C80;
    v27 = v10;
    v28 = &v29;
    dispatch_sync(v11, block);
    v12 = (id)v30[5];

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v12 = 0;
  }

  v13 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.security"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v10));
  objc_msgSend(v14, "appendString:", CFSTR("AnalyticsRate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", v14));
  if (v15 && (v16 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v15, v16) & 1) != 0))
  {
    v17 = v15;

    v12 = v17;
  }
  else if (!v12)
  {
    goto LABEL_12;
  }
  v18 = arc4random();
  objc_msgSend(v12, "unsignedIntValue");
  objc_msgSend(v12, "floatValue");
  if ((float)(4295000000.0 / v19) >= (float)v18)
  {
    v20 = v9[2](v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (v21)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100021484;
      v22[3] = &unk_100079178;
      v22[4] = self;
      v23 = v10;
      v24 = v21;
      v25 = a5;
      sub_100017240(v22);

    }
  }
LABEL_12:

}

- (void)trustd_logDetailedEventforEventNamed:(id)a3 attributesCallback:(id)a4
{
  -[SFAnalytics trustd_logDetailedEventforEventNamed:attributesCallback:timestampBucket:](self, "trustd_logDetailedEventforEventNamed:attributesCallback:timestampBucket:", a3, a4, 0);
}

@end
