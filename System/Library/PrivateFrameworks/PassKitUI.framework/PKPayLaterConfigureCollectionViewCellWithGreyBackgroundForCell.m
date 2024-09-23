@implementation PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell

id __PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "configurationState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isSelected") & 1) != 0 || (objc_msgSend(v1, "isHighlighted") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v2;

  return v3;
}

@end
