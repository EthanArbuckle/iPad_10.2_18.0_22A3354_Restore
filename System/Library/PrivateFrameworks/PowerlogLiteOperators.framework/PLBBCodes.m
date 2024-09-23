@implementation PLBBCodes

- (id)getLogCodesForMav:(id)a3 AndType:(id)a4
{
  return 0;
}

- (id)getEventCodesForMav:(id)a3 AndType:(id)a4
{
  return 0;
}

- (PLBBCodes)init
{
  PLBBCodes *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSArray *allMav_LogCodes;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *Mav5_7_Lite_LogCodes;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *Mav5_7_LogCodes;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *Mav7_LogCodes;
  PLBBCodes *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PLBBCodes;
  v2 = -[PLBBCodes init](&v30, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithObjects:", v4, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    allMav_LogCodes = v2->_allMav_LogCodes;
    v2->_allMav_LogCodes = (NSArray *)v5;

    v7 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 45452);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObjects:", v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    Mav5_7_Lite_LogCodes = v2->_Mav5_7_Lite_LogCodes;
    v2->_Mav5_7_Lite_LogCodes = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 28978);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 45309);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 45310);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 45311);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithObjects:", v12, v13, v14, v15, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    Mav5_7_LogCodes = v2->_Mav5_7_LogCodes;
    v2->_Mav5_7_LogCodes = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6144);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 16678);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 34);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 36);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 37);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithObjects:", v19, v20, v21, v22, v23, v24, v25, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    Mav7_LogCodes = v2->_Mav7_LogCodes;
    v2->_Mav7_LogCodes = (NSArray *)v26;

    v28 = v2;
  }

  return v2;
}

- (NSArray)allMav_LogCodes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAllMav_LogCodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)Mav5_7_LogCodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMav5_7_LogCodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)Mav5_7_Lite_LogCodes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMav5_7_Lite_LogCodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)Mav7_LogCodes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMav7_LogCodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Mav7_LogCodes, 0);
  objc_storeStrong((id *)&self->_Mav5_7_Lite_LogCodes, 0);
  objc_storeStrong((id *)&self->_Mav5_7_LogCodes, 0);
  objc_storeStrong((id *)&self->_allMav_LogCodes, 0);
}

@end
