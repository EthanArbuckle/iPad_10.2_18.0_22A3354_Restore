@implementation UIBadgeView

void __33___UIBadgeView__applyTextToLabel__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init((Class)off_1E1679BC0);
  objc_msgSend(v0, "setAlignment:", 1);
  v5[0] = *(_QWORD *)off_1E1678D98;
  +[UIColor whiteColor](UIColor, "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v5[1] = *(_QWORD *)off_1E1678F98;
  v2 = (void *)objc_msgSend(v0, "copy");
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ECD79D18;
  qword_1ECD79D18 = v3;

}

@end
