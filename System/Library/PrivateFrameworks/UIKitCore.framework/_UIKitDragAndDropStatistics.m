@implementation _UIKitDragAndDropStatistics

+ (void)recordUIKitDragAndDropDistributionValue:(double)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  +[_UIStatisticsIntegrator sharedInstance](_UIStatisticsIntegrator, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.UIKit.DragAndDrop"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "recordDistributionValue:forKey:", v6, a3);
}

+ (void)setUIKitScalarValue:(int64_t)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  +[_UIStatisticsIntegrator sharedInstance](_UIStatisticsIntegrator, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.UIKit.DragAndDrop"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setValue:forKey:", a3, v6);
}

+ (void)incrementUIKitScalarValueBy:(int64_t)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  +[_UIStatisticsIntegrator sharedInstance](_UIStatisticsIntegrator, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.UIKit.DragAndDrop"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "incrementValueBy:forKey:", a3, v6);
}

+ (void)incrementUIKitScalarValueForKnownInternalAppsForKey:(id)a3 bundleID:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (qword_1ECD820D0 == -1)
  {
    if (v6)
    {
LABEL_3:
      v8 = v7;
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_1ECD820D0, &__block_literal_global_244_1);
    if (v7)
      goto LABEL_3;
  }
  _UIStatisticsBundleIdentifier(2);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_8:
    v9 = CFSTR("other");
    goto LABEL_9;
  }
LABEL_6:
  if (!objc_msgSend((id)qword_1ECD820C8, "containsObject:", v8))
    goto LABEL_8;
  v8 = v8;
  v9 = v8;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v11, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "incrementUIKitScalarValueBy:forKey:", 1, v10);

}

@end
