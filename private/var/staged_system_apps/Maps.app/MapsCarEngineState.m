@implementation MapsCarEngineState

+ (id)engineStateGasoline
{
  return -[MapsCarEngineState initWithEngineType:]([MapsCarEngineState alloc], "initWithEngineType:", 1);
}

+ (id)engineStateDiesel
{
  return -[MapsCarEngineState initWithEngineType:]([MapsCarEngineState alloc], "initWithEngineType:", 2);
}

+ (id)engineStateElectric
{
  return -[MapsCarEngineState initWithEngineType:]([MapsCarEngineState alloc], "initWithEngineType:", 4);
}

+ (id)engineStateCNG
{
  return -[MapsCarEngineState initWithEngineType:]([MapsCarEngineState alloc], "initWithEngineType:", 8);
}

+ (void)prepareForUse
{
  if (qword_1014D3140 != -1)
    dispatch_once(&qword_1014D3140, &stru_1011C5B90);
}

- (MapsCarEngineState)init
{
  objc_super v4;

  objc_msgSend((id)objc_opt_class(self), "prepareForUse");
  v4.receiver = self;
  v4.super_class = (Class)MapsCarEngineState;
  return -[MapsCarEngineState init](&v4, "init");
}

- (MapsCarEngineState)initWithEngineType:(int)a3
{
  MapsCarEngineState *result;

  result = -[MapsCarEngineState init](self, "init");
  if (result)
    result->_engineType = a3;
  return result;
}

- (void)updateWithVehicleInfo:(id)a3
{
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _BOOL8 v31;
  id v32;

  v32 = a3;
  v4 = (void *)qword_1014D3158;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MapsCarEngineState engineType](self, "engineType")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    v8 = (void *)qword_1014D3158;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MapsCarEngineState engineType](self, "engineType")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v10));
    objc_msgSend(v11, "doubleValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MapsCarEngineState setRange:](self, "setRange:", v12);

  }
  v13 = (void *)qword_1014D3160;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MapsCarEngineState engineType](self, "engineType")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v15));

  if (v16)
  {
    v17 = (void *)qword_1014D3160;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MapsCarEngineState engineType](self, "engineType")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v19));
    -[MapsCarEngineState setLowRangeWarning:](self, "setLowRangeWarning:", objc_msgSend(v20, "BOOLValue"));

  }
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("ExternalAccessoryForceLowRangeWarningForLowRange")));

  if (v23)
    v24 = v23;
  else
    v24 = v21;
  v25 = v24;

  v26 = objc_msgSend(v25, "BOOLValue");
  if (v26)
  {
    v27 = objc_claimAutoreleasedReturnValue(-[MapsCarEngineState range](self, "range"));
    v31 = 0;
    if (v27)
    {
      v28 = (void *)v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCarEngineState range](self, "range"));
      v30 = (uint64_t)objc_msgSend(v29, "integerValue");

      if (v30 < 51)
        v31 = 1;
    }
    -[MapsCarEngineState setLowRangeWarning:](self, "setLowRangeWarning:", v31);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = -[MapsCarEngineState isEqualToEngineState:](self, "isEqualToEngineState:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqualToEngineState:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  BOOL v12;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  v5 = -[MapsCarEngineState engineType](self, "engineType");
  if (v5 != objc_msgSend(v4, "engineType"))
    goto LABEL_7;
  v6 = -[MapsCarEngineState lowRangeWarning](self, "lowRangeWarning");
  if (v6 != objc_msgSend(v4, "lowRangeWarning"))
    goto LABEL_7;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "range"));
  if (!v7)
    goto LABEL_7;
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCarEngineState range](self, "range"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "range"));
  v11 = objc_msgSend(v9, "isEqualToNumber:", v10);

  if ((v11 & 1) != 0)
    v12 = 1;
  else
LABEL_7:
    v12 = 0;

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MapsCarEngineState *v4;
  void *v5;

  v4 = -[MapsCarEngineState initWithEngineType:]([MapsCarEngineState alloc], "initWithEngineType:", -[MapsCarEngineState engineType](self, "engineType"));
  -[MapsCarEngineState setLowRangeWarning:](v4, "setLowRangeWarning:", -[MapsCarEngineState lowRangeWarning](self, "lowRangeWarning"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCarEngineState range](self, "range"));
  -[MapsCarEngineState setRange:](v4, "setRange:", v5);

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MapsCarEngineState;
  v3 = -[MapsCarEngineState description](&v14, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[MapsCarEngineState engineType](self, "engineType");
  v6 = sub_100760100(v5 & 1 | (((v5 >> 2) & 1) << 16) & 0xFEFFFEFF | (((v5 >> 3) & 1) << 24) | (((v5 >> 1) & 1) << 8));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCarEngineState range](self, "range"));
  v9 = -[MapsCarEngineState lowRangeWarning](self, "lowRangeWarning");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ range=%@ warning=%@>"), v7, v8, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(">"), v11));

  return v12;
}

- (int)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int)a3
{
  self->_engineType = a3;
}

- (BOOL)lowRangeWarning
{
  return self->_lowRangeWarning;
}

- (void)setLowRangeWarning:(BOOL)a3
{
  self->_lowRangeWarning = a3;
}

- (NSNumber)range
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
}

@end
