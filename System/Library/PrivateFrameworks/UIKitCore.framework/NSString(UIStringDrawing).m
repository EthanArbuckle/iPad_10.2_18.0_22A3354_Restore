@implementation NSString(UIStringDrawing)

- (void)sizeWithFont:()UIStringDrawing
{
  if (a3)
  {
    if (*MEMORY[0x1E0C9D820] >= 0.0)
      return (void *)objc_msgSend((id)objc_msgSend(result, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E16EDF20), "_legacy_sizeWithFont:forWidth:lineBreakMode:", a3, 0, 3.40282347e38);
  }
  return result;
}

- (uint64_t)sizeWithFont:()UIStringDrawing forWidth:lineBreakMode:
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E16EDF20), "_legacy_sizeWithFont:forWidth:lineBreakMode:", a4, a5, a2);
}

- (uint64_t)drawAtPoint:()UIStringDrawing withFont:
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E16EDF20), "_legacy_drawAtPoint:withFont:", a5, a2, a3);
}

- (uint64_t)drawAtPoint:()UIStringDrawing forWidth:withFont:lineBreakMode:
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E16EDF20), "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", a6, a7, a2, a3, a4);
}

- (uint64_t)sizeWithFont:()UIStringDrawing minFontSize:actualFontSize:forWidth:lineBreakMode:
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E16EDF20), "_legacy_sizeWithFont:minFontSize:actualFontSize:forWidth:lineBreakMode:", a5, a6, a7, a2, a3);
}

- (uint64_t)drawAtPoint:()UIStringDrawing forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E16EDF20), "_legacy_drawAtPoint:forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:", a7, a8, a9, a2, a3, a4, a5);
}

- (uint64_t)drawAtPoint:()UIStringDrawing forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E16EDF20), "_legacy_drawAtPoint:forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:", a7, a8, a9, a10, a2, a3, a4, a5);
}

@end
