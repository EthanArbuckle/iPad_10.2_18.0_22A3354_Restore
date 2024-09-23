@implementation TUIStatsFeedPass

- (TUIStatsFeedPass)initWithMode:(unint64_t)a3 timingCollector:(id)a4 passes:(id)a5
{
  char v6;
  id v8;
  id v9;
  TUIStatsFeedPass *v10;
  TUIStatsFeedPass *v11;
  uint64_t i;
  uint64_t v13;
  TUIStatsFeedPass *v14;
  NSArray *v15;
  NSArray *entryPasses;
  void **v18;
  uint64_t v19;
  unint64_t (*v20)(uint64_t, void *);
  void *v21;
  TUIStatsFeedPass *v22;
  _QWORD v23[4];
  TUIStatsFeedPass *v24;
  objc_super v25;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TUIStatsFeedPass;
  v10 = -[TUIStatsFeedPass init](&v25, "init");
  v11 = v10;
  if (v10)
  {
    v10->_reason = 0;
    for (i = 1; i != 6; ++i)
    {
      objc_msgSend(v8, "elapsedTimeForPhase:", i - 1);
      *((_QWORD *)&v11->super.isa + i) = v13;
    }
    v11->_eventCount[28] = 0;
    *(_OWORD *)&v11->_eventCount[24] = 0u;
    *(_OWORD *)&v11->_eventCount[26] = 0u;
    *(_OWORD *)&v11->_eventCount[20] = 0u;
    *(_OWORD *)&v11->_eventCount[22] = 0u;
    *(_OWORD *)&v11->_eventCount[16] = 0u;
    *(_OWORD *)&v11->_eventCount[18] = 0u;
    *(_OWORD *)&v11->_eventCount[12] = 0u;
    *(_OWORD *)&v11->_eventCount[14] = 0u;
    *(_OWORD *)&v11->_eventCount[8] = 0u;
    *(_OWORD *)&v11->_eventCount[10] = 0u;
    *(_OWORD *)&v11->_eventCount[4] = 0u;
    *(_OWORD *)&v11->_eventCount[6] = 0u;
    *(_OWORD *)v11->_eventCount = 0u;
    *(_OWORD *)&v11->_eventCount[2] = 0u;
    if ((v6 & 8) != 0)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_59C2C;
      v23[3] = &unk_23F098;
      v24 = v11;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);

    }
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_59C80;
    v21 = &unk_23F098;
    v14 = v11;
    v22 = v14;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v18);
    if ((v6 & 2) != 0)
    {
      v15 = (NSArray *)objc_msgSend(v9, "copy", v18, v19, v20, v21);
      entryPasses = v14->_entryPasses;
      v14->_entryPasses = v15;

    }
  }

  return v11;
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (NSString)description
{
  NSMutableString *v3;
  id v4;

  v3 = objc_opt_new(NSMutableString);
  sub_58EC0(v3, self, CFSTR("\n"));
  -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n"));
  sub_58FDC(v3, self, CFSTR("\n"));
  v4 = -[NSMutableString copy](v3, "copy");

  return (NSString *)v4;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSArray)entryPasses
{
  return self->_entryPasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPasses, 0);
}

@end
