@implementation IPCLaneGuidanceInfoReply

- (IPCLaneGuidanceInfoReply)initWithDictionary:(id)a3
{
  id v4;
  IPCLaneGuidanceInfoReply *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IPCLaneGuidanceInfoReply;
  v5 = -[IPCMessageObject initWithDictionary:](&v21, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = objc_alloc((Class)NSUUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLaneGuidanceInfoReplyLaneInfoIDKey")));
    v8 = objc_msgSend(v6, "initWithUUIDString:", v7);
    -[IPCLaneGuidanceInfoReply setLaneInfoId:](v5, "setLaneInfoId:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLaneGuidanceInfoReplyLanesKey")));
    v10 = objc_opt_class(NSData);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = objc_opt_class(NSArray);
      v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(GEOComposedRouteLaneInfo), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v13, v9, 0));

    }
    else
    {
      v14 = 0;
    }

    -[IPCLaneGuidanceInfoReply setLanes:](v5, "setLanes:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLaneGuidanceInfoReplyIsForManeuverKey")));
    -[IPCLaneGuidanceInfoReply setIsForManeuver:](v5, "setIsForManeuver:", objc_msgSend(v15, "BOOLValue"));

    v16 = sub_1009E3F9C(v4, (uint64_t)CFSTR("kIPCLaneGuidanceInfoReplyInstructionsKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[IPCLaneGuidanceInfoReply setTextAlternatives:](v5, "setTextAlternatives:", v17);

    v18 = sub_1009E3F9C(v4, (uint64_t)CFSTR("kIPCLaneGuidanceInfoReplyMidStepKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[IPCLaneGuidanceInfoReply setMidStepTitles:](v5, "setMidStepTitles:", v19);

  }
  return v5;
}

- (id)dictionaryValue
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)IPCLaneGuidanceInfoReply;
  v3 = -[IPCMessageObject dictionaryValue](&v17, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply laneInfoId](self, "laneInfoId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kIPCLaneGuidanceInfoReplyLaneInfoIDKey"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply lanes](self, "lanes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("kIPCLaneGuidanceInfoReplyLanesKey"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCLaneGuidanceInfoReply isForManeuver](self, "isForManeuver")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("kIPCLaneGuidanceInfoReplyIsForManeuverKey"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply textAlternatives](self, "textAlternatives"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("kIPCLaneGuidanceInfoReplyInstructionsKey"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply midStepTitles](self, "midStepTitles"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, 0));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("kIPCLaneGuidanceInfoReplyMidStepKey"));

  v15 = objc_msgSend(v5, "copy");
  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IPCLaneGuidanceInfoReply;
  v3 = -[IPCLaneGuidanceInfoReply description](&v12, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply laneInfoId](self, "laneInfoId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply lanes](self, "lanes"));
  v7 = -[IPCLaneGuidanceInfoReply isForManeuver](self, "isForManeuver");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply textAlternatives](self, "textAlternatives"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply midStepTitles](self, "midStepTitles"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@             laneInfoID : {%@}             lanes : {%@}             isForManeuver : %d             instructions: {%@}             midStepTitles {%@}"), v4, v5, v6, v7, v8, v9));

  return v10;
}

- (NSUUID)laneInfoId
{
  return self->_laneInfoId;
}

- (void)setLaneInfoId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (void)setLanes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isForManeuver
{
  return self->_isForManeuver;
}

- (void)setIsForManeuver:(BOOL)a3
{
  self->_isForManeuver = a3;
}

- (NSArray)textAlternatives
{
  return self->_textAlternatives;
}

- (void)setTextAlternatives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)midStepTitles
{
  return self->_midStepTitles;
}

- (void)setMidStepTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_midStepTitles, 0);
  objc_storeStrong((id *)&self->_textAlternatives, 0);
  objc_storeStrong((id *)&self->_lanes, 0);
  objc_storeStrong((id *)&self->_laneInfoId, 0);
}

+ (id)ipcReplyForLaneGuidanceInfo:(id)a3
{
  id v3;
  IPCLaneGuidanceInfoReply *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(IPCLaneGuidanceInfoReply);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "laneInfoId"));
  -[IPCLaneGuidanceInfoReply setLaneInfoId:](v4, "setLaneInfoId:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lanes"));
  -[IPCLaneGuidanceInfoReply setLanes:](v4, "setLanes:", v6);

  -[IPCLaneGuidanceInfoReply setIsForManeuver:](v4, "setIsForManeuver:", objc_msgSend(v3, "isForManeuver"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textAlternatives"));
  -[IPCLaneGuidanceInfoReply setTextAlternatives:](v4, "setTextAlternatives:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "midStepTitles"));
  -[IPCLaneGuidanceInfoReply setMidStepTitles:](v4, "setMidStepTitles:", v8);

  return v4;
}

- (id)laneGuidanceInfo
{
  NavSignLaneGuidanceInfo *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  NavSignLaneGuidanceInfo *v9;

  v3 = [NavSignLaneGuidanceInfo alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply laneInfoId](self, "laneInfoId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply lanes](self, "lanes"));
  v6 = -[IPCLaneGuidanceInfoReply isForManeuver](self, "isForManeuver");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply midStepTitles](self, "midStepTitles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLaneGuidanceInfoReply textAlternatives](self, "textAlternatives"));
  v9 = -[NavSignLaneGuidanceInfo initWithLaneInfoId:lanes:forManeuver:midStepTitles:details:](v3, "initWithLaneInfoId:lanes:forManeuver:midStepTitles:details:", v4, v5, v6, v7, v8);

  return v9;
}

@end
