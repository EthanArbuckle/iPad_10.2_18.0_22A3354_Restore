@implementation _DASTaskCheckpointPair

- (_DASTaskCheckpointPair)initWithParams:(id)a3 terminalEvent:(id)a4
{
  id v7;
  id v8;
  _DASTaskCheckpointPair *v9;
  _DASTaskCheckpointPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DASTaskCheckpointPair;
  v9 = -[_DASTaskCheckpointPair init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startEvent, a3);
    objc_storeStrong((id *)&v10->_terminalEvent, a4);
  }

  return v10;
}

- (id)debugDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p> %@"), v5, self, v6));

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair dictionaryRepresentation](self, "dictionaryRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair startEvent](self, "startEvent"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair startEvent](self, "startEvent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metricKeysAndValues"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

    objc_msgSend(v5, "monotonicTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("monotonicTimeStamp"));

    objc_msgSend(v5, "epochTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("epoch"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Start Event"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair terminalEvent](self, "terminalEvent"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair terminalEvent](self, "terminalEvent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metricKeysAndValues"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v12));

    objc_msgSend(v11, "monotonicTimestamp");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("monotonicTimeStamp"));

    objc_msgSend(v11, "epochTimestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("epoch"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("Terminal Event"));
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASTaskCheckpointPair)initWithCoder:(id)a3
{
  id v4;
  _DASTaskCheckpointPair *v5;
  id v6;
  uint64_t v7;
  PPSEvent *startEvent;
  id v9;
  uint64_t v10;
  PPSEvent *terminalEvent;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DASTaskCheckpointPair;
  v5 = -[_DASTaskCheckpointPair init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", sub_1000CF3A0(), CFSTR("startEvent"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    startEvent = v5->_startEvent;
    v5->_startEvent = (PPSEvent *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", sub_1000CF3A0(), CFSTR("terminalEvent"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    terminalEvent = v5->_terminalEvent;
    v5->_terminalEvent = (PPSEvent *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PPSEvent *startEvent;
  id v5;

  startEvent = self->_startEvent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startEvent, CFSTR("startEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_terminalEvent, CFSTR("terminalEvent"));

}

- (PPSEvent)startEvent
{
  return self->_startEvent;
}

- (void)setStartEvent:(id)a3
{
  objc_storeStrong((id *)&self->_startEvent, a3);
}

- (PPSEvent)terminalEvent
{
  return self->_terminalEvent;
}

- (void)setTerminalEvent:(id)a3
{
  objc_storeStrong((id *)&self->_terminalEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminalEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
}

@end
