@implementation SCMLImageLabelCoder

+ (id)_nameFromRevParts:(id)a3
{
  id v3;
  void *v4;
  int v5;
  unint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  if (v5 >= 1)
  {
    v6 = v5 + 1;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", (v6 - 2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v7);

      --v6;
    }
    while (v6 > 1);
  }

  return v4;
}

+ (id)_createHexEncodingDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[6];
  _QWORD v49[6];
  _QWORD v50[4];
  _QWORD v51[6];
  _QWORD v52[6];
  _QWORD v53[2];
  _QWORD v54[3];
  _QWORD v55[4];
  _QWORD v56[4];
  _QWORD v57[2];
  _QWORD v58[4];
  _QWORD v59[4];
  _QWORD v60[2];
  _QWORD v61[4];
  _QWORD v62[2];
  _QWORD v63[4];
  _QWORD v64[16];
  _QWORD v65[16];
  _QWORD v66[5];

  v66[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_nameFromRevParts:", &unk_2516EB6A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", &unk_2516EB6B8);
  v66[0] = objc_claimAutoreleasedReturnValue();
  v66[1] = CFSTR("e");
  v66[2] = CFSTR("f");
  v46 = (void *)v66[0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", v4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_nameFromRevParts:", &unk_2516EB6D0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", &unk_2516EB6E8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", &unk_2516EB700);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", &unk_2516EB718);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", &unk_2516EB730);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", &unk_2516EB748);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", &unk_2516EB760);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = CFSTR("y");
  v63[1] = CFSTR("n");
  v63[2] = CFSTR("a");
  v63[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v37;
  v65[0] = CFSTR("d61a476a2e70af249c2b1695097eeea9");
  v62[0] = v40;
  v62[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v35;
  v65[1] = CFSTR("3dfb9038b547f6bca709fe8c7c85dd12");
  v61[0] = v42;
  v61[1] = CFSTR("_");
  v61[2] = v40;
  v61[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v33;
  v65[2] = CFSTR("39ba1360248e1ef3851974a22f0d3f28");
  v60[0] = v42;
  v60[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v31;
  v65[3] = CFSTR("60dc96fd80c33771139d6cf90639a776");
  v59[0] = v44;
  v59[1] = CFSTR("_");
  v59[2] = v45;
  v59[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v29;
  v65[4] = CFSTR("d9ad80f7b43abb16a607e4361c87bca3");
  v58[0] = v46;
  v58[1] = CFSTR("_");
  v58[2] = v45;
  v58[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v27;
  v65[5] = CFSTR("e156d20cabbf6d6cbca2f1f437738097");
  v57[0] = v41;
  v57[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v25;
  v65[6] = CFSTR("64c53be656ce81ef8aad95a16847f9ce");
  v56[0] = v44;
  v56[1] = CFSTR("_");
  v56[2] = v43;
  v56[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v23;
  v65[7] = CFSTR("c9cc54544693ed5ad6386336207971dd");
  v55[0] = v46;
  v55[1] = CFSTR("_");
  v55[2] = v43;
  v55[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v21;
  v65[8] = CFSTR("85a5e1ae11b0353df314fe3763da2c56");
  v54[0] = CFSTR("ne");
  v54[1] = CFSTR("no");
  v54[2] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v19;
  v65[9] = CFSTR("58484718d77c0af68837b49bde584d48");
  v53[0] = v39;
  v53[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v17;
  v65[10] = CFSTR("63f9d5d4ca6958521ae9de3dcaa6fef6");
  v52[0] = v44;
  v52[1] = CFSTR("_");
  v52[2] = v45;
  v52[3] = CFSTR("_");
  v52[4] = v47;
  v52[5] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64[11] = v15;
  v65[11] = CFSTR("662d129f7fdcfcc2bc753dabe3e1780e");
  v51[0] = v46;
  v51[1] = CFSTR("_");
  v51[2] = v45;
  v51[3] = CFSTR("_");
  v51[4] = v47;
  v51[5] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v64[12] = v6;
  v65[12] = CFSTR("a3d79da61dcf2cb021df38b627c46289");
  v50[0] = v41;
  v50[1] = CFSTR("_");
  v50[2] = v47;
  v50[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64[13] = v8;
  v65[13] = CFSTR("7912fcde30eb40530c85a32a9b9a08ba");
  v49[0] = v44;
  v49[1] = CFSTR("_");
  v49[2] = v43;
  v49[3] = CFSTR("_");
  v49[4] = v47;
  v49[5] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64[14] = v10;
  v65[14] = CFSTR("0766812f995688dd349887ffa981ccc3");
  v48[0] = v46;
  v48[1] = CFSTR("_");
  v48[2] = v43;
  v48[3] = CFSTR("_");
  v48[4] = v47;
  v48[5] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_nameFromRevParts:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64[15] = v12;
  v65[15] = CFSTR("e123c2b2c0d21152b6956aa6de88a159");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 16);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_createHexDecodingDict
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_createHexEncodingDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v8, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v3;
}

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SCMLImageLabelCoder_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SCMLImageLabelCoder instance]::onceToken != -1)
    dispatch_once(&+[SCMLImageLabelCoder instance]::onceToken, block);
  return (id)+[SCMLImageLabelCoder instance]::sharedCoder;
}

void __31__SCMLImageLabelCoder_instance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[SCMLImageLabelCoder instance]::sharedCoder;
  +[SCMLImageLabelCoder instance]::sharedCoder = (uint64_t)v1;

}

- (SCMLImageLabelCoder)init
{
  SCMLImageLabelCoder *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCMLImageLabelCoder;
  v2 = -[SCMLImageLabelCoder init](&v6, sel_init);
  if (v2)
  {
    +[SCMLImageLabelCoder _createHexEncodingDict](SCMLImageLabelCoder, "_createHexEncodingDict");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCMLImageLabelCoder set_encodeToHexDict:](v2, "set_encodeToHexDict:", v3);

    +[SCMLImageLabelCoder _createHexDecodingDict](SCMLImageLabelCoder, "_createHexDecodingDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCMLImageLabelCoder set_decodeFromHexDict:](v2, "set_decodeFromHexDict:", v4);

  }
  return v2;
}

- (id)encodeToHex:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SCMLImageLabelCoder _encodeToHexDict](self, "_encodeToHexDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)decodeFromHex:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SCMLImageLabelCoder _decodeFromHexDict](self, "_decodeFromHexDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)encodeToP1:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  void **v5;
  int v6;
  char v7;
  void *v8;
  void *__p[2];
  unsigned __int8 v11;

  v3 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v3, "UTF8String"));
  v4 = 0;
  while (((char)v11 & 0x80000000) == 0)
  {
    v5 = __p;
    if ((unint64_t)v4 >= v11)
      goto LABEL_12;
LABEL_6:
    v6 = v4[(_QWORD)v5];
    if ((v6 - 97) <= 0x19)
    {
      if (v6 == 122)
        v7 = 97;
      else
        v7 = v6 + 1;
      v4[(_QWORD)v5] = v7;
    }
    ++v4;
  }
  v5 = (void **)__p[0];
  if (__p[1] > v4)
    goto LABEL_6;
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((char)v11 < 0)
    operator delete(__p[0]);

  return v8;
}

- (id)decodeFromP1:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  void **v5;
  int v6;
  char v7;
  void *v8;
  void *__p[2];
  unsigned __int8 v11;

  v3 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v3, "UTF8String"));
  v4 = 0;
  while (((char)v11 & 0x80000000) == 0)
  {
    v5 = __p;
    if ((unint64_t)v4 >= v11)
      goto LABEL_12;
LABEL_6:
    v6 = v4[(_QWORD)v5];
    if ((v6 - 97) <= 0x19)
    {
      if (v6 == 97)
        v7 = 122;
      else
        v7 = v6 - 1;
      v4[(_QWORD)v5] = v7;
    }
    ++v4;
  }
  v5 = (void **)__p[0];
  if (__p[1] > v4)
    goto LABEL_6;
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((char)v11 < 0)
    operator delete(__p[0]);

  return v8;
}

- (NSDictionary)_encodeToHexDict
{
  return self->__encodeToHexDict;
}

- (void)set_encodeToHexDict:(id)a3
{
  objc_storeStrong((id *)&self->__encodeToHexDict, a3);
}

- (NSDictionary)_decodeFromHexDict
{
  return self->__decodeFromHexDict;
}

- (void)set_decodeFromHexDict:(id)a3
{
  objc_storeStrong((id *)&self->__decodeFromHexDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__decodeFromHexDict, 0);
  objc_storeStrong((id *)&self->__encodeToHexDict, 0);
}

@end
