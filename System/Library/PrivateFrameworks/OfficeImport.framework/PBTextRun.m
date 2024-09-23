@implementation PBTextRun

+ (void)readTextRun:(id)a3 plainText:(id)a4 characterAttributes:(id)a5 state:(id)a6
{
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;

  v53 = a3;
  v54 = a4;
  v9 = a5;
  v52 = a6;
  v10 = objc_msgSend(v53, "textRunCount");
  objc_msgSend(v9, "objectForKey:", CFSTR("PptCharacterPropertyRunAttribute"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v11, "pointerValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("PptSpecialInfoRunAttribute"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v12, "pointerValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("PptClickHyperlinkRunAttribute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pointerValue");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("PptHoverHyperlinkRunAttribute"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pointerValue");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("PptMetaCharacterRunAttribute"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nonretainedObjectValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = v9;
  v47 = v16;
  if (v16)
  {
    switch(objc_msgSend(v16, "type"))
    {
      case 0u:
        v17 = (id)objc_msgSend(v53, "addFooterField");
        break;
      case 1u:
        v32 = (id)objc_msgSend(v53, "addDateTimeFieldWithFormat:", 0);
        break;
      case 2u:
        objc_msgSend(v53, "addDateTimeFieldWithFormat:", 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setFormat:", objc_msgSend(v16, "extraData") + 1);
        goto LABEL_24;
      case 4u:
        objc_msgSend(v53, "addSlideNumberField");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v52, "numberOfSlideIndexes"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setText:", v34);
        goto LABEL_23;
      default:
        break;
    }
  }
  else
  {
    if (+[PBTextRun readTextRun:plainText:characterAttributes:state:]::once != -1)
      dispatch_once(&+[PBTextRun readTextRun:plainText:characterAttributes:state:]::once, &__block_literal_global_99);
    v18 = objc_msgSend(v54, "length");
    v19 = v18;
    if (v18)
    {
      v20 = 0;
      v45 = v18;
      while (1)
      {
        v21 = objc_msgSend(v54, "rangeOfCharacterFromSet:options:range:", +[PBTextRun readTextRun:plainText:characterAttributes:state:]::specialCharSet, 2, v20, v19 - v20);
        v23 = v21;
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v24 = v22;
        if (v21 > v20)
        {
          objc_msgSend(v53, "addRegularTextRun");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "text");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "substringWithRange:", v20, v23 - v20);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setString:", v27);

          v20 = v23;
        }
        v28 = v23 + v24;
        if (v20 < v23 + v24)
        {
          do
          {
            if (objc_msgSend(v54, "characterAtIndex:", v20) == 11)
            {
              v29 = (id)objc_msgSend(v53, "addTextLineBreak");
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PBTextRun readTextRun:plainText:characterAttributes:state:]");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Binary/Mapper/PBTextRun.mm");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 101, 0, "Unhandled special character");

              +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
            }
            ++v20;
          }
          while (v28 != v20);
          v20 = v28;
        }
        v19 = v45;
        if (v20 >= v45)
          goto LABEL_25;
      }
      objc_msgSend(v53, "addRegularTextRun");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "text");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "substringFromIndex:", v20);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setString:", v35);

LABEL_23:
LABEL_24:

    }
  }
LABEL_25:
  v36 = objc_msgSend(v53, "textRunCount");
  v38 = v46;
  v37 = v47;
  if (v10 < v36)
  {
    do
    {
      objc_msgSend(v53, "textRunAtIndex:", v10);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "properties");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
        +[PBCharacterProperties readCharacterProperties:characterPropertyRun:state:](PBCharacterProperties, "readCharacterProperties:characterPropertyRun:state:", v40, v49, v52);
      if (v48)
        +[PBCharacterProperties readCharacterProperties:specialInfoRun:state:](PBCharacterProperties, "readCharacterProperties:specialInfoRun:state:", v40, v48, v52);
      if (v51)
      {
        objc_msgSend(v51, "interactiveInfoContainerHolder");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBHyperlink readAnimationInfoContainerHolder:presentationState:](PBHyperlink, "readAnimationInfoContainerHolder:presentationState:", v41, v52);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setClickHyperlink:", v42);

      }
      if (v50)
      {
        objc_msgSend(v50, "interactiveInfoContainerHolder");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBHyperlink readAnimationInfoContainerHolder:presentationState:](PBHyperlink, "readAnimationInfoContainerHolder:presentationState:", v43, v52);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setHoverHyperlink:", v44);

      }
      ++v10;
      v38 = v46;
      v37 = v47;
    }
    while (v36 != v10);
  }

}

void __61__PBTextRun_readTextRun_plainText_characterAttributes_state___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\v"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[PBTextRun readTextRun:plainText:characterAttributes:state:]::specialCharSet;
  +[PBTextRun readTextRun:plainText:characterAttributes:state:]::specialCharSet = v0;

}

@end
