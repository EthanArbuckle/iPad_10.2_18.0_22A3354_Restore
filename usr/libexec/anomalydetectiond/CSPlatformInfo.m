@implementation CSPlatformInfo

+ (id)sharedInstance:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C7A78;
  block[3] = &unk_100355AA0;
  block[4] = a3;
  if (qword_100389438 != -1)
    dispatch_once(&qword_100389438, block);
  return (id)qword_100389430;
}

+ (id)sharedInstance
{
  if (qword_100389438 != -1)
    dispatch_once(&qword_100389438, &stru_1003657D8);
  return (id)qword_100389430;
}

+ (id)hardwareMap
{
  _QWORD v3[238];
  _QWORD v4[238];

  v3[0] = &off_10036C420;
  v3[1] = &off_10036C438;
  v4[0] = &off_10036C420;
  v4[1] = &off_10036C438;
  v3[2] = &off_10036C450;
  v3[3] = &off_10036C468;
  v4[2] = &off_10036C450;
  v4[3] = &off_10036C468;
  v3[4] = &off_10036C480;
  v3[5] = &off_10036C498;
  v4[4] = &off_10036C480;
  v4[5] = &off_10036C498;
  v3[6] = &off_10036C4B0;
  v3[7] = &off_10036C4C8;
  v4[6] = &off_10036C4B0;
  v4[7] = &off_10036C4C8;
  v3[8] = &off_10036C4E0;
  v3[9] = &off_10036C4F8;
  v4[8] = &off_10036C4E0;
  v4[9] = &off_10036C4F8;
  v3[10] = &off_10036C510;
  v3[11] = &off_10036C528;
  v4[10] = &off_10036C510;
  v4[11] = &off_10036C528;
  v3[12] = &off_10036C540;
  v3[13] = &off_10036C558;
  v4[12] = &off_10036C540;
  v4[13] = &off_10036C558;
  v3[14] = &off_10036C570;
  v3[15] = &off_10036C588;
  v4[14] = &off_10036C570;
  v4[15] = &off_10036C588;
  v3[16] = &off_10036C5A0;
  v3[17] = &off_10036C5B8;
  v4[16] = &off_10036C5A0;
  v4[17] = &off_10036C5B8;
  v3[18] = &off_10036C5D0;
  v3[19] = &off_10036C5E8;
  v4[18] = &off_10036C5D0;
  v4[19] = &off_10036C5E8;
  v3[20] = &off_10036C600;
  v3[21] = &off_10036C618;
  v4[20] = &off_10036C600;
  v4[21] = &off_10036C618;
  v3[22] = &off_10036C630;
  v3[23] = &off_10036C648;
  v4[22] = &off_10036C630;
  v4[23] = &off_10036C648;
  v3[24] = &off_10036C660;
  v3[25] = &off_10036C678;
  v4[24] = &off_10036C660;
  v4[25] = &off_10036C678;
  v3[26] = &off_10036C690;
  v3[27] = &off_10036C6A8;
  v4[26] = &off_10036C690;
  v4[27] = &off_10036C6A8;
  v3[28] = &off_10036C6C0;
  v3[29] = &off_10036C6D8;
  v4[28] = &off_10036C6C0;
  v4[29] = &off_10036C6D8;
  v3[30] = &off_10036C6F0;
  v3[31] = &off_10036C708;
  v4[30] = &off_10036C6F0;
  v4[31] = &off_10036C708;
  v3[32] = &off_10036C720;
  v3[33] = &off_10036C738;
  v4[32] = &off_10036C720;
  v4[33] = &off_10036C738;
  v3[34] = &off_10036C750;
  v3[35] = &off_10036C768;
  v4[34] = &off_10036C750;
  v4[35] = &off_10036C768;
  v3[36] = &off_10036C780;
  v3[37] = &off_10036C798;
  v4[36] = &off_10036C780;
  v4[37] = &off_10036C798;
  v3[38] = &off_10036C7B0;
  v3[39] = &off_10036C7C8;
  v4[38] = &off_10036C7B0;
  v4[39] = &off_10036C7C8;
  v3[40] = &off_10036C7E0;
  v3[41] = &off_10036C7F8;
  v4[40] = &off_10036C7E0;
  v4[41] = &off_10036C7F8;
  v3[42] = &off_10036C810;
  v3[43] = &off_10036C828;
  v4[42] = &off_10036C810;
  v4[43] = &off_10036C828;
  v3[44] = &off_10036C840;
  v3[45] = &off_10036C858;
  v4[44] = &off_10036C840;
  v4[45] = &off_10036C858;
  v3[46] = &off_10036C870;
  v3[47] = &off_10036C888;
  v4[46] = &off_10036C870;
  v4[47] = &off_10036C888;
  v3[48] = &off_10036C8A0;
  v3[49] = &off_10036C8B8;
  v4[48] = &off_10036C8A0;
  v4[49] = &off_10036C8B8;
  v3[50] = &off_10036C8D0;
  v3[51] = &off_10036C8E8;
  v4[50] = &off_10036C8D0;
  v4[51] = &off_10036C8E8;
  v3[52] = &off_10036C900;
  v3[53] = &off_10036C918;
  v4[52] = &off_10036C900;
  v4[53] = &off_10036C918;
  v3[54] = &off_10036C930;
  v3[55] = &off_10036C948;
  v4[54] = &off_10036C930;
  v4[55] = &off_10036C948;
  v3[56] = &off_10036C960;
  v3[57] = &off_10036C978;
  v4[56] = &off_10036C960;
  v4[57] = &off_10036C978;
  v3[58] = &off_10036C990;
  v3[59] = &off_10036C9A8;
  v4[58] = &off_10036C990;
  v4[59] = &off_10036C9A8;
  v3[60] = &off_10036C9C0;
  v3[61] = &off_10036C9D8;
  v4[60] = &off_10036C9C0;
  v4[61] = &off_10036C9D8;
  v3[62] = &off_10036C9F0;
  v3[63] = &off_10036CA08;
  v4[62] = &off_10036C9F0;
  v4[63] = &off_10036CA08;
  v3[64] = &off_10036CA20;
  v4[64] = &off_10036CA20;
  v3[65] = &off_10036CA38;
  v4[65] = &off_10036CA38;
  v3[66] = &off_10036CA50;
  v4[66] = &off_10036CA50;
  v3[67] = &off_10036CA68;
  v4[67] = &off_10036CA68;
  v3[68] = &off_10036CA80;
  v4[68] = &off_10036CA80;
  v3[69] = &off_10036CA98;
  v4[69] = &off_10036CA98;
  v3[70] = &off_10036CAB0;
  v4[70] = &off_10036CAB0;
  v3[71] = &off_10036CAC8;
  v4[71] = &off_10036CAC8;
  v3[72] = &off_10036CAE0;
  v4[72] = &off_10036CAE0;
  v3[73] = &off_10036CAF8;
  v4[73] = &off_10036CAF8;
  v3[74] = &off_10036CB10;
  v4[74] = &off_10036CB10;
  v3[75] = &off_10036CB28;
  v4[75] = &off_10036CB28;
  v3[76] = &off_10036CB40;
  v4[76] = &off_10036CB40;
  v3[77] = &off_10036CB58;
  v4[77] = &off_10036CB58;
  v3[78] = &off_10036CB70;
  v4[78] = &off_10036CB70;
  v3[79] = &off_10036CB88;
  v4[79] = &off_10036CB88;
  v3[80] = &off_10036CBA0;
  v4[80] = &off_10036CBA0;
  v3[81] = &off_10036CBB8;
  v4[81] = &off_10036CBB8;
  v3[82] = &off_10036CBD0;
  v4[82] = &off_10036CBD0;
  v3[83] = &off_10036CBE8;
  v4[83] = &off_10036CBE8;
  v3[84] = &off_10036CC00;
  v4[84] = &off_10036CC00;
  v3[85] = &off_10036CC18;
  v4[85] = &off_10036CC18;
  v3[86] = &off_10036CC30;
  v4[86] = &off_10036CC30;
  v3[87] = &off_10036CC48;
  v4[87] = &off_10036CC48;
  v3[88] = &off_10036CC60;
  v4[88] = &off_10036CC60;
  v3[89] = &off_10036CC78;
  v4[89] = &off_10036CC78;
  v3[90] = &off_10036CC90;
  v4[90] = &off_10036CC90;
  v3[91] = &off_10036CCA8;
  v4[91] = &off_10036CCA8;
  v3[92] = &off_10036CCC0;
  v4[92] = &off_10036CCC0;
  v3[93] = &off_10036CCD8;
  v4[93] = &off_10036CCD8;
  v3[94] = &off_10036CCF0;
  v4[94] = &off_10036CCF0;
  v3[95] = &off_10036CD08;
  v4[95] = &off_10036CD08;
  v3[96] = &off_10036CD20;
  v4[96] = &off_10036CD20;
  v3[97] = &off_10036CD38;
  v4[97] = &off_10036CD38;
  v3[98] = &off_10036CD50;
  v4[98] = &off_10036CD50;
  v3[99] = &off_10036CD68;
  v4[99] = &off_10036CD68;
  v3[100] = &off_10036CD80;
  v4[100] = &off_10036CD80;
  v3[101] = &off_10036CD98;
  v4[101] = &off_10036CD98;
  v3[102] = &off_10036CDB0;
  v4[102] = &off_10036CDB0;
  v3[103] = &off_10036CDC8;
  v4[103] = &off_10036CDC8;
  v3[104] = &off_10036CDE0;
  v4[104] = &off_10036CDE0;
  v3[105] = &off_10036CDF8;
  v4[105] = &off_10036CDF8;
  v3[106] = &off_10036CE10;
  v4[106] = &off_10036CE10;
  v3[107] = &off_10036CE28;
  v4[107] = &off_10036CE28;
  v3[108] = &off_10036CE40;
  v4[108] = &off_10036CE40;
  v3[109] = &off_10036CE58;
  v4[109] = &off_10036CE58;
  v3[110] = &off_10036CE70;
  v4[110] = &off_10036CE70;
  v3[111] = &off_10036CE88;
  v4[111] = &off_10036CE88;
  v3[112] = &off_10036CEA0;
  v4[112] = &off_10036CEA0;
  v3[113] = &off_10036CEB8;
  v4[113] = &off_10036CEB8;
  v3[114] = &off_10036CED0;
  v4[114] = &off_10036CED0;
  v3[115] = &off_10036CEE8;
  v4[115] = &off_10036CEE8;
  v3[116] = &off_10036CF00;
  v4[116] = &off_10036CF00;
  v3[117] = &off_10036CF18;
  v4[117] = &off_10036CF18;
  v3[118] = &off_10036CF30;
  v4[118] = &off_10036CF30;
  v3[119] = &off_10036CF48;
  v4[119] = &off_10036CF48;
  v3[120] = &off_10036CF60;
  v4[120] = &off_10036CF60;
  v3[121] = &off_10036CF78;
  v4[121] = &off_10036CF78;
  v3[122] = &off_10036CF90;
  v4[122] = &off_10036CF90;
  v3[123] = &off_10036CFA8;
  v4[123] = &off_10036CFA8;
  v3[124] = &off_10036CFC0;
  v4[124] = &off_10036CFC0;
  v3[125] = &off_10036CFD8;
  v4[125] = &off_10036CFD8;
  v3[126] = &off_10036CFF0;
  v4[126] = &off_10036CFF0;
  v3[127] = &off_10036D008;
  v4[127] = &off_10036D008;
  v3[128] = &off_10036D020;
  v4[128] = &off_10036D020;
  v3[129] = &off_10036D038;
  v4[129] = &off_10036D038;
  v3[130] = &off_10036D050;
  v4[130] = &off_10036D050;
  v3[131] = &off_10036D068;
  v4[131] = &off_10036D068;
  v3[132] = &off_10036D080;
  v4[132] = &off_10036D080;
  v3[133] = &off_10036D098;
  v4[133] = &off_10036D098;
  v3[134] = &off_10036D0B0;
  v4[134] = &off_10036D0B0;
  v3[135] = &off_10036D0C8;
  v4[135] = &off_10036D0C8;
  v3[136] = &off_10036D0E0;
  v4[136] = &off_10036D0E0;
  v3[137] = &off_10036D0F8;
  v4[137] = &off_10036D0F8;
  v3[138] = &off_10036D110;
  v4[138] = &off_10036D110;
  v3[139] = &off_10036D128;
  v4[139] = &off_10036D128;
  v3[140] = &off_10036D140;
  v4[140] = &off_10036D140;
  v3[141] = &off_10036D158;
  v4[141] = &off_10036D158;
  v3[142] = &off_10036D170;
  v4[142] = &off_10036D170;
  v3[143] = &off_10036D188;
  v4[143] = &off_10036D188;
  v3[144] = &off_10036D1A0;
  v4[144] = &off_10036D1A0;
  v3[145] = &off_10036D1B8;
  v4[145] = &off_10036D1B8;
  v3[146] = &off_10036D1D0;
  v4[146] = &off_10036D1D0;
  v3[147] = &off_10036D1E8;
  v4[147] = &off_10036D1E8;
  v3[148] = &off_10036D200;
  v4[148] = &off_10036D200;
  v3[149] = &off_10036D218;
  v4[149] = &off_10036D218;
  v3[150] = &off_10036D230;
  v4[150] = &off_10036D230;
  v3[151] = &off_10036D248;
  v4[151] = &off_10036D248;
  v3[152] = &off_10036D260;
  v4[152] = &off_10036D260;
  v3[153] = &off_10036D278;
  v4[153] = &off_10036D278;
  v3[154] = &off_10036D290;
  v4[154] = &off_10036D290;
  v3[155] = &off_10036D2A8;
  v4[155] = &off_10036D2A8;
  v3[156] = &off_10036D2C0;
  v4[156] = &off_10036D2C0;
  v3[157] = &off_10036D2D8;
  v4[157] = &off_10036D2D8;
  v3[158] = &off_10036D2F0;
  v4[158] = &off_10036D2F0;
  v3[159] = &off_10036D308;
  v4[159] = &off_10036D308;
  v3[160] = &off_10036D320;
  v4[160] = &off_10036D320;
  v3[161] = &off_10036D338;
  v4[161] = &off_10036D338;
  v3[162] = &off_10036D350;
  v4[162] = &off_10036D350;
  v3[163] = &off_10036D368;
  v4[163] = &off_10036D368;
  v3[164] = &off_10036D380;
  v4[164] = &off_10036D380;
  v3[165] = &off_10036D398;
  v4[165] = &off_10036D398;
  v3[166] = &off_10036D3B0;
  v4[166] = &off_10036D3B0;
  v3[167] = &off_10036D3C8;
  v4[167] = &off_10036D3C8;
  v3[168] = &off_10036D3E0;
  v4[168] = &off_10036D3E0;
  v3[169] = &off_10036D3F8;
  v4[169] = &off_10036D3F8;
  v3[170] = &off_10036D410;
  v4[170] = &off_10036D410;
  v3[171] = &off_10036D428;
  v4[171] = &off_10036D428;
  v3[172] = &off_10036D440;
  v4[172] = &off_10036D440;
  v3[173] = &off_10036D458;
  v4[173] = &off_10036D458;
  v3[174] = &off_10036D470;
  v4[174] = &off_10036D470;
  v3[175] = &off_10036D488;
  v4[175] = &off_10036D488;
  v3[176] = &off_10036D4A0;
  v4[176] = &off_10036D4A0;
  v3[177] = &off_10036D4B8;
  v4[177] = &off_10036D4B8;
  v3[178] = &off_10036D4D0;
  v4[178] = &off_10036D4D0;
  v3[179] = &off_10036D4E8;
  v4[179] = &off_10036D4E8;
  v3[180] = &off_10036D500;
  v4[180] = &off_10036D500;
  v3[181] = &off_10036D518;
  v4[181] = &off_10036D518;
  v3[182] = &off_10036D530;
  v4[182] = &off_10036D530;
  v3[183] = &off_10036D548;
  v4[183] = &off_10036D548;
  v3[184] = &off_10036D560;
  v4[184] = &off_10036D560;
  v3[185] = &off_10036D578;
  v4[185] = &off_10036D578;
  v3[186] = &off_10036D590;
  v4[186] = &off_10036D590;
  v3[187] = &off_10036D5A8;
  v4[187] = &off_10036D5A8;
  v3[188] = &off_10036D5C0;
  v4[188] = &off_10036D5C0;
  v3[189] = &off_10036D5D8;
  v4[189] = &off_10036D5D8;
  v3[190] = &off_10036D5F0;
  v4[190] = &off_10036D5F0;
  v3[191] = &off_10036D608;
  v4[191] = &off_10036D608;
  v3[192] = &off_10036D620;
  v4[192] = &off_10036D620;
  v3[193] = &off_10036D638;
  v4[193] = &off_10036D638;
  v3[194] = &off_10036D650;
  v4[194] = &off_10036D650;
  v3[195] = &off_10036D668;
  v4[195] = &off_10036D668;
  v3[196] = &off_10036D680;
  v4[196] = &off_10036D680;
  v3[197] = &off_10036D698;
  v4[197] = &off_10036D698;
  v3[198] = &off_10036D6B0;
  v4[198] = &off_10036D6B0;
  v3[199] = &off_10036D6C8;
  v4[199] = &off_10036D6C8;
  v3[200] = &off_10036D6E0;
  v4[200] = &off_10036D6E0;
  v3[201] = &off_10036D6F8;
  v4[201] = &off_10036D6F8;
  v3[202] = &off_10036D710;
  v4[202] = &off_10036D710;
  v3[203] = &off_10036D728;
  v4[203] = &off_10036D728;
  v3[204] = &off_10036D740;
  v4[204] = &off_10036D740;
  v3[205] = &off_10036D758;
  v4[205] = &off_10036D758;
  v3[206] = &off_10036D770;
  v4[206] = &off_10036D770;
  v3[207] = &off_10036D788;
  v4[207] = &off_10036D788;
  v3[208] = &off_10036D7A0;
  v4[208] = &off_10036D7A0;
  v3[209] = &off_10036D7B8;
  v4[209] = &off_10036D7B8;
  v3[210] = &off_10036D7D0;
  v4[210] = &off_10036D7D0;
  v3[211] = &off_10036D7E8;
  v4[211] = &off_10036D7E8;
  v3[212] = &off_10036D800;
  v4[212] = &off_10036D800;
  v3[213] = &off_10036D818;
  v4[213] = &off_10036D818;
  v3[214] = &off_10036D830;
  v4[214] = &off_10036D830;
  v3[215] = &off_10036D848;
  v4[215] = &off_10036D848;
  v3[216] = &off_10036D860;
  v4[216] = &off_10036D860;
  v3[217] = &off_10036D878;
  v4[217] = &off_10036D878;
  v3[218] = &off_10036D890;
  v4[218] = &off_10036D890;
  v3[219] = &off_10036D8A8;
  v4[219] = &off_10036D8A8;
  v3[220] = &off_10036D8C0;
  v4[220] = &off_10036D8C0;
  v3[221] = &off_10036D8D8;
  v4[221] = &off_10036D8D8;
  v3[222] = &off_10036D8F0;
  v4[222] = &off_10036D8F0;
  v3[223] = &off_10036D908;
  v4[223] = &off_10036D908;
  v3[224] = &off_10036D920;
  v4[224] = &off_10036D920;
  v3[225] = &off_10036D938;
  v4[225] = &off_10036D938;
  v3[226] = &off_10036D950;
  v4[226] = &off_10036D950;
  v3[227] = &off_10036D968;
  v4[227] = &off_10036D968;
  v3[228] = &off_10036D980;
  v4[228] = &off_10036D980;
  v3[229] = &off_10036D998;
  v4[229] = &off_10036D998;
  v3[230] = &off_10036D9B0;
  v4[230] = &off_10036D9B0;
  v3[231] = &off_10036D9C8;
  v4[231] = &off_10036D9C8;
  v3[232] = &off_10036D9E0;
  v4[232] = &off_10036D9E0;
  v3[233] = &off_10036D9F8;
  v4[233] = &off_10036D9F8;
  v3[234] = &off_10036DA10;
  v4[234] = &off_10036DA10;
  v3[235] = &off_10036DA28;
  v4[235] = &off_10036DA28;
  v3[236] = &off_10036DA40;
  v4[236] = &off_10036DA40;
  v3[237] = &off_10036DA58;
  v4[237] = &off_10036DA58;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 238));
}

- (CSPlatformInfo)init
{
  CSPlatformInfo *v2;
  CSPlatformInfo *v3;
  NSObject *v4;
  unint64_t hardware;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  void *v12;

  v8.receiver = self;
  v8.super_class = (Class)CSPlatformInfo;
  v2 = -[CSPlatformInfo init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_hardware = -[CSPlatformInfo getSystemHardware](v2, "getSystemHardware");
    if (qword_100387350 != -1)
      dispatch_once(&qword_100387350, &stru_100365858);
    v4 = (id)qword_100387358;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      hardware = v3->_hardware;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSPlatformInfo getSystemVersionDescription](v3, "getSystemVersionDescription"));
      *(_DWORD *)buf = 67109378;
      v10 = hardware;
      v11 = 2112;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "hw = %d (%@)", buf, 0x12u);

    }
    v3->_isSimulated = 0;
  }
  return v3;
}

- (CSPlatformInfo)initWithHardware:(unint64_t)a3
{
  CSPlatformInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSPlatformInfo;
  result = -[CSPlatformInfo init](&v5, "init");
  if (result)
  {
    result->_hardware = a3;
    result->_isSimulated = 1;
  }
  return result;
}

- (BOOL)isDOEDeviceDefaultSet
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CSKappaDeviceIsDOE"));

  return v3;
}

- (BOOL)forceDetectionDevice
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CSKappaForceDetection"));

  return v3;
}

- (BOOL)isKappaDetectionDevice
{
  BOOL v3;

  v3 = -[CSPlatformInfo isKappaDetectionDevice:](self, "isKappaDetectionDevice:", self->_hardware);
  if (-[CSPlatformInfo isKappaLoggingDevice:](self, "isKappaLoggingDevice:", self->_hardware)
    && !v3
    && -[CSPlatformInfo forceDetectionDevice](self, "forceDetectionDevice"))
  {
    return 1;
  }
  return v3;
}

- (BOOL)isKappaDetectionDevice:(unint64_t)a3
{
  NSObject *v4;
  BOOL v5;
  uint8_t v12[16];

  if (a3 != 194 || !-[CSPlatformInfo isDOEDeviceDefaultSet](self, "isDOEDeviceDefaultSet"))
    return a3 - 229 < 2
        || a3 - 87 < 2
        || a3 - 91 < 2
        || (a3 & 0xFFFFFFFFFFFFFFFELL) == 202
        || (a3 & 0xFFFFFFFFFFFFFFFBLL) - 89 < 2
        || a3 - 145 < 0x12;
  if (qword_100387350 != -1)
    dispatch_once(&qword_100387350, &stru_100365858);
  v4 = qword_100387358;
  v5 = 1;
  if (os_log_type_enabled((os_log_t)qword_100387358, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "is DOE default set, overriding", v12, 2u);
  }
  return v5;
}

- (BOOL)isKappaLoggingDevice
{
  unsigned __int8 v3;
  _BOOL4 v4;

  v3 = -[CSPlatformInfo isKappaDetectionDevice:](self, "isKappaDetectionDevice:", self->_hardware);
  v4 = -[CSPlatformInfo isKappaLoggingDevice:](self, "isKappaLoggingDevice:", self->_hardware);
  if (v4 && (v3 & 1) == 0 && -[CSPlatformInfo forceDetectionDevice](self, "forceDetectionDevice"))
    LOBYTE(v4) = 0;
  return v4;
}

- (BOOL)isKappaLoggingDevice:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v8[16];
  uint64_t v9;
  uint64_t v10;

  if (a3 - 168 > 0x3C)
    goto LABEL_10;
  if (((1 << (a3 + 88)) & 0x100000037A000015) != 0)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (a3 != 194)
  {
LABEL_10:
    LOBYTE(v5) = 0;
    return v5;
  }
  v9 = v3;
  v10 = v4;
  if (-[CSPlatformInfo isDOEDeviceDefaultSet](self, "isDOEDeviceDefaultSet"))
  {
    if (qword_100387350 != -1)
      dispatch_once(&qword_100387350, &stru_100365858);
    v6 = qword_100387358;
    v5 = os_log_type_enabled((os_log_t)qword_100387358, OS_LOG_TYPE_INFO);
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "is DOE default set, overriding", v8, 2u);
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isEigerDevice
{
  unint64_t hardware;
  unint64_t v3;
  unint64_t v4;
  BOOL v6;

  hardware = self->_hardware;
  v3 = hardware - 137;
  v4 = hardware - 193;
  v6 = v4 <= 8 && v4 != 6;
  return v3 < 0xC || v6;
}

- (BOOL)isSovereignDevice
{
  unint64_t hardware;
  unint64_t v3;
  BOOL v4;
  BOOL v5;
  uint64_t v6;

  hardware = self->_hardware;
  v3 = hardware - 197;
  v4 = hardware - 141 < 4;
  v5 = v3 > 0x1F;
  v6 = (1 << v3) & 0x8000001BLL;
  return !v5 && v6 != 0 || v4;
}

- (BOOL)isExtendedPretriggerDMDevice
{
  unint64_t hardware;
  unint64_t v3;
  BOOL v4;

  hardware = self->_hardware;
  v3 = hardware - 154;
  v4 = hardware - 87 < 4;
  return v3 < 5 || v4;
}

- (BOOL)isExtendedPretriggerMagDevice
{
  unint64_t hardware;
  unint64_t v3;
  BOOL v4;

  hardware = self->_hardware;
  v3 = hardware - 154;
  v4 = hardware - 87 < 4;
  return v3 < 5 || v4;
}

- (BOOL)isMDevice
{
  return self->_hardware - 91 < 4;
}

- (int)getSystemReleaseType
{
  if (qword_100389440 != -1)
    dispatch_once(&qword_100389440, &stru_1003657F8);
  return dword_1003891B8;
}

- (BOOL)isInternalInstall
{
  void *v2;
  unsigned __int16 v3;
  BOOL v4;
  NSObject *v5;
  _DWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v3 = (unsigned __int16)objc_msgSend(v2, "getBooleanDefault:", CFSTR("CSKappaForceNotInternal"));

  if (v3 >= 0x100u)
  {
    v4 = v3 == 0;
    if (qword_100387350 != -1)
      dispatch_once(&qword_100387350, &stru_100365858);
    v5 = qword_100387358;
    if (os_log_type_enabled((os_log_t)qword_100387358, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109120;
      v7[1] = v3 == 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "isInternalInstall forcing internal = %d", (uint8_t *)v7, 8u);
    }
  }
  else
  {
    if (qword_100389450 != -1)
      dispatch_once(&qword_100389450, &stru_100365818);
    return byte_100389448;
  }
  return v4;
}

- (id)getSystem:(const char *)a3
{
  size_t v4;
  _BYTE v5[128];

  v4 = 128;
  if (sysctlbyname(a3, v5, &v4, 0, 0))
    return &stru_100366D80;
  else
    return objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v5);
}

- (id)getSystemModel
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C9518;
  block[3] = &unk_10034B158;
  block[4] = self;
  if (qword_100389460 != -1)
    dispatch_once(&qword_100389460, block);
  return (id)qword_100389458;
}

- (id)getSystemVersionDescription
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v2 = _CFCopyServerVersionDictionary(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (!v3)
  {
    v4 = _CFCopySystemVersionDictionary();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", _kCFSystemVersionProductVersionKey));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", _kCFSystemVersionProductNameKey));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", _kCFSystemVersionBuildVersionKey));
  v8 = CFSTR("???");
  if (v6)
    v9 = v6;
  else
    v9 = CFSTR("???");
  if (v5)
    v10 = v5;
  else
    v10 = CFSTR("???");
  if (v7)
    v8 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v9, v10, v8));

  return v11;
}

- (id)getSystemVersionDescriptionNoBuild
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v2 = _CFCopyServerVersionDictionary(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (!v3)
  {
    v4 = _CFCopySystemVersionDictionary();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", _kCFSystemVersionProductVersionKey));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", _kCFSystemVersionProductNameKey));
  v7 = CFSTR("???");
  if (v6)
    v8 = v6;
  else
    v8 = CFSTR("???");
  if (v5)
    v7 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v8, v7));

  return v9;
}

- (unint64_t)getSystemHardware
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C97D8;
  block[3] = &unk_10034B158;
  block[4] = self;
  if (qword_100389470 != -1)
    dispatch_once(&qword_100389470, block);
  return qword_100389468;
}

- (unint64_t)queryEmbeddedSystemHardware
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  const void *v222;
  id v223;
  NSObject *v224;
  __int128 v225;
  int v226;
  uint8_t buf[16];
  int v228;

  if ((MGIsDeviceOfType(0, a2) & 1) != 0 || (MGIsDeviceOfType(0, v2) & 1) != 0)
    return 10;
  if ((MGIsDeviceOfType(0, v3) & 1) != 0)
    return 15;
  if ((MGIsDeviceOfType(0, v5) & 1) != 0 || (MGIsDeviceOfType(0, v6) & 1) != 0)
    return 12;
  if ((MGIsDeviceOfType(0, v7) & 1) != 0)
    return 13;
  if ((MGIsDeviceOfType(0, v8) & 1) != 0)
    return 14;
  if ((MGIsDeviceOfType(0, v9) & 1) != 0)
    return 16;
  if ((MGIsDeviceOfType(0, v10) & 1) != 0)
    return 17;
  v228 = 1244490093;
  *(_OWORD *)buf = xmmword_1002EE488;
  if ((MGIsDeviceOfType(buf, v11) & 1) != 0)
    return 25;
  v226 = 1377801277;
  v225 = xmmword_1002EE49C;
  if ((MGIsDeviceOfType(&v225, v12) & 1) != 0)
    return 25;
  if ((MGIsDeviceOfType(0, v13) & 1) != 0)
    return 49;
  if ((MGIsDeviceOfType(0, v14) & 1) != 0)
    return 50;
  v228 = 1839812531;
  *(_OWORD *)buf = xmmword_1002EE4B0;
  if ((MGIsDeviceOfType(buf, v15) & 1) != 0 || (MGIsDeviceOfType(0, v16) & 1) != 0)
    return 50;
  if ((MGIsDeviceOfType(0, v17) & 1) != 0)
    return 82;
  v228 = -435113336;
  *(_OWORD *)buf = xmmword_1002EE4C4;
  if ((MGIsDeviceOfType(buf, v18) & 1) != 0)
    return 83;
  v228 = -1997581659;
  *(_OWORD *)buf = xmmword_1002EE4D8;
  if ((MGIsDeviceOfType(buf, v19) & 1) != 0 || (MGIsDeviceOfType(0, v20) & 1) != 0)
    return 187;
  if ((MGIsDeviceOfType(0, v21) & 1) != 0)
    return 18;
  if ((MGIsDeviceOfType(0, v22) & 1) != 0 || (MGIsDeviceOfType(0, v23) & 1) != 0)
    return 19;
  v228 = -38605833;
  *(_OWORD *)buf = xmmword_1002EE4EC;
  if ((MGIsDeviceOfType(buf, v24) & 1) != 0)
    return 20;
  v228 = -894965712;
  *(_OWORD *)buf = xmmword_1002EE500;
  if ((MGIsDeviceOfType(buf, v25) & 1) != 0)
    return 21;
  if ((MGIsDeviceOfType(0, v26) & 1) != 0)
    return 23;
  v228 = -926344036;
  *(_OWORD *)buf = xmmword_1002EE514;
  if ((MGIsDeviceOfType(buf, v27) & 1) != 0)
    return 26;
  v228 = -954998212;
  *(_OWORD *)buf = xmmword_1002EE528;
  if ((MGIsDeviceOfType(buf, v28) & 1) != 0)
    return 27;
  v228 = 436612651;
  *(_OWORD *)buf = xmmword_1002EE53C;
  if ((MGIsDeviceOfType(buf, v29) & 1) != 0)
    return 28;
  if ((MGIsDeviceOfType(0, v30) & 1) != 0)
    return 29;
  if ((MGIsDeviceOfType(0, v31) & 1) != 0)
    return 30;
  if ((MGIsDeviceOfType(0, v32) & 1) != 0)
    return 31;
  if ((MGIsDeviceOfType(0, v33) & 1) != 0)
    return 32;
  v228 = 28030256;
  *(_OWORD *)buf = xmmword_1002EE550;
  if ((MGIsDeviceOfType(buf, v34) & 1) != 0)
    return 33;
  v228 = 1214363620;
  *(_OWORD *)buf = xmmword_1002EE564;
  if ((MGIsDeviceOfType(buf, v35) & 1) != 0)
    return 34;
  v228 = -2101636455;
  *(_OWORD *)buf = xmmword_1002EE578;
  if ((MGIsDeviceOfType(buf, v36) & 1) != 0)
    return 35;
  v228 = -1955568593;
  *(_OWORD *)buf = xmmword_1002EE58C;
  if ((MGIsDeviceOfType(buf, v37) & 1) != 0)
    return 36;
  v228 = 1602014129;
  *(_OWORD *)buf = xmmword_1002EE5A0;
  if ((MGIsDeviceOfType(buf, v38) & 1) != 0)
    return 37;
  v228 = -810116762;
  *(_OWORD *)buf = xmmword_1002EE5B4;
  if ((MGIsDeviceOfType(buf, v39) & 1) != 0)
    return 38;
  v228 = -1195351767;
  *(_OWORD *)buf = xmmword_1002EE5C8;
  if ((MGIsDeviceOfType(buf, v40) & 1) != 0)
    return 39;
  if ((MGIsDeviceOfType(0, v41) & 1) != 0)
    return 40;
  if ((MGIsDeviceOfType(0, v42) & 1) != 0)
    return 41;
  v228 = 1789837692;
  *(_OWORD *)buf = xmmword_1002EE5DC;
  if ((MGIsDeviceOfType(buf, v43) & 1) != 0)
    return 43;
  v228 = 48355600;
  *(_OWORD *)buf = xmmword_1002EE5F0;
  if ((MGIsDeviceOfType(buf, v44) & 1) != 0)
    return 44;
  v228 = -1239654590;
  *(_OWORD *)buf = xmmword_1002EE604;
  if ((MGIsDeviceOfType(buf, v45) & 1) != 0)
    return 45;
  v228 = -679691073;
  *(_OWORD *)buf = xmmword_1002EE618;
  if ((MGIsDeviceOfType(buf, v46) & 1) != 0)
    return 46;
  v228 = -1579092758;
  *(_OWORD *)buf = xmmword_1002EE62C;
  if ((MGIsDeviceOfType(buf, v47) & 1) != 0)
    return 47;
  v228 = 1430379884;
  *(_OWORD *)buf = xmmword_1002EE640;
  if ((MGIsDeviceOfType(buf, v48) & 1) != 0)
    return 48;
  if ((MGIsDeviceOfType(0, v49) & 1) != 0)
    return 51;
  v228 = -798153473;
  *(_OWORD *)buf = xmmword_1002EE654;
  if ((MGIsDeviceOfType(buf, v50) & 1) != 0)
    return 52;
  v228 = -776721724;
  *(_OWORD *)buf = xmmword_1002EE668;
  if ((MGIsDeviceOfType(buf, v51) & 1) != 0)
    return 53;
  v228 = -1403227947;
  *(_OWORD *)buf = xmmword_1002EE67C;
  if ((MGIsDeviceOfType(buf, v52) & 1) != 0)
    return 54;
  v228 = 729118884;
  *(_OWORD *)buf = xmmword_1002EE690;
  if ((MGIsDeviceOfType(buf, v53) & 1) != 0)
    return 55;
  v228 = 1046806126;
  *(_OWORD *)buf = xmmword_1002EE6A4;
  if ((MGIsDeviceOfType(buf, v54) & 1) != 0)
    return 56;
  v226 = -188760945;
  v225 = xmmword_1002EE6B8;
  if ((MGIsDeviceOfType(&v225, v55) & 1) != 0)
    return 56;
  v228 = -489993439;
  *(_OWORD *)buf = xmmword_1002EE6CC;
  if ((MGIsDeviceOfType(buf, v56) & 1) != 0)
    return 57;
  v228 = 886875686;
  *(_OWORD *)buf = xmmword_1002EE6E0;
  if ((MGIsDeviceOfType(buf, v57) & 1) != 0)
    return 58;
  v228 = -1639077591;
  *(_OWORD *)buf = xmmword_1002EE6F4;
  if ((MGIsDeviceOfType(buf, v58) & 1) != 0)
    return 59;
  v228 = 338555555;
  *(_OWORD *)buf = xmmword_1002EE708;
  if ((MGIsDeviceOneOfType(buf) & 1) != 0)
    return 60;
  v228 = 1032708406;
  *(_OWORD *)buf = xmmword_1002EE71C;
  if ((MGIsDeviceOfType(buf, v59) & 1) != 0)
    return 61;
  v228 = 729903963;
  *(_OWORD *)buf = xmmword_1002EE730;
  if ((MGIsDeviceOfType(buf, v60) & 1) != 0)
    return 62;
  v228 = 1278131292;
  *(_OWORD *)buf = xmmword_1002EE744;
  if ((MGIsDeviceOfType(buf, v61) & 1) != 0)
    return 63;
  v228 = -1841712216;
  *(_OWORD *)buf = xmmword_1002EE758;
  if ((MGIsDeviceOfType(buf, v62) & 1) != 0)
    return 64;
  v228 = 1275676051;
  *(_OWORD *)buf = xmmword_1002EE76C;
  if ((MGIsDeviceOfType(buf, v63) & 1) != 0)
    return 65;
  v228 = 1908474541;
  *(_OWORD *)buf = xmmword_1002EE780;
  if ((MGIsDeviceOfType(buf, v64) & 1) != 0)
    return 66;
  v228 = -1022451852;
  *(_OWORD *)buf = xmmword_1002EE794;
  if ((MGIsDeviceOfType(buf, v65) & 1) != 0)
    return 100;
  v228 = 1729782187;
  *(_OWORD *)buf = xmmword_1002EE7A8;
  if ((MGIsDeviceOfType(buf, v66) & 1) != 0)
    return 101;
  if ((MGIsDeviceOfType(0, v67) & 1) != 0)
    return 67;
  v228 = 368885834;
  *(_OWORD *)buf = xmmword_1002EE7BC;
  if ((MGIsDeviceOfType(buf, v68) & 1) != 0)
    return 68;
  v228 = -414334491;
  *(_OWORD *)buf = xmmword_1002EE7D0;
  if ((MGIsDeviceOfType(buf, v69) & 1) != 0)
    return 69;
  if ((MGIsDeviceOfType(0, v70) & 1) != 0)
    return 70;
  v228 = -526227167;
  *(_OWORD *)buf = xmmword_1002EE7E4;
  if ((MGIsDeviceOfType(buf, v71) & 1) != 0)
    return 71;
  v228 = -1509831889;
  *(_OWORD *)buf = xmmword_1002EE7F8;
  if ((MGIsDeviceOfType(buf, v72) & 1) != 0)
    return 72;
  v228 = 1960366092;
  *(_OWORD *)buf = xmmword_1002EE80C;
  if ((MGIsDeviceOfType(buf, v73) & 1) != 0)
    return 73;
  v228 = -2114570942;
  *(_OWORD *)buf = xmmword_1002EE820;
  if ((MGIsDeviceOfType(buf, v74) & 1) != 0)
    return 177;
  v228 = -1527788847;
  *(_OWORD *)buf = xmmword_1002EE834;
  if ((MGIsDeviceOfType(buf, v75) & 1) != 0)
    return 74;
  v228 = 1532898719;
  *(_OWORD *)buf = xmmword_1002EE848;
  if ((MGIsDeviceOfType(buf, v76) & 1) != 0)
    return 75;
  v228 = 996646949;
  *(_OWORD *)buf = xmmword_1002EE85C;
  if ((MGIsDeviceOfType(buf, v77) & 1) != 0)
    return 76;
  v228 = -563086000;
  *(_OWORD *)buf = xmmword_1002EE870;
  if ((MGIsDeviceOfType(buf, v78) & 1) != 0)
    return 77;
  v228 = 659506830;
  *(_OWORD *)buf = xmmword_1002EE884;
  if ((MGIsDeviceOfType(buf, v79) & 1) != 0)
    return 78;
  v228 = 213746202;
  *(_OWORD *)buf = xmmword_1002EE898;
  if ((MGIsDeviceOfType(buf, v80) & 1) != 0)
    return 79;
  v228 = 289690957;
  *(_OWORD *)buf = xmmword_1002EE8AC;
  if ((MGIsDeviceOfType(buf, v81) & 1) != 0)
    return 80;
  v228 = 586720268;
  *(_OWORD *)buf = xmmword_1002EE8C0;
  if ((MGIsDeviceOfType(buf, v82) & 1) != 0)
    return 81;
  v228 = -350584140;
  *(_OWORD *)buf = xmmword_1002EE8D4;
  if ((MGIsDeviceOfType(buf, v83) & 1) != 0)
    return 84;
  v228 = 368778837;
  *(_OWORD *)buf = xmmword_1002EE8E8;
  if ((MGIsDeviceOfType(buf, v84) & 1) != 0)
    return 85;
  if ((MGIsDeviceOfType(0, v85) & 1) != 0)
    return 86;
  v228 = -609570151;
  *(_OWORD *)buf = xmmword_1002EE8FC;
  if ((MGIsDeviceOfType(buf, v86) & 1) != 0)
    return 87;
  v228 = -874769875;
  *(_OWORD *)buf = xmmword_1002EE910;
  if ((MGIsDeviceOfType(buf, v87) & 1) != 0)
    return 88;
  v228 = 1223847566;
  *(_OWORD *)buf = xmmword_1002EE924;
  if ((MGIsDeviceOfType(buf, v88) & 1) != 0)
    return 91;
  v228 = 185580364;
  *(_OWORD *)buf = xmmword_1002EE938;
  if ((MGIsDeviceOfType(buf, v89) & 1) != 0)
    return 92;
  v228 = -1418383976;
  *(_OWORD *)buf = xmmword_1002EE94C;
  if ((MGIsDeviceOfType(buf, v90) & 1) != 0)
    return 95;
  v228 = -1213485500;
  *(_OWORD *)buf = xmmword_1002EE960;
  if ((MGIsDeviceOfType(buf, v91) & 1) != 0)
    return 96;
  if ((MGIsDeviceOfType(0, v92) & 1) != 0)
    return 97;
  v228 = 1425254930;
  *(_OWORD *)buf = xmmword_1002EE974;
  if ((MGIsDeviceOfType(buf, v93) & 1) != 0)
    return 98;
  v228 = 1899561076;
  *(_OWORD *)buf = xmmword_1002EE988;
  if ((MGIsDeviceOfType(buf, v94) & 1) != 0)
    return 99;
  v228 = -199226823;
  *(_OWORD *)buf = xmmword_1002EE99C;
  if ((MGIsDeviceOfType(buf, v95) & 1) != 0)
    return 102;
  v226 = 1412427398;
  v225 = xmmword_1002EE9B0;
  if ((MGIsDeviceOfType(&v225, v96) & 1) != 0)
    return 102;
  v228 = -1283070668;
  *(_OWORD *)buf = xmmword_1002EE9C4;
  if ((MGIsDeviceOfType(buf, v97) & 1) != 0)
    return 103;
  v226 = 160260070;
  v225 = xmmword_1002EE9D8;
  if ((MGIsDeviceOfType(&v225, v98) & 1) != 0)
    return 103;
  v228 = 1711910369;
  *(_OWORD *)buf = xmmword_1002EE9EC;
  if ((MGIsDeviceOfType(buf, v99) & 1) != 0)
    return 104;
  v228 = -1282800328;
  *(_OWORD *)buf = xmmword_1002EEA00;
  if ((MGIsDeviceOfType(buf, v100) & 1) != 0)
    return 105;
  v228 = 897736383;
  *(_OWORD *)buf = xmmword_1002EEA14;
  if ((MGIsDeviceOfType(buf, v101) & 1) != 0)
    return 106;
  v228 = -453987047;
  *(_OWORD *)buf = xmmword_1002EEA28;
  if ((MGIsDeviceOfType(buf, v102) & 1) != 0)
    return 107;
  v228 = 450980336;
  *(_OWORD *)buf = xmmword_1002EEA3C;
  if ((MGIsDeviceOfType(buf, v103) & 1) != 0)
    return 108;
  v228 = 414393924;
  *(_OWORD *)buf = xmmword_1002EEA50;
  if ((MGIsDeviceOfType(buf, v104) & 1) != 0)
    return 109;
  v228 = -996295886;
  *(_OWORD *)buf = xmmword_1002EEA64;
  if ((MGIsDeviceOfType(buf, v105) & 1) != 0)
    return 110;
  v228 = -337121064;
  *(_OWORD *)buf = xmmword_1002EEA78;
  if ((MGIsDeviceOfType(buf, v106) & 1) != 0)
    return 111;
  v228 = -2092955395;
  *(_OWORD *)buf = xmmword_1002EEA8C;
  if ((MGIsDeviceOfType(buf, v107) & 1) != 0)
    return 112;
  v228 = 674998600;
  *(_OWORD *)buf = xmmword_1002EEAA0;
  if ((MGIsDeviceOfType(buf, v108) & 1) != 0)
    return 113;
  v228 = 317289457;
  *(_OWORD *)buf = xmmword_1002EEAB4;
  if ((MGIsDeviceOfType(buf, v109) & 1) != 0)
    return 114;
  v228 = 401945557;
  *(_OWORD *)buf = xmmword_1002EEAC8;
  if ((MGIsDeviceOfType(buf, v110) & 1) != 0)
    return 115;
  v228 = -232427879;
  *(_OWORD *)buf = xmmword_1002EEADC;
  if ((MGIsDeviceOfType(buf, v111) & 1) != 0)
    return 116;
  v228 = -427474227;
  *(_OWORD *)buf = xmmword_1002EEAF0;
  if ((MGIsDeviceOfType(buf, v112) & 1) != 0)
    return 117;
  v226 = 1477534141;
  v225 = xmmword_1002EEB04;
  if ((MGIsDeviceOfType(&v225, v113) & 1) != 0)
    return 117;
  v228 = -1843102369;
  *(_OWORD *)buf = xmmword_1002EEB18;
  if ((MGIsDeviceOfType(buf, v114) & 1) != 0)
    return 118;
  if ((MGIsDeviceOfType(0, v115) & 1) != 0)
    return 119;
  v228 = 470738981;
  *(_OWORD *)buf = xmmword_1002EEB2C;
  if ((MGIsDeviceOfType(buf, v116) & 1) != 0)
    return 120;
  if ((MGIsDeviceOfType(0, v117) & 1) != 0)
    return 121;
  v228 = 710807826;
  *(_OWORD *)buf = xmmword_1002EEB40;
  if ((MGIsDeviceOfType(buf, v118) & 1) != 0)
    return 122;
  if ((MGIsDeviceOfType(0, v119) & 1) != 0)
    return 123;
  v228 = 1860682089;
  *(_OWORD *)buf = xmmword_1002EEB54;
  if ((MGIsDeviceOfType(buf, v120) & 1) != 0)
    return 124;
  if ((MGIsDeviceOfType(0, v121) & 1) != 0)
    return 125;
  v228 = -2085056298;
  *(_OWORD *)buf = xmmword_1002EEB68;
  if ((MGIsDeviceOfType(buf, v122) & 1) != 0)
    return 126;
  v228 = 2146530832;
  *(_OWORD *)buf = xmmword_1002EEB7C;
  if ((MGIsDeviceOfType(buf, v123) & 1) != 0)
    return 127;
  v228 = -1742178852;
  *(_OWORD *)buf = xmmword_1002EEB90;
  if ((MGIsDeviceOfType(buf, v124) & 1) != 0)
    return 128;
  v228 = 617174804;
  *(_OWORD *)buf = xmmword_1002EEBA4;
  if ((MGIsDeviceOfType(buf, v125) & 1) != 0)
    return 129;
  v228 = 1330813729;
  *(_OWORD *)buf = xmmword_1002EEBB8;
  if ((MGIsDeviceOfType(buf, v126) & 1) != 0)
    return 130;
  if ((MGIsDeviceOfType(0, v127) & 1) != 0)
    return 131;
  if ((MGIsDeviceOfType(0, v128) & 1) != 0)
    return 132;
  v228 = 152704997;
  *(_OWORD *)buf = xmmword_1002EEBCC;
  if ((MGIsDeviceOfType(buf, v129) & 1) != 0)
    return 133;
  v228 = -338255497;
  *(_OWORD *)buf = xmmword_1002EEBE0;
  if ((MGIsDeviceOfType(buf, v130) & 1) != 0)
    return 134;
  v228 = -1040127899;
  *(_OWORD *)buf = xmmword_1002EEBF4;
  if ((MGIsDeviceOfType(buf, v131) & 1) != 0)
    return 135;
  v228 = 283967174;
  *(_OWORD *)buf = xmmword_1002EEC08;
  if ((MGIsDeviceOfType(buf, v132) & 1) != 0)
    return 136;
  v228 = 1530707451;
  *(_OWORD *)buf = xmmword_1002EEC1C;
  if ((MGIsDeviceOfType(buf, v133) & 1) != 0)
    return 137;
  v228 = -871113647;
  *(_OWORD *)buf = xmmword_1002EEC30;
  if ((MGIsDeviceOfType(buf, v134) & 1) != 0)
    return 138;
  v228 = 483476120;
  *(_OWORD *)buf = xmmword_1002EEC44;
  if ((MGIsDeviceOfType(buf, v135) & 1) != 0)
    return 139;
  v228 = 1472775220;
  *(_OWORD *)buf = xmmword_1002EEC58;
  if ((MGIsDeviceOfType(buf, v136) & 1) != 0)
    return 140;
  v228 = 56502976;
  *(_OWORD *)buf = xmmword_1002EEC6C;
  if ((MGIsDeviceOfType(buf, v137) & 1) != 0)
    return 141;
  v228 = 282158961;
  *(_OWORD *)buf = xmmword_1002EEC80;
  if ((MGIsDeviceOfType(buf, v138) & 1) != 0)
    return 142;
  v228 = 1282132887;
  *(_OWORD *)buf = xmmword_1002EEC94;
  if ((MGIsDeviceOfType(buf, v139) & 1) != 0)
    return 143;
  v228 = -961843768;
  *(_OWORD *)buf = xmmword_1002EECA8;
  if ((MGIsDeviceOfType(buf, v140) & 1) != 0)
    return 144;
  v228 = 1326690998;
  *(_OWORD *)buf = xmmword_1002EECBC;
  if ((MGIsDeviceOfType(buf, v141) & 1) != 0)
    return 145;
  v228 = -441172408;
  *(_OWORD *)buf = xmmword_1002EECD0;
  if ((MGIsDeviceOfType(buf, v142) & 1) != 0)
    return 146;
  v228 = -126099363;
  *(_OWORD *)buf = xmmword_1002EECE4;
  if ((MGIsDeviceOfType(buf, v143) & 1) != 0)
    return 147;
  v228 = 1756484512;
  *(_OWORD *)buf = xmmword_1002EECF8;
  if ((MGIsDeviceOfType(buf, v144) & 1) != 0)
    return 148;
  v228 = 763775061;
  *(_OWORD *)buf = xmmword_1002EED0C;
  if ((MGIsDeviceOfType(buf, v145) & 1) != 0)
    return 149;
  v228 = -1092155788;
  *(_OWORD *)buf = xmmword_1002EED20;
  if ((MGIsDeviceOfType(buf, v146) & 1) != 0)
    return 150;
  v228 = -557458837;
  *(_OWORD *)buf = xmmword_1002EED34;
  if ((MGIsDeviceOfType(buf, v147) & 1) != 0)
    return 151;
  v228 = -63049871;
  *(_OWORD *)buf = xmmword_1002EED48;
  if ((MGIsDeviceOfType(buf, v148) & 1) != 0)
    return 152;
  v228 = 1730000236;
  *(_OWORD *)buf = xmmword_1002EED5C;
  if ((MGIsDeviceOfType(buf, v149) & 1) != 0)
    return 153;
  v228 = 406601745;
  *(_OWORD *)buf = xmmword_1002EED70;
  if ((MGIsDeviceOfType(buf, v150) & 1) != 0)
    return 154;
  v228 = 1530338216;
  *(_OWORD *)buf = xmmword_1002EED84;
  if ((MGIsDeviceOfType(buf, v151) & 1) != 0)
    return 155;
  v228 = -1930811061;
  *(_OWORD *)buf = xmmword_1002EED98;
  if ((MGIsDeviceOfType(buf, v152) & 1) != 0)
    return 156;
  v228 = 1654218604;
  *(_OWORD *)buf = xmmword_1002EEDAC;
  if ((MGIsDeviceOfType(buf, v153) & 1) != 0)
    return 157;
  v228 = -182498503;
  *(_OWORD *)buf = xmmword_1002EEDC0;
  if ((MGIsDeviceOfType(buf, v154) & 1) != 0)
    return 158;
  v228 = -2030489149;
  *(_OWORD *)buf = xmmword_1002EEDD4;
  if ((MGIsDeviceOfType(buf, v155) & 1) != 0)
    return 159;
  v228 = 841005628;
  *(_OWORD *)buf = xmmword_1002EEDE8;
  if ((MGIsDeviceOfType(buf, v156) & 1) != 0)
    return 160;
  v228 = 223445260;
  *(_OWORD *)buf = xmmword_1002EEDFC;
  if ((MGIsDeviceOfType(buf, v157) & 1) != 0)
    return 161;
  v228 = 1219348060;
  *(_OWORD *)buf = xmmword_1002EEE10;
  if ((MGIsDeviceOfType(buf, v158) & 1) != 0)
    return 162;
  v228 = 2030516999;
  *(_OWORD *)buf = xmmword_1002EEE24;
  v225 = xmmword_1002EEE38;
  v226 = -1276010597;
  if ((MGIsDeviceOneOfType(buf) & 1) != 0)
    return 163;
  v228 = -762483149;
  *(_OWORD *)buf = xmmword_1002EEE4C;
  v225 = xmmword_1002EEE60;
  v226 = -1926937532;
  if ((MGIsDeviceOneOfType(buf) & 1) != 0)
    return 164;
  v228 = -1902732724;
  *(_OWORD *)buf = xmmword_1002EEE74;
  v225 = xmmword_1002EEE88;
  v226 = -342357580;
  if ((MGIsDeviceOneOfType(buf) & 1) != 0)
    return 165;
  v228 = 300442574;
  *(_OWORD *)buf = xmmword_1002EEE9C;
  v225 = xmmword_1002EEEB0;
  v226 = -1294188889;
  if ((MGIsDeviceOneOfType(buf) & 1) != 0)
    return 166;
  if ((MGIsDeviceOfType(0, v159) & 1) != 0)
    return 167;
  v228 = -61007701;
  *(_OWORD *)buf = xmmword_1002EEEC4;
  if ((MGIsDeviceOfType(buf, v160) & 1) != 0)
    return 168;
  if ((MGIsDeviceOfType(0, v161) & 1) != 0)
    return 169;
  v228 = -235416490;
  *(_OWORD *)buf = xmmword_1002EEED8;
  if ((MGIsDeviceOfType(buf, v162) & 1) != 0)
    return 170;
  v228 = -820493242;
  *(_OWORD *)buf = xmmword_1002EEEEC;
  if ((MGIsDeviceOfType(buf, v163) & 1) != 0)
    return 172;
  v228 = -1157300313;
  *(_OWORD *)buf = xmmword_1002EEF00;
  if ((MGIsDeviceOfType(buf, v164) & 1) != 0)
    return 173;
  v228 = -2132668294;
  *(_OWORD *)buf = xmmword_1002EEF14;
  if ((MGIsDeviceOfType(buf, v165) & 1) != 0)
    return 174;
  if ((MGIsDeviceOfType(0, v166) & 1) != 0)
    return 175;
  if ((MGIsDeviceOfType(0, v167) & 1) != 0)
    return 176;
  if ((MGIsDeviceOfType(0, v168) & 1) != 0)
    return 178;
  if ((MGIsDeviceOfType(0, v169) & 1) != 0)
    return 179;
  v228 = 1737149739;
  *(_OWORD *)buf = xmmword_1002EEF28;
  if ((MGIsDeviceOfType(buf, v170) & 1) != 0)
    return 180;
  v228 = 1577888303;
  *(_OWORD *)buf = xmmword_1002EEF3C;
  if ((MGIsDeviceOfType(buf, v171) & 1) != 0)
    return 181;
  v228 = -1918230744;
  *(_OWORD *)buf = xmmword_1002EEF50;
  if ((MGIsDeviceOfType(buf, v172) & 1) != 0)
    return 182;
  v228 = 1126727276;
  *(_OWORD *)buf = xmmword_1002EEF64;
  if ((MGIsDeviceOfType(buf, v173) & 1) != 0)
    return 183;
  v228 = 300130091;
  *(_OWORD *)buf = xmmword_1002EEF78;
  if ((MGIsDeviceOfType(buf, v174) & 1) != 0)
    return 184;
  v228 = 343814884;
  *(_OWORD *)buf = xmmword_1002EEF8C;
  if ((MGIsDeviceOfType(buf, v175) & 1) != 0)
    return 185;
  v228 = -1675932945;
  *(_OWORD *)buf = xmmword_1002EEFA0;
  if ((MGIsDeviceOfType(buf, v176) & 1) != 0)
    return 186;
  if ((MGIsDeviceOfType(0, v177) & 1) != 0)
    return 188;
  if ((MGIsDeviceOfType(0, v178) & 1) != 0)
    return 189;
  if ((MGIsDeviceOfType(0, v179) & 1) != 0)
    return 191;
  v228 = -1840391155;
  *(_OWORD *)buf = xmmword_1002EEFB4;
  if ((MGIsDeviceOfType(buf, v180) & 1) != 0)
    return 192;
  v228 = -121925081;
  *(_OWORD *)buf = xmmword_1002EEFC8;
  if ((MGIsDeviceOfType(buf, v181) & 1) != 0)
    return 171;
  v228 = 1071957977;
  *(_OWORD *)buf = xmmword_1002EEFDC;
  if ((MGIsDeviceOfType(buf, v182) & 1) != 0)
    return 193;
  v228 = 438437663;
  *(_OWORD *)buf = xmmword_1002EEFF0;
  if ((MGIsDeviceOfType(buf, v183) & 1) != 0)
    return 194;
  v228 = 1575123478;
  *(_OWORD *)buf = xmmword_1002EF004;
  if ((MGIsDeviceOfType(buf, v184) & 1) != 0)
    return 195;
  v228 = -382792827;
  *(_OWORD *)buf = xmmword_1002EF018;
  if ((MGIsDeviceOfType(buf, v185) & 1) != 0)
    return 196;
  v228 = 123138233;
  *(_OWORD *)buf = xmmword_1002EF02C;
  if ((MGIsDeviceOfType(buf, v186) & 1) != 0)
    return 197;
  v228 = 681511593;
  *(_OWORD *)buf = xmmword_1002EF040;
  if ((MGIsDeviceOfType(buf, v187) & 1) != 0)
    return 198;
  if ((MGIsDeviceOfType(0, v188) & 1) != 0)
    return 199;
  v228 = 713503427;
  *(_OWORD *)buf = xmmword_1002EF054;
  if ((MGIsDeviceOfType(buf, v189) & 1) != 0)
    return 200;
  v228 = -1632750650;
  *(_OWORD *)buf = xmmword_1002EF068;
  if ((MGIsDeviceOfType(buf, v190) & 1) != 0)
    return 201;
  v228 = -1820426635;
  *(_OWORD *)buf = xmmword_1002EF07C;
  if ((MGIsDeviceOfType(buf, v191) & 1) != 0)
    return 202;
  v228 = -937652876;
  *(_OWORD *)buf = xmmword_1002EF090;
  if ((MGIsDeviceOfType(buf, v192) & 1) != 0)
    return 203;
  v228 = 1874287171;
  *(_OWORD *)buf = xmmword_1002EF0A4;
  if ((MGIsDeviceOfType(buf, v193) & 1) != 0)
    return 89;
  v228 = -781324731;
  *(_OWORD *)buf = xmmword_1002EF0B8;
  if ((MGIsDeviceOfType(buf, v194) & 1) != 0)
    return 90;
  v228 = 1214880059;
  *(_OWORD *)buf = xmmword_1002EF0CC;
  if ((MGIsDeviceOfType(buf, v195) & 1) != 0)
    return 93;
  v228 = 426359977;
  *(_OWORD *)buf = xmmword_1002EF0E0;
  if ((MGIsDeviceOfType(buf, v196) & 1) != 0)
    return 94;
  if ((MGIsDeviceOfType(0, v197) & 1) != 0)
    return 190;
  if ((MGIsDeviceOfType(0, v198) & 1) != 0)
    return 204;
  v228 = 345196535;
  *(_OWORD *)buf = xmmword_1002EF0F4;
  if ((MGIsDeviceOfType(buf, v199) & 1) != 0)
    return 205;
  v228 = 440949464;
  *(_OWORD *)buf = xmmword_1002EF108;
  if ((MGIsDeviceOfType(buf, v200) & 1) != 0)
    return 206;
  v228 = 688565114;
  *(_OWORD *)buf = xmmword_1002EF11C;
  if ((MGIsDeviceOfType(buf, v201) & 1) != 0)
    return 207;
  v228 = -493418906;
  *(_OWORD *)buf = xmmword_1002EF130;
  if ((MGIsDeviceOfType(buf, v202) & 1) != 0)
    return 208;
  if ((MGIsDeviceOfType(0, v203) & 1) != 0)
    return 209;
  v228 = -584398440;
  *(_OWORD *)buf = xmmword_1002EF144;
  if ((MGIsDeviceOfType(buf, v204) & 1) != 0)
    return 214;
  v228 = -879476163;
  *(_OWORD *)buf = xmmword_1002EF158;
  if ((MGIsDeviceOfType(buf, v205) & 1) != 0)
    return 215;
  v228 = -695298128;
  *(_OWORD *)buf = xmmword_1002EF16C;
  v225 = xmmword_1002EF180;
  v226 = 804488105;
  if ((MGIsDeviceOneOfType(buf) & 1) != 0)
    return 216;
  v228 = 1614584579;
  *(_OWORD *)buf = xmmword_1002EF194;
  v225 = xmmword_1002EF1A8;
  v226 = 324288768;
  if ((MGIsDeviceOneOfType(buf) & 1) != 0)
    return 217;
  v228 = 460218192;
  *(_OWORD *)buf = xmmword_1002EF1BC;
  v225 = xmmword_1002EF1D0;
  v226 = 2144905009;
  if ((MGIsDeviceOneOfType(buf) & 1) != 0)
    return 218;
  v228 = 127894440;
  *(_OWORD *)buf = xmmword_1002EF1E4;
  v225 = xmmword_1002EF1F8;
  v226 = 1070997468;
  if ((MGIsDeviceOneOfType(buf) & 1) != 0)
    return 219;
  v228 = 372777383;
  *(_OWORD *)buf = xmmword_1002EF20C;
  if ((MGIsDeviceOfType(buf, v206) & 1) != 0)
    return 220;
  v228 = -858079590;
  *(_OWORD *)buf = xmmword_1002EF220;
  if ((MGIsDeviceOfType(buf, v207) & 1) != 0)
    return 221;
  v228 = -212523443;
  *(_OWORD *)buf = xmmword_1002EF234;
  if ((MGIsDeviceOfType(buf, v208) & 1) != 0)
    return 222;
  v228 = 646100384;
  *(_OWORD *)buf = xmmword_1002EF248;
  if ((MGIsDeviceOfType(buf, v209) & 1) != 0)
    return 223;
  v228 = -340360463;
  *(_OWORD *)buf = xmmword_1002EF25C;
  if ((MGIsDeviceOfType(buf, v210) & 1) != 0)
    return 224;
  v228 = 1605231531;
  *(_OWORD *)buf = xmmword_1002EF270;
  if ((MGIsDeviceOfType(buf, v211) & 1) != 0)
    return 225;
  v228 = -545612308;
  *(_OWORD *)buf = xmmword_1002EF284;
  if ((MGIsDeviceOfType(buf, v212) & 1) != 0)
    return 226;
  v228 = 1178062702;
  *(_OWORD *)buf = xmmword_1002EF298;
  if ((MGIsDeviceOfType(buf, v213) & 1) != 0)
    return 227;
  v228 = -1431778695;
  *(_OWORD *)buf = xmmword_1002EF2AC;
  if ((MGIsDeviceOfType(buf, v214) & 1) != 0)
    return 228;
  v228 = 533419158;
  *(_OWORD *)buf = xmmword_1002EF2C0;
  if ((MGIsDeviceOfType(buf, v215) & 1) != 0)
    return 229;
  v228 = 1106979518;
  *(_OWORD *)buf = xmmword_1002EF2D4;
  if ((MGIsDeviceOfType(buf, v216) & 1) != 0)
    return 230;
  v228 = 1878025452;
  *(_OWORD *)buf = xmmword_1002EF2E8;
  if ((MGIsDeviceOfType(buf, v217) & 1) != 0)
    return 231;
  v228 = 1725957070;
  *(_OWORD *)buf = xmmword_1002EF2FC;
  if ((MGIsDeviceOfType(buf, v218) & 1) != 0)
    return 232;
  v228 = 538967431;
  *(_OWORD *)buf = xmmword_1002EF310;
  if ((MGIsDeviceOfType(buf, v219) & 1) != 0)
    return 233;
  v228 = 2060712151;
  *(_OWORD *)buf = xmmword_1002EF324;
  if ((MGIsDeviceOfType(buf, v220) & 1) != 0)
    return 234;
  if ((MGIsDeviceOfType(0, v221) & 1) != 0)
    return 171;
  v228 = -1819593402;
  *(_OWORD *)buf = xmmword_1002EF338;
  v225 = xmmword_1002EF34C;
  v226 = 1102685587;
  if ((MGIsDeviceOneOfType(buf) & 1) != 0)
    return 1;
  result = MGCopyAnswer(CFSTR("HWModelStr"), 0);
  if (result)
  {
    v222 = (const void *)result;
    v223 = sub_1002C7B64();
    v224 = objc_claimAutoreleasedReturnValue(v223);
    if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v222;
      _os_log_impl((void *)&_mh_execute_header, v224, OS_LOG_TYPE_ERROR, "unknown HW model %{private}@", buf, 0xCu);
    }

    CFRelease(v222);
    return 0;
  }
  return result;
}

- (id)getSerialNumber
{
  if (qword_100389480 != -1)
    dispatch_once(&qword_100389480, &stru_100365838);
  return (id)qword_100389478;
}

- (unint64_t)hardware
{
  return self->_hardware;
}

- (NSDictionary)hardwareMap
{
  return self->_hardwareMap;
}

- (BOOL)isSimulated
{
  return self->_isSimulated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareMap, 0);
}

@end
