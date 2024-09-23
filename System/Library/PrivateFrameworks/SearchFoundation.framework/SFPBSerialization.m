@implementation SFPBSerialization

+ (id)cardWithProto2Data:(id)a3
{
  return (id)objc_msgSend(a1, "cardWithPBData:encoding:", a3, 0);
}

+ (id)cardWithPBData:(id)a3 encoding:(unint64_t)a4
{
  id v6;
  void *v7;
  _SFPBCard *v8;
  _SFPBCard *v9;

  v6 = a3;
  if (a4 || (v8 = -[_SFPBCard initWithData:]([_SFPBCard alloc], "initWithData:", v6)) == 0)
  {
    v7 = 0;
  }
  else
  {
    v9 = v8;
    objc_msgSend(a1, "_cardWithPBCard:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)_cardWithPBCard:(id)a3
{
  id v3;
  SFCard *v4;
  void *v5;

  v3 = a3;
  v4 = -[SFCard initWithProtobuf:]([SFCard alloc], "initWithProtobuf:", v3);
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFCard _setOriginalCardData:](v4, "_setOriginalCardData:", v5);
  return v4;
}

@end
