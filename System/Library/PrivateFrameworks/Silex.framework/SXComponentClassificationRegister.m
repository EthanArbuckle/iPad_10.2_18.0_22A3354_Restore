@implementation SXComponentClassificationRegister

uint64_t __52__SXComponentClassificationRegister_registerClasses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "registerClassification");
}

+ (void)registerClasses
{
  id v2;

  objc_msgSend(a1, "classifications");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_71);

}

+ (id)classifications
{
  _QWORD v3[62];

  v3[61] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  v3[14] = objc_opt_class();
  v3[15] = objc_opt_class();
  v3[16] = objc_opt_class();
  v3[17] = objc_opt_class();
  v3[18] = objc_opt_class();
  v3[19] = objc_opt_class();
  v3[20] = objc_opt_class();
  v3[21] = objc_opt_class();
  v3[22] = objc_opt_class();
  v3[23] = objc_opt_class();
  v3[24] = objc_opt_class();
  v3[25] = objc_opt_class();
  v3[26] = objc_opt_class();
  v3[27] = objc_opt_class();
  v3[28] = objc_opt_class();
  v3[29] = objc_opt_class();
  v3[30] = objc_opt_class();
  v3[31] = objc_opt_class();
  v3[32] = objc_opt_class();
  v3[33] = objc_opt_class();
  v3[34] = objc_opt_class();
  v3[35] = objc_opt_class();
  v3[36] = objc_opt_class();
  v3[37] = objc_opt_class();
  v3[38] = objc_opt_class();
  v3[39] = objc_opt_class();
  v3[40] = objc_opt_class();
  v3[41] = objc_opt_class();
  v3[42] = objc_opt_class();
  v3[43] = objc_opt_class();
  v3[44] = objc_opt_class();
  v3[45] = objc_opt_class();
  v3[46] = objc_opt_class();
  v3[47] = objc_opt_class();
  v3[48] = objc_opt_class();
  v3[49] = objc_opt_class();
  v3[50] = objc_opt_class();
  v3[51] = objc_opt_class();
  v3[52] = objc_opt_class();
  v3[53] = objc_opt_class();
  v3[54] = objc_opt_class();
  v3[55] = objc_opt_class();
  v3[56] = objc_opt_class();
  v3[57] = objc_opt_class();
  v3[58] = objc_opt_class();
  v3[59] = objc_opt_class();
  v3[60] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 61);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
