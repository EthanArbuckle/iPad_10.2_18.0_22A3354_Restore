@implementation SFCardSection

uint64_t __116__SFCardSection_SearchUIHorizontallyScrollingSectionModel__searchUIHorizontallyScrollingSectionModel_idealItemWidth__block_invoke()
{
  uint64_t result;
  double v1;

  result = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  if ((result & 1) != 0)
  {
    v1 = 113.0;
  }
  else
  {
    result = objc_msgSend(MEMORY[0x1E0DBDA48], "isLargePhone");
    v1 = 155.0;
    if ((_DWORD)result)
      v1 = 170.0;
  }
  searchUIHorizontallyScrollingSectionModel_idealItemWidth_idealItemWidth = *(_QWORD *)&v1;
  return result;
}

@end
