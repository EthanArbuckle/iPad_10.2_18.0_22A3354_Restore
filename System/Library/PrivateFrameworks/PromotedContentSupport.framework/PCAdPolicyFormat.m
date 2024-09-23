@implementation PCAdPolicyFormat

- (void)policiesToEnforce:(id)a3
{
  id v3;
  PCSupportRequester *v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(PCSupportRequester);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_2153EDB84;
    v5[3] = &unk_24D33AA40;
    v6 = v3;
    -[PCSupportRequester policiesToEnforce:](v4, "policiesToEnforce:", v5);

  }
}

- (void)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PCSupportRequester *v13;
  _QWORD v14[4];
  id v15;

  v9 = a6;
  if (v9)
  {
    v10 = a5;
    v11 = a4;
    v12 = a3;
    v13 = objc_alloc_init(PCSupportRequester);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_2153EFD28;
    v14[3] = &unk_24D33AA40;
    v15 = v9;
    -[PCSupportRequester policiesForContainerType:adType:adFormatType:completion:](v13, "policiesForContainerType:adType:adFormatType:completion:", v12, v11, v10, v14);

  }
}

@end
