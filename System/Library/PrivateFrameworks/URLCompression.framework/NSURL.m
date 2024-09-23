@implementation NSURL

uint64_t __49__NSURL_UCNSURLExtras__truncatePayloadToV2Length__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "substringFromIndex:", 27);
}

id __44__NSURL_UCNSURLExtras__padPayloadToV1Length__block_invoke(int a1, id a2)
{
  id v2;
  id v3;
  id v4;

  v2 = a2;
  v3 = (id)objc_msgSend(&stru_24E6B2E78, "stringByPaddingToLength:withString:startingAtIndex:", 32 - objc_msgSend(v2, "length"), CFSTR("0"), 0);
  v4 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v3, v2);

  return v4;
}

@end
