@implementation SMSessionManagerStatus

- (SMSessionManagerStatus)initWithIdentifier:(id)a3 stateQueryDate:(id)a4 lastSessionIDDuringMagnetBreak:(id)a5 state:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SMSessionManagerStatus *v15;
  id *p_isa;
  SMSessionManagerStatus *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    v20.receiver = self;
    v20.super_class = (Class)SMSessionManagerStatus;
    v15 = -[SMSessionManagerStatus init](&v20, sel_init);
    p_isa = (id *)&v15->super.isa;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_identifier, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
    }
    self = p_isa;
    v17 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v17 = 0;
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMSessionManagerStatus identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerStatus stateQueryDate](self, "stateQueryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerStatus lastSessionIDDuringMagnetBreak](self, "lastSessionIDDuringMagnetBreak");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerStatus state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, stateQueryDate, %@, lastSessionIDDuringMagnetBreak, %@, state, %@"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)stateQueryDate
{
  return self->_stateQueryDate;
}

- (void)setStateQueryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)lastSessionIDDuringMagnetBreak
{
  return self->_lastSessionIDDuringMagnetBreak;
}

- (void)setLastSessionIDDuringMagnetBreak:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SMSessionManagerState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_lastSessionIDDuringMagnetBreak, 0);
  objc_storeStrong((id *)&self->_stateQueryDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
