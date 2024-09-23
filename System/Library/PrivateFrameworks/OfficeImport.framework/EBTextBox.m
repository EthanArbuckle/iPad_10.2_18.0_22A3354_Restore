@implementation EBTextBox

+ (id)edTextBoxFromXlGraphicsInfo:(void *)a3 edResources:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  if (a3)
  {
    +[EDTextBox textBox](EDTextBox, "textBox");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[EBAlignmentInfo edAlignmentInfoFromXlGraphicsInfo:](EBAlignmentInfo, "edAlignmentInfoFromXlGraphicsInfo:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlignmentInfo:", v7);

    +[EBProtection edProtectionFromXlGraphicsInfo:](EBProtection, "edProtectionFromXlGraphicsInfo:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProtection:", v8);

    +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", *((_QWORD *)a3 + 7), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v9);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
