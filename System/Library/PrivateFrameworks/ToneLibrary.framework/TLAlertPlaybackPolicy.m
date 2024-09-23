@implementation TLAlertPlaybackPolicy

+ (BOOL)shouldRepeatVibrationForAlert:(id)a3 withPlaybackBackend:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_msgSend(v5, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "shouldRepeat");

  }
  if (objc_msgSend(v6, "type") == 18)
    LOBYTE(v7) = 1;

  return v7;
}

@end
