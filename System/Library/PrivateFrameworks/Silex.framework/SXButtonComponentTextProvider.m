@implementation SXButtonComponentTextProvider

- (id)textForComponent:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "text");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_24D68E0F8;
  v5 = v3;

  return v5;
}

@end
