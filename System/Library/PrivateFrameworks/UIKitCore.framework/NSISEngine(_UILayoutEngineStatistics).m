@implementation NSISEngine(_UILayoutEngineStatistics)

- (void)_setUIKitEngineTrackingOn:()_UILayoutEngineStatistics
{
  int v5;
  void *v6;
  void *v7;

  v5 = objc_msgSend(a1, "_UIKitEngineTrackingOn");
  if (a3 && (v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C9AAB0];
    v7 = a1;
LABEL_7:
    objc_setAssociatedObject(v7, &_UIKitEngineTrackingKey, v6, 0);
    return;
  }
  if ((a3 & 1) == 0 && ((v5 ^ 1) & 1) == 0)
  {
    v7 = a1;
    v6 = 0;
    goto LABEL_7;
  }
}

- (BOOL)_UIKitEngineTrackingOn
{
  return objc_getAssociatedObject(a1, &_UIKitEngineTrackingKey) != 0;
}

- (uint64_t)_UIKitRowCount
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__NSISEngine__UILayoutEngineStatistics___UIKitRowCount__block_invoke;
  block[3] = &unk_1E16B41B8;
  block[4] = a1;
  if (qword_1ECD79150 != -1)
    dispatch_once(&qword_1ECD79150, block);
  if (byte_1ECD790B9)
    return objc_msgSend(a1, "rowCount");
  else
    return 0;
}

@end
