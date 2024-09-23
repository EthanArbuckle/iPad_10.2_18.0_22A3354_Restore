@implementation WBOleObject

+ (void)readFrom:(id)a3 at:(int)a4 oleId:(unsigned int)a5 textRun:(WrdCharacterTextRun *)a6 paragraph:(id)a7 to:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  uint64_t ObjectPoolStorage;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a4;
  v14 = a3;
  v15 = a7;
  v16 = a8;
  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___WBOleObject;
  objc_msgSendSuper2(&v22, sel_readFrom_at_textRun_paragraph_to_, v14, v12, a6, v15, v16);
  +[TCProgressContext createStageWithSteps:takingSteps:](TCProgressContext, "createStageWithSteps:takingSteps:", 1.0, 0.0);
  ObjectPoolStorage = WrdBinaryReader::getObjectPoolStorage((WrdBinaryReader *)objc_msgSend(v14, "wrdReader"));
  if (ObjectPoolStorage)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%d"), v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancelDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABOle readFromParentStorage:storageName:cancel:](OABOle, "readFromParentStorage:storageName:cancel:", ObjectPoolStorage, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[TCProgressContext endStage](TCProgressContext, "endStage");
    objc_msgSend(v16, "drawable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setOle:", v20);

  }
  else
  {
    +[TCProgressContext endStage](TCProgressContext, "endStage");
  }

}

@end
