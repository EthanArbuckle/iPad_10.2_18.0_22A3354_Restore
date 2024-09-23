@implementation PBUTIForNSAttributedStringDocumentType

void __PBUTIForNSAttributedStringDocumentType_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = *(_QWORD *)off_1E1678FA0;
  objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = *(_QWORD *)off_1E1679008;
  objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = *(_QWORD *)off_1E1679000;
  objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = *(_QWORD *)off_1E1678DD0;
  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = *(_QWORD *)off_1E16792B8;
  objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ECD7B280;
  qword_1ECD7B280 = v5;

}

@end
