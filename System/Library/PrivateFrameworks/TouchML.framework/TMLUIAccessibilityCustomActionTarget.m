@implementation TMLUIAccessibilityCustomActionTarget

- (BOOL)action:(id)a3
{
  double v3;
  int v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  id v10;

  v10 = 0;
  v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a3, a2, v3, CFSTR("action"), 0, &v10);
  v5 = v10;
  v8 = v5;
  if (v4)
    LOBYTE(v4) = objc_msgSend_BOOLValue(v5, v6, v7);

  return v4;
}

@end
