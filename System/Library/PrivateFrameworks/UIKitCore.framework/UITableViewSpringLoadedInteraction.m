@implementation UITableViewSpringLoadedInteraction

void __71___UITableViewSpringLoadedInteraction_tableViewSpringLoadedInteraction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a2, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideTargetItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_unhighlightSpringLoadedRow");
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_selectRowsAtIndexPaths:animated:scrollPosition:notifyDelegate:", v7, 0, 0, 1);

}

@end
