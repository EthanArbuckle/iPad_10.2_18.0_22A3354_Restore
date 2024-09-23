@implementation FMRequestFenceTrigger

- (void)deinitializeRequest
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMRequestFenceTrigger;
  -[FMRequest deinitializeRequest](&v3, "deinitializeRequest");
  -[FMRequestFenceTrigger setTriggeredLocation:](self, "setTriggeredLocation:", 0);
  -[FMRequestFenceTrigger setFence:](self, "setFence:", 0);
  -[FMRequestFenceTrigger setTriggerURL:](self, "setTriggerURL:", 0);
  -[FMRequestFenceTrigger setTriggerTimestamp:](self, "setTriggerTimestamp:", 0);
}

- (FMRequestFenceTrigger)initWithProvider:(id)a3 triggeredLocation:(id)a4 fence:(id)a5 validityDuration:(double)a6 triggerURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  FMRequestFenceTrigger *v15;
  FMRequestFenceTrigger *v16;
  void *v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FMRequestFenceTrigger;
  v15 = -[FMRequest initWithProvider:](&v19, "initWithProvider:", a3);
  v16 = v15;
  if (v15)
  {
    -[FMRequestFenceTrigger setTriggeredLocation:](v15, "setTriggeredLocation:", v12);
    -[FMRequestFenceTrigger setFence:](v16, "setFence:", v13);
    -[FMRequestFenceTrigger setTriggerURL:](v16, "setTriggerURL:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastTriggerTimestamp"));
    -[FMRequestFenceTrigger setTriggerTimestamp:](v16, "setTriggerTimestamp:", v17);

    -[FMRequestFenceTrigger setTriggerType:](v16, "setTriggerType:", objc_msgSend(v13, "lastTrigger"));
    -[FMRequestFenceTrigger setValidityDuration:](v16, "setValidityDuration:", a6);
  }

  return v16;
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
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
  double v17;
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
  int64_t v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v56;
  void *v57;
  _QWORD v58[3];
  _QWORD v59[3];

  v56.receiver = self;
  v56.super_class = (Class)FMRequestFenceTrigger;
  v3 = -[FMRequest requestBody](&v56, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "standardDeviceContext"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullDeviceInfo"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("deviceInfo"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timestamp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValueForServer"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
    objc_msgSend(v14, "coordinate");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("latitude"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
    objc_msgSend(v16, "coordinate");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("longitude"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
    objc_msgSend(v19, "horizontalAccuracy");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("horizontalAccuracy"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
    objc_msgSend(v21, "altitude");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("alt"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
    objc_msgSend(v23, "verticalAccuracy");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("vertAcc"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
    objc_msgSend(v25, "speed");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("speed"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
    objc_msgSend(v27, "course");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("course"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "floor"));

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggeredLocation](self, "triggeredLocation"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "floor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v32, "level")));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, CFSTR("floorLevel"));

    }
    objc_msgSend(v13, "fm_safelyMapKey:toObject:", CFSTR("timestamp"), v12);
  }
  else
  {
    v58[0] = CFSTR("latitude");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger fence](self, "fence"));
    objc_msgSend(v12, "latitude");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v59[0] = v34;
    v58[1] = CFSTR("longitude");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger fence](self, "fence"));
    objc_msgSend(v35, "longitude");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v59[1] = v36;
    v58[2] = CFSTR("horizontalAccuracy");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger fence](self, "fence"));
    objc_msgSend(v37, "radius");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v59[2] = v38;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 3));

  }
  v39 = -[FMRequestFenceTrigger triggerType](self, "triggerType");
  v40 = CFSTR("scheduled");
  if (v39 == 1)
    v40 = CFSTR("exit");
  if (!v39)
    v40 = CFSTR("enter");
  v41 = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger fence](self, "fence"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "fenceId"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v13, CFSTR("location"), v41, CFSTR("trigger"), v43, CFSTR("id"), 0));

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggerTimestamp](self, "triggerTimestamp"));
  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggerTimestamp](self, "triggerTimestamp"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringValueForServer"));

    objc_msgSend(v44, "setObject:forKeyedSubscript:", v47, CFSTR("triggerTimestamp"));
  }
  if ((id)-[FMRequestFenceTrigger triggerType](self, "triggerType") == (id)2
    || (id)-[FMRequestFenceTrigger triggerType](self, "triggerType") == (id)3)
  {
    v48 = sub_10001612C(-[FMRequestFenceTrigger triggerType](self, "triggerType"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v49, CFSTR("status"));

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger fence](self, "fence"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "contextDict"));

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger fence](self, "fence"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "contextDict"));
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v53, CFSTR("fenceContext"));

  }
  v57 = v44;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v54, CFSTR("fences"));

  return v4;
}

- (int64_t)maxTimerBasedNetworkRetries
{
  return 10;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return 10;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return 10;
}

- (BOOL)canRequestBeRetriedNow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  objc_super v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger triggerTimestamp](self, "triggerTimestamp"));
  -[FMRequestFenceTrigger validityDuration](self, "validityDuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (objc_msgSend(v5, "compare:", v4) == (id)1
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger fence](self, "fence")),
        v8 = objc_msgSend(v6, "isFenceBeingMonitored:", v7),
        v7,
        v6,
        !v8))
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)FMRequestFenceTrigger;
    v9 = -[FMRequest canRequestBeRetriedNow](&v11, "canRequestBeRetriedNow");
  }

  return v9;
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v9 = objc_opt_class(self, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
      if (v10 == v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestFenceTrigger fence](self, "fence"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fenceId"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fence"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fenceId"));
        v12 = objc_msgSend(v14, "isEqualToString:", v16);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CLLocation)triggeredLocation
{
  return self->_triggeredLocation;
}

- (void)setTriggeredLocation:(id)a3
{
  objc_storeStrong((id *)&self->_triggeredLocation, a3);
}

- (MonitoredFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
  objc_storeStrong((id *)&self->_fence, a3);
}

- (NSURL)triggerURL
{
  return self->_triggerURL;
}

- (void)setTriggerURL:(id)a3
{
  objc_storeStrong((id *)&self->_triggerURL, a3);
}

- (NSDate)triggerTimestamp
{
  return self->_triggerTimestamp;
}

- (void)setTriggerTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_triggerTimestamp, a3);
}

- (int64_t)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(int64_t)a3
{
  self->_triggerType = a3;
}

- (double)validityDuration
{
  return self->_validityDuration;
}

- (void)setValidityDuration:(double)a3
{
  self->_validityDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerTimestamp, 0);
  objc_storeStrong((id *)&self->_triggerURL, 0);
  objc_storeStrong((id *)&self->_fence, 0);
  objc_storeStrong((id *)&self->_triggeredLocation, 0);
}

@end
