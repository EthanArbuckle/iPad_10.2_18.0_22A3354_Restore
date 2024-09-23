@implementation REInitializeDefaultErrorCodeMessages

void __REInitializeDefaultErrorCodeMessages_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[18];
  _QWORD v3[19];

  v3[18] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CFC1390;
  v2[1] = &unk_24CFC13A8;
  v3[0] = CFSTR("No Relevance engine with provided name");
  v3[1] = CFSTR("Unable to create element from description");
  v2[2] = &unk_24CFC13C0;
  v2[3] = &unk_24CFC13D8;
  v3[2] = CFSTR("Unable to perform command");
  v3[3] = CFSTR("Unable to find current training context");
  v2[4] = &unk_24CFC13F0;
  v2[5] = &unk_24CFC1408;
  v3[4] = CFSTR("Unable to run action");
  v3[5] = CFSTR("Unable to find element");
  v2[6] = &unk_24CFC1420;
  v2[7] = &unk_24CFC1438;
  v3[6] = CFSTR("Multiline comment is missing closing \"*/\");
  v3[7] = CFSTR("String is missing closing quotation mark");
  v2[8] = &unk_24CFC1450;
  v2[9] = &unk_24CFC1468;
  v3[8] = CFSTR("Invalid operator");
  v3[9] = CFSTR("Invalid token");
  v2[10] = &unk_24CFC1480;
  v2[11] = &unk_24CFC1498;
  v3[10] = CFSTR("Unexpected token");
  v3[11] = CFSTR("Token missing. EOF.");
  v2[12] = &unk_24CFC14B0;
  v2[13] = &unk_24CFC14C8;
  v3[12] = CFSTR("Symbol already defined.");
  v3[13] = CFSTR("Symbol not defined.");
  v2[14] = &unk_24CFC14E0;
  v2[15] = &unk_24CFC14F8;
  v3[14] = CFSTR("Symbol already has value.");
  v3[15] = CFSTR("Unepxcted expression.");
  v2[16] = &unk_24CFC1510;
  v2[17] = &unk_24CFC1528;
  v3[16] = CFSTR("Undefined value.");
  v3[17] = CFSTR("Argument to function is unexpected");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REDefaultErrorCodeMessages;
  REDefaultErrorCodeMessages = v0;

}

@end
