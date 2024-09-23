@implementation NSMutableAttributedString(MutableAttributedStringSRCSTextEditing)

- (void)adjustCapsAndSpacingUsingLeadingText:()MutableAttributedStringSRCSTextEditing localeIdentifier:vocabularyEntries:spellingGuessesBlock:
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  int v73;
  int v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  int v79;
  int v80;
  int v81;
  void *v82;
  int v83;
  int v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  id v89;
  void (**v90)(id, uint64_t, uint64_t, void *, id);
  id v91;
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  char v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v93 = a3;
  v91 = a4;
  v92 = a5;
  v90 = a6;
  if (objc_msgSend(a1, "length"))
  {
    v103 = 0;
    v104 = &v103;
    v105 = 0x2020000000;
    v106 = 0;
    if (objc_msgSend(v93, "length")
      && objc_msgSend(v93, "characterAtIndex:", objc_msgSend(v93, "length") - 1) == 46)
    {
      *((_BYTE *)v104 + 24) = 1;
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x24BDD1638]);
      v11 = *MEMORY[0x24BDD0F78];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDD0F78]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithTagSchemes:options:", v12, 0);

      if (v93)
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(a1, "string");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@"), v93, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(a1, "string");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17 = objc_msgSend(v93, "length");
      v18 = objc_msgSend(a1, "length");
      objc_msgSend(v13, "setString:", v16);
      v98[0] = MEMORY[0x24BDAC760];
      v98[1] = 3221225472;
      v98[2] = __162__NSMutableAttributedString_MutableAttributedStringSRCSTextEditing__adjustCapsAndSpacingUsingLeadingText_localeIdentifier_vocabularyEntries_spellingGuessesBlock___block_invoke;
      v98[3] = &unk_24F652B70;
      v101 = v17;
      v102 = v18;
      v100 = &v103;
      v19 = v16;
      v99 = v19;
      objc_msgSend(v13, "enumerateTagsInRange:scheme:options:usingBlock:", v17, v18, v11, 0, v98);

    }
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v20 = v92;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v95;
LABEL_11:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v95 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v23);
        objc_msgSend(a1, "string");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lowercaseString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lowercaseString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "hasPrefix:", v27);

        if (v28)
        {
          objc_msgSend(a1, "string");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "length");
          LODWORD(v30) = v30 > objc_msgSend(v24, "length");

          if (!(_DWORD)v30)
            break;
          objc_msgSend(a1, "string");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "characterAtIndex:", objc_msgSend(v24, "length"));

          objc_msgSend(MEMORY[0x24BDD1690], "whitespaceAndNewlineCharacterSet");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "formUnionWithCharacterSet:", v34);

          LODWORD(v32) = objc_msgSend(v33, "characterIsMember:", v32);
          if ((_DWORD)v32)
            break;
        }
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
          if (v21)
            goto LABEL_11;
          goto LABEL_19;
        }
      }
      objc_msgSend(MEMORY[0x24BDD1690], "lowercaseLetterCharacterSet");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addCharactersInString:", CFSTR("-' "));
      objc_msgSend(v36, "invertedSet");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v24, "rangeOfCharacterFromSet:", v37) == 0x7FFFFFFFFFFFFFFFLL;

      v89 = v24;
      if (v38)
      {
        v35 = 1;
        goto LABEL_22;
      }
      objc_msgSend(a1, "replaceCharactersInRange:withString:", 0, objc_msgSend(v89, "length"), v89);
LABEL_46:
      if (!objc_msgSend(v93, "length"))
      {
LABEL_72:

        _Block_object_dispose(&v103, 8);
        goto LABEL_73;
      }
      v70 = objc_msgSend(v93, "characterAtIndex:", objc_msgSend(v93, "length") - 1);
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v71, "characterIsMember:", v70);
      v74 = objc_msgSend(v72, "characterIsMember:", v70);
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("¡¿⸘“‘‟‛'­­­­­­­­–‑­­­-—@❛❝‹«<〈《（❨(❮{[〔【〖❪❴❲❬⎧⎡⎛⎨⎜⎢⎪⎣⎝⎩"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "string");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "characterAtIndex:", 0);

      if (!objc_msgSend(v72, "characterIsMember:", v77))
      {
        v80 = 0;
        goto LABEL_56;
      }
      if (objc_msgSend(v91, "hasPrefix:", CFSTR("fr")))
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(";:!?«»"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "characterIsMember:", v77);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("&"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v75, "characterIsMember:", v77) & 1) != 0)
        {
          v81 = 1;
LABEL_55:

          v80 = v81 ^ 1;
LABEL_56:
          if (((v73 | v80) & 1) != 0)
          {
            if (!v74)
              goto LABEL_71;
            v82 = v75;
            v83 = 0;
          }
          else
          {
            v84 = objc_msgSend(v71, "characterIsMember:", v77);
            if ((v74 & 1) == 0)
            {
              if ((v84 & 1) != 0)
                goto LABEL_71;
              goto LABEL_69;
            }
            v82 = v75;
            v83 = v84 ^ 1;
          }
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v85;
          if (!v83
            || objc_msgSend(v85, "characterIsMember:", v70)
            && ((unint64_t)objc_msgSend(v93, "length") < 2
             || (objc_msgSend(v71, "characterIsMember:", objc_msgSend(v93, "characterAtIndex:", objc_msgSend(v93, "length") - 2)) & 1) != 0))
          {
            v75 = v82;
LABEL_70:

            goto LABEL_71;
          }
          v87 = objc_msgSend(v82, "characterIsMember:", v70);

          v75 = v82;
          if ((v87 & 1) == 0)
          {
LABEL_69:
            v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
            objc_msgSend(a1, "insertAttributedString:atIndex:", v86, 0);
            goto LABEL_70;
          }
LABEL_71:

          goto LABEL_72;
        }
        v79 = objc_msgSend(v78, "characterIsMember:", v77);
      }
      v81 = v79;
      goto LABEL_55;
    }
LABEL_19:

    v35 = 0;
    v89 = 0;
LABEL_22:
    if (*((_BYTE *)v104 + 24))
      goto LABEL_46;
    objc_msgSend(a1, "string");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "substringToIndex:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "lowercaseString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "string");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "substringFromIndex:", 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByAppendingString:", v43);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v88, "rangeOfCharacterFromSet:", v44);
    v47 = v46;

    if (v45 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v45 = objc_msgSend(v88, "length");
      v48 = 0;
      goto LABEL_35;
    }
    v48 = 0;
    if (v45 == 1 && v47 == 1)
    {
      objc_msgSend(a1, "string");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "substringToIndex:", 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v50, "isEqualToString:", CFSTR(",")))
      {

      }
      else
      {
        objc_msgSend(a1, "string");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "substringToIndex:", 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "isEqualToString:", CFSTR(";"));

        if (!v53)
        {
          v48 = 0;
          v45 = 1;
          goto LABEL_35;
        }
      }
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v88, "rangeOfCharacterFromSet:options:range:", v54, 0, 2, objc_msgSend(v88, "length") - 2);

      if (v55 == 0x7FFFFFFFFFFFFFFFLL)
        v55 = objc_msgSend(v88, "length");
      objc_msgSend(a1, "string");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "substringToIndex:", 3);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "lowercaseString");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "string");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "substringFromIndex:", 3);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringByAppendingString:", v60);
      v61 = objc_claimAutoreleasedReturnValue();

      v45 = v55 - 2;
      v48 = 2;
      v88 = (void *)v61;
    }
LABEL_35:
    objc_msgSend(a1, "string");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "substringWithRange:", v48, v45);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v63, "uppercaseString");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "lowercaseString");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v65, "isEqualToString:", v64) & 1) == 0)
    {
      if (!objc_msgSend(v63, "isEqualToString:", v64))
      {

LABEL_41:
        v90[2](v90, v48, v45, v88, v91);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v65, "count") || (v35 | objc_msgSend(v65, "containsObject:", v63) ^ 1) == 1)
        {
          objc_msgSend(a1, "string");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "substringWithRange:", v48, 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "lowercaseString");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "replaceCharactersInRange:withString:", v48, 1, v69);

        }
        goto LABEL_44;
      }
      if ((unint64_t)objc_msgSend(a1, "length") >= 2)
      {
        v66 = objc_msgSend(v63, "isEqualToString:", CFSTR("A"));

        if ((v66 & 1) == 0)
          goto LABEL_45;
        goto LABEL_41;
      }
    }
LABEL_44:

LABEL_45:
    goto LABEL_46;
  }
LABEL_73:

}

@end
