@implementation UIStatusBarSecondarySignalStrengthItemView

- (double)extraLeftPadding
{
  return -5.0;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5;
  int v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "rawData");
  v6 = *(_DWORD *)(v5 + 444);
  if (v6 >= 4)
    v7 = 4;
  else
    v7 = v6;
  return -[UIStatusBarSignalStrengthItemView _updateWithRaw:bars:enableRSSI:showFailure:useSmallBars:](self, "_updateWithRaw:bars:enableRSSI:showFailure:useSmallBars:", *(unsigned int *)(v5 + 436), v7, (*(unsigned __int8 *)(v5 + 2529) >> 1) & 1, *(_DWORD *)(v5 + 2076) == 6, 1);
}

@end
