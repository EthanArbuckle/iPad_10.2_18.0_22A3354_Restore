@implementation STTelephonyMobileEquipmentInfo

- (STTelephonyMobileEquipmentInfo)init
{
  return (STTelephonyMobileEquipmentInfo *)-[STTelephonyMobileEquipmentInfo initWithMobileEquipmentInfo:](self, 0);
}

- (_QWORD)initWithMobileEquipmentInfo:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v3 = a2;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)STTelephonyMobileEquipmentInfo;
    a1 = objc_msgSendSuper2(&v20, sel_init);
    if (a1)
    {
      objc_msgSend(v3, "MEID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "copy");
      v6 = (void *)a1[1];
      a1[1] = v5;

      objc_msgSend(v3, "IMEI");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      v9 = (void *)a1[2];
      a1[2] = v8;

      objc_msgSend(v3, "ICCID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      v12 = (void *)a1[3];
      a1[3] = v11;

      objc_msgSend(v3, "CSN");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      v15 = (void *)a1[4];
      a1[4] = v14;

      objc_msgSend(v3, "bootstrapICCID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      v18 = (void *)a1[5];
      a1[5] = v17;

    }
  }

  return a1;
}

- (BOOL)isOnBootstrap
{
  void *v3;
  void *v4;
  char v5;

  -[STTelephonyMobileEquipmentInfo ICCID](self, "ICCID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTelephonyMobileEquipmentInfo bootstrapICCID](self, "bootstrapICCID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STTelephonyMobileEquipmentInfo initWithMobileEquipmentInfo:]((_QWORD *)+[STMutableTelephonyMobileEquipmentInfo allocWithZone:](STMutableTelephonyMobileEquipmentInfo, "allocWithZone:", a3), self);
}

- (NSString)description
{
  return (NSString *)-[STTelephonyMobileEquipmentInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STTelephonyMobileEquipmentInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STTelephonyMobileEquipmentInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  STTelephonyMobileEquipmentInfo *v11;

  v4 = a3;
  -[STTelephonyMobileEquipmentInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__STTelephonyMobileEquipmentInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E17F10;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __72__STTelephonyMobileEquipmentInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "MEID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("MEID"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "IMEI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("IMEI"));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "ICCID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("ICCID"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "CSN");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, CFSTR("CSN"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bootstrapICCID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:withName:", v11, CFSTR("bootstrapICCID"));

}

- (NSString)MEID
{
  return self->_MEID;
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (NSString)ICCID
{
  return self->_ICCID;
}

- (NSString)CSN
{
  return self->_CSN;
}

- (NSString)bootstrapICCID
{
  return self->_bootstrapICCID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootstrapICCID, 0);
  objc_storeStrong((id *)&self->_CSN, 0);
  objc_storeStrong((id *)&self->_ICCID, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_MEID, 0);
}

@end
