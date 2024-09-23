@implementation NSDate(TRIUtils)

+ (BOOL)triIsDate:()TRIUtils equalToDate:withinInterval:
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  _BOOL8 v10;
  double v11;
  double v12;
  double v13;

  v7 = a4;
  v8 = a5;
  v9 = (void *)v8;
  if (v7 | v8)
  {
    v10 = 0;
    if (v7 && v8)
    {
      objc_msgSend((id)v7, "timeIntervalSinceReferenceDate");
      v12 = v11;
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v10 = vabdd_f64(v12, v13) <= a1;
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (uint64_t)triIsDate:()TRIUtils equalToDate:
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "triIsDate:equalToDate:withinInterval:", 0.1);
}

@end
