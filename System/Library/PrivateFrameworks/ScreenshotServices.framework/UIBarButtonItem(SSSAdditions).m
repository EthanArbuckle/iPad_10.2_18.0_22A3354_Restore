@implementation UIBarButtonItem(SSSAdditions)

+ (id)_sss_undoItemWithTarget:()SSSAdditions action:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDF6860];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("arrow.uturn.backward.circle")), 0, v6, a4);

  return v8;
}

+ (id)_sss_redoItemWithTarget:()SSSAdditions action:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDF6860];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("arrow.uturn.forward.circle")), 0, v6, a4);

  return v8;
}

+ (id)_sss_shareItemWithTarget:()SSSAdditions action:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDF6860];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("square.and.arrow.up")), 0, v6, a4);

  return v8;
}

+ (id)_sss_trashItemWithTarget:()SSSAdditions action:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDF6860];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("trash")), 0, v6, a4);

  return v8;
}

+ (id)_sss_cropItemWithTarget:()SSSAdditions action:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDF6860];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("crop")), 0, v6, a4);

  return v8;
}

@end
