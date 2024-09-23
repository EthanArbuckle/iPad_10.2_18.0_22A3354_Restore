@implementation _UISTouchAuthenticationRecord(UIKit)

+ (id)authenticationRecordForTouch:()UIKit
{
  _QWORD *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD *v11;
  id v12;

  v3 = a3;
  if (qword_1ECD7EFD8 != -1)
    dispatch_once(&qword_1ECD7EFD8, &__block_literal_global_347);
  if (_MergedGlobals_1132)
  {
    if (v3)
      v4 = (void *)v3[45];
    else
      v4 = 0;
    v5 = v4;
    if (objc_msgSend(v5, "_isHostedInAnotherProcess")
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = v5;
      v7 = (void *)MEMORY[0x1E0DC5C90];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __69___UISTouchAuthenticationRecord_UIKit__authenticationRecordForTouch___block_invoke;
      v10[3] = &unk_1E16D6558;
      v11 = v3;
      v12 = v6;
      objc_msgSend(v7, "build:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
