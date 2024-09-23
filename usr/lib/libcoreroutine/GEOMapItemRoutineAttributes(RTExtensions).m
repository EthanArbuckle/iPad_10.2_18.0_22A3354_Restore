@implementation GEOMapItemRoutineAttributes(RTExtensions)

- (void)initWithLOIType:()RTExtensions event:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&off_1EFCED060;
  v7 = objc_msgSendSuper2(&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    if (a3)
      v9 = 2 * (a3 == 1);
    else
      v9 = 1;
    objc_msgSend(v7, "setLoiType:", v9);
    if (v6)
    {
      objc_msgSend(v6, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEventName:", v10);

      objc_msgSend(v8, "setIsEventAllDay:", objc_msgSend(v6, "isAllDay"));
      objc_msgSend(v6, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      objc_msgSend(v8, "setEventDate:");

    }
    v12 = v8;
  }

  return v8;
}

@end
