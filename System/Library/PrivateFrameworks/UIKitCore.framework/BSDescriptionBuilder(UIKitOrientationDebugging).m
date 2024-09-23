@implementation BSDescriptionBuilder(UIKitOrientationDebugging)

- (uint64_t)ui_appendOrientationDebugDescription:()UIKitOrientationDebugging withName:
{
  return objc_msgSend(a1, "ui_appendOrientationDebugDescription:withName:skipIfNil:", a3, a4, 0);
}

- (void)ui_appendOrientationDebugDescription:()UIKitOrientationDebugging withName:skipIfNil:
{
  __CFString *v8;
  const __CFString *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  void *v13;

  v10 = a3;
  v8 = a4;
  if (v10)
  {
    if (v8)
      v9 = v8;
    else
      v9 = &stru_1E16EDF20;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __107__BSDescriptionBuilder_UIKitOrientationDebugging__ui_appendOrientationDebugDescription_withName_skipIfNil___block_invoke;
    v11[3] = &unk_1E16E09E0;
    v12 = v10;
    v13 = a1;
    objc_msgSend(a1, "appendCustomFormatWithName:block:", v9, v11);

  }
  else if ((a5 & 1) == 0)
  {
    objc_msgSend(a1, "appendString:withName:", CFSTR("<nil>"), v8);
  }

}

- (void)ui_appendOrientationDebuggingArraySection:()UIKitOrientationDebugging withName:skipIfEmpty:
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "activeMultilinePrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __114__BSDescriptionBuilder_UIKitOrientationDebugging__ui_appendOrientationDebuggingArraySection_withName_skipIfEmpty___block_invoke;
  v11[3] = &unk_1E16E0A08;
  v11[4] = a1;
  objc_msgSend(a1, "appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", v9, v8, v10, a5, v11);

}

@end
