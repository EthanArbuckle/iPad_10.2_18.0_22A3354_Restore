@implementation TITraceLogRecordParser

+ (void)parseRecord:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  const __CFString *v42;
  objc_class *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  char v58[8];
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70[2];

  v3 = a3;
  if (!objc_msgSend(v3, "parsingStatus"))
  {
    v4 = v3;
    objc_msgSend(v4, "logText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("Typed String:")) & 1) == 0)
    {

      v16 = 1;
LABEL_18:
      objc_msgSend(v4, "setParsingStatus:", v16);
      goto LABEL_19;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v5);
    v62 = 0;
    objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("\n"), &v62);
    v7 = v62;
    v70[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("Typed String: \"(.+)\"  Lookup Type: (.+)"), 0, v70);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v70[0];
    v57 = v7;
    objc_msgSend(v8, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v54 = v6;
    if (v11)
    {
      v13 = 1;
      if (objc_msgSend(v11, "numberOfRanges") == 2)
      {
        v14 = 0;
        v55 = 0;
        v56 = 0;
        v15 = 0;
      }
      else
      {
        v17 = objc_msgSend(v12, "rangeAtIndex:", 1);
        objc_msgSend(v57, "substringWithRange:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v12, "rangeAtIndex:", 2);
        objc_msgSend(v57, "substringWithRange:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v63[0]) = 1;
        v56 = v19;
        v63[1] = v56;
        v55 = v22;
        v63[2] = v55;
        v63[3] = 0;
        v15 = _recordTypeForEventRecordHeader((uint64_t)v63);
        v13 = 0;
        v14 = 1;
      }
    }
    else
    {
      v14 = 0;
      v55 = 0;
      v56 = 0;
      v15 = 0;
      v13 = 1;
    }

    v23 = v57;
    if ((v13 & 1) != 0)
    {
      v16 = 1;
      v24 = v54;
      v25 = v55;
    }
    else
    {
      objc_msgSend(v4, "setTypedString:", v56);
      v58[0] = v14;
      v59 = v56;
      v25 = v55;
      v60 = v55;
      v61 = v15;
      v26 = _recordTypeForEventRecordHeader((uint64_t)v58);
      if (v26 == 3)
      {
        v43 = (objc_class *)MEMORY[0x1E0CB3900];
        v44 = v4;
        v45 = v5;
        v46 = (void *)objc_msgSend([v43 alloc], "initWithString:", v45);

        objc_msgSend(v46, "scanUpToString:intoString:", CFSTR("["), 0);
        v63[0] = 0;
        objc_msgSend(v46, "scanUpToString:intoString:", CFSTR("\n\n"), v63);
        v47 = v63[0];
        _parseRawCandidateGroupsFromString(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setRawPredictionCandidates:", v48);
        objc_msgSend(v46, "scanUpToString:intoString:", CFSTR("\n["), 0);
        v70[0] = v47;
        objc_msgSend(v46, "scanUpToString:intoString:", CFSTR("==============================\n"), v70);
        v49 = v70[0];

        _parseFinalCandidatesGroupFromString(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "setFinalPredictionCandidates:", v50);
        v42 = CFSTR("predictions");
        objc_msgSend(v44, "addParsedSection:", CFSTR("predictions"));

        v25 = v55;
      }
      else
      {
        if (v26 != 1)
        {
          v16 = 1;
          v24 = v54;
          goto LABEL_17;
        }
        v27 = (objc_class *)MEMORY[0x1E0CB3900];
        v28 = v4;
        v29 = v5;
        v30 = (void *)objc_msgSend([v27 alloc], "initWithString:", v29);

        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("["), 0);
        v63[0] = 0;
        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("\n\n"), v63);
        v31 = v63[0];
        _parseRawCandidateGroupsFromString(v31);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setRawCompletionCandidates:", v51);
        v70[0] = v31;
        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("\n\n"), v70);
        v32 = v70[0];

        _parseRemovedCandidatesGroupFromString(v32);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setRemovedCompletionCandidates:", v52);
        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("\n["), 0);
        v69 = v32;
        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("==============================\n"), &v69);
        v33 = v69;

        _parseFinalCandidatesGroupFromString(v33);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setFinalCompletionCandidates:", v53);
        objc_msgSend(v28, "addParsedSection:", CFSTR("completions"));
        v68 = v33;
        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("\n"), &v68);
        v34 = v68;

        v67 = v34;
        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("\n"), &v67);
        v35 = v67;

        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("\n["), 0);
        v66 = v35;
        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("\n\n"), &v66);
        v36 = v66;

        _parseRawCandidateGroupsFromString(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "setRawAutocorrectionCandidates:", v37);
        v65 = v36;
        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("\n\n"), &v65);
        v38 = v65;

        _parseRemovedCandidatesGroupFromString(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "setRemovedAutocorrectionCandidates:", v39);
        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("\n["), 0);
        v64 = v38;
        objc_msgSend(v30, "scanUpToString:intoString:", CFSTR("==============================\n"), &v64);
        v40 = v64;

        _parseFinalCandidatesGroupFromString(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "setFinalAutocorrectionCandidates:", v41);
        objc_msgSend(v28, "addParsedSection:", CFSTR("autocorrection"));

        v42 = CFSTR("autocorrections");
      }
      objc_msgSend(v4, "setRecordType:", v42);
      v16 = 2;
      v24 = v54;
      v23 = v57;
    }
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:

}

@end
