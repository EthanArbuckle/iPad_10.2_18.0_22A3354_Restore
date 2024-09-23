@implementation WBListDefinitionTable

+ (void)readFrom:(id)a3 listDefinitionTable:(id)a4
{
  id v5;
  WrdObject *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  id v21;

  v21 = a3;
  v5 = a4;
  v6 = +[WBObjectFactory create:](WBObjectFactory, "create:", 34);
  if (v6)
  else
    v7 = 0;
  v8 = objc_msgSend(v21, "wrdReader");
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v8 + 280))(v8, v7);
  v20 = v7 + 1;
  v9 = v7[2] - v7[1];
  if ((int)(v9 >> 3) >= 1)
  {
    v10 = 0;
    v11 = (v9 >> 3);
    do
    {
      v12 = v7[1];
      if (v10 >= ((unint64_t)(v7[2] - v12) >> 3))
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      v13 = *(_QWORD *)(v12 + 8 * v10);
      v14 = *(unsigned int *)(v13 + 40);
      v15 = *(__int16 *)(v13 + 48);
      if ((_DWORD)v15 == 12)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v21, "styleAtIndex:expectedType:", v15, 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "id");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v5, "addDefinitionWithDefinitionId:styleId:", v14, v16, v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "targetDocument");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBListDefinition readFrom:listDefinition:listFormat:document:](WBListDefinition, "readFrom:listDefinition:listFormat:document:", v21, v18, v13, v19);

      ++v10;
    }
    while (v11 != v10);
  }
  (*(void (**)(_QWORD *))(*v7 + 8))(v7);

}

@end
