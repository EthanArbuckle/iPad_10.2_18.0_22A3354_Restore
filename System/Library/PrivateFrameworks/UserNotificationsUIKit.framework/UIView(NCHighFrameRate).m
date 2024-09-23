@implementation UIView(NCHighFrameRate)

+ (id)nc_applyHighFrameRate:()NCHighFrameRate
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__UIView_NCHighFrameRate__nc_applyHighFrameRate___block_invoke;
  aBlock[3] = &unk_1E8D1B808;
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(v5);

  return v6;
}

@end
