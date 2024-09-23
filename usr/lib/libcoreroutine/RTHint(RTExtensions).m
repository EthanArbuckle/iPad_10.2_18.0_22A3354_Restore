@implementation RTHint(RTExtensions)

+ (uint64_t)convertHintSource:()RTExtensions
{
  if ((a3 - 1) >= 7)
    return -1;
  else
    return (a3 - 1);
}

- (uint64_t)initWithRTPHint:()RTExtensions
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;

  v4 = (objc_class *)MEMORY[0x1E0D183B0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRTPLocation:", v7);
  v9 = objc_msgSend(MEMORY[0x1E0D183A0], "convertHintSource:", objc_msgSend(v5, "hintSource"));
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "timestamp");
  v12 = v11;

  objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "initWithLocation:source:date:", v8, v9, v13);

  return v14;
}

@end
