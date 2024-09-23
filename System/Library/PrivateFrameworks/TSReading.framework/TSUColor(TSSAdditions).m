@implementation TSUColor(TSSAdditions)

+ (uint64_t)p_defaultPresetColors:()TSSAdditions
{
  _QWORD *v3;
  _QWORD v5[30];
  _QWORD v6[31];

  v6[30] = *MEMORY[0x24BDAC8D0];
  if (a3 > 6)
    return 0;
  if (((1 << a3) & 0x2B) != 0)
  {
    v6[0] = objc_msgSend(MEMORY[0x24BEB3C40], "clearColor");
    v6[1] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.324999988, 0.344999999, 0.372999996, 1.0);
    v6[2] = objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
    v6[3] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:");
    v6[4] = objc_msgSend(MEMORY[0x24BEB3C40], "whiteColor");
    v6[5] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.866999984);
    v6[6] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0270000007, 0.136999995, 0.317999989, 1.0);
    v6[7] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.118000001, 0.0780000016, 0.234999999, 1.0);
    v6[8] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0590000004, 0.216000006, 0.474999994, 1.0);
    v6[9] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.195999995, 0.152999997, 0.442999989, 1.0);
    v6[10] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.133000001, 0.388000011, 0.753000021, 1.0);
    v6[11] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.352999985, 0.250999987, 0.753000021, 1.0);
    v6[12] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.219999999, 0.583999991, 0.984000027, 1.0);
    v6[13] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.545000017, 0.49000001, 0.936999977, 1.0);
    v6[14] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0939999968, 0.259000003, 0.0270000007, 1.0);
    v6[15] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0120000001, 0.192000002, 0.200000003, 1.0);
    v6[16] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.152999997, 0.372999996, 0.050999999, 1.0);
    v6[17] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0670000017, 0.36500001, 0.372999996, 1.0);
    v6[18] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.165000007, 0.620000005, 0.114, 1.0);
    v6[19] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0939999968, 0.654999971, 0.675000012, 1.0);
    v6[20] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.481999993, 0.870999992, 0.246999994, 1.0);
    v6[21] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.250999987, 0.862999976, 0.885999978, 1.0);
    v6[22] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.200000003, 0.00400000019, 0.0120000001, 1.0);
    v6[23] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.372999996, 0.216000006, 0.0309999995, 1.0);
    v6[24] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.435000002, 0.0160000008, 0.0350000001, 1.0);
    v6[25] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.522000015, 0.328999996, 0.0670000017, 1.0);
    v6[26] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.573000014, 0.0549999997, 0.105999999, 1.0);
    v6[27] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.725000024, 0.501999974, 0.172999993, 1.0);
    v6[28] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.808000028, 0.333000004, 0.337000012, 1.0);
    v6[29] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.893999994, 0.643000007, 0.224000007, 1.0);
    v3 = v6;
  }
  else
  {
    v5[0] = objc_msgSend(MEMORY[0x24BEB3C40], "clearColor");
    v5[1] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", 0.188999996, 1.0);
    v5[2] = objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
    v5[3] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", 0.453999996, 1.0);
    v5[4] = objc_msgSend(MEMORY[0x24BEB3C40], "whiteColor");
    v5[5] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", 0.754999995, 1.0);
    v5[6] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.298999995, 0.244000003, 0.342999995, 1.0);
    v5[7] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.104999997, 0.189999998, 0.272000015, 1.0);
    v5[8] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.463, 0.36500001, 0.509000003, 1.0);
    v5[9] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.30399999, 0.404000014, 0.552999973, 1.0);
    v5[10] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.619000018, 0.533999979, 0.658999979, 1.0);
    v5[11] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.470999986, 0.615999997, 0.736000001, 1.0);
    v5[12] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.762000024, 0.736999989, 0.781000018, 1.0);
    v5[13] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.694000006, 0.811999977, 0.874000013, 1.0);
    v5[14] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.153999999, 0.219999999, 0.118000001, 1.0);
    v5[15] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.213, 0.0869999975, 0.0160000008, 1.0);
    v5[16] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.349000007, 0.44600001, 0.282000005, 1.0);
    v5[17] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.393000007, 0.340000004, 0.268000007, 1.0);
    v5[18] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.460000008, 0.611000001, 0.363000005, 1.0);
    v5[19] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.619000018, 0.521000028, 0.397000015, 1.0);
    v5[20] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.702000022, 0.745000005, 0.587000012, 1.0);
    v5[21] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.771000028, 0.648999989, 0.493999988, 1.0);
    v5[22] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.365999997, 0.0500000007, 0.0179999992, 1.0);
    v5[23] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.460000008, 0.305999994, 0.155000001, 1.0);
    v5[24] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.574999988, 0.229000002, 0.164000005, 1.0);
    v5[25] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.713999987, 0.460000008, 0.247999996, 1.0);
    v5[26] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.801999986, 0.367000014, 0.31400001, 1.0);
    v5[27] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.873000026, 0.648999989, 0.34799999, 1.0);
    v5[28] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.848999977, 0.603999972, 0.560000002, 1.0);
    v5[29] = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.949999988, 0.785000026, 0.5, 1.0);
    v3 = v5;
  }
  return objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 30);
}

+ (uint64_t)presetKinds
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", String);
}

+ (uint64_t)bootstrapPresetsOfKind:()TSSAdditions inTheme:alternate:
{
  return objc_msgSend(a4, "setPresets:ofKind:", objc_msgSend(a1, "p_defaultPresetColors:", a5), a3);
}

- (__CFString)presetKind
{
  return String;
}

@end
