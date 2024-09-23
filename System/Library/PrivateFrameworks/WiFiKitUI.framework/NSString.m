@implementation NSString

void __43__NSString_WiFiKitUI__formattedWiFiAddress__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = v4;
  if ((unint64_t)objc_msgSend(v4, "length") <= 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0%@"), v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

@end
