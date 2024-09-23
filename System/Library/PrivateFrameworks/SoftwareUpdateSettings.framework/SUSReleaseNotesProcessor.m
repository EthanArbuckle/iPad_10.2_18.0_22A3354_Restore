@implementation SUSReleaseNotesProcessor

+ (id)sharedInstance
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedInstance_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_1);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance_sharedInstance;
}

void __42__SUSReleaseNotesProcessor_sharedInstance__block_invoke()
{
  SUSReleaseNotesProcessor *v0;
  void *v1;

  v0 = objc_alloc_init(SUSReleaseNotesProcessor);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (id)normalizeHtmlReleaseNotes:(id)a3
{
  id v4;
  id location[2];
  SUSReleaseNotesProcessor *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[SUSReleaseNotesProcessor normalizeHtmlReleaseNotes:withAdditionalCSS:](v6, "normalizeHtmlReleaseNotes:withAdditionalCSS:", location[0], CFSTR(":root {   color-scheme: light dark;}p {   -webkit-text-size-adjust: 100% !important;   font-family: -apple-system, system-ui, HelveticaNeue, LucidaGrande !important;   color: -apple-system-label !important;}"));
  objc_storeStrong(location, 0);
  return v4;
}

- (id)normalizeHtmlReleaseNotes:(id)a3 withAdditionalCSS:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  int v23;
  id v24[3];
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28[3];
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
  id v39;
  id v40;
  id v41;
  id location[3];
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = 0;
  objc_storeStrong(&v41, a4);
  v40 = (id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("<style[^>]*>"), 1, 0);
  v18 = location[0];
  v4 = objc_msgSend(location[0], "length");
  v61 = 0;
  v60 = v4;
  v62 = 0;
  v63 = v4;
  v37 = 0;
  v38 = v4;
  v39 = (id)objc_msgSend(v40, "firstMatchInString:options:range:", v18, 0, 0, v4);
  if (v39)
  {
    v33 = objc_msgSend(v39, "range");
    v34 = v5;
    v31 = objc_msgSend(v39, "range");
    v32 = v6;
    v16 = v33 + v6;
    v15 = objc_msgSend(location[0], "length");
    v29 = objc_msgSend(v39, "range");
    v30 = v7;
    v28[1] = (id)objc_msgSend(v39, "range");
    v28[2] = v8;
    v57 = v16;
    v56 = v15 - v29 - (_QWORD)v8;
    v58 = v16;
    v59 = v56;
    v35 = v16;
    v36 = v56;
    v28[0] = (id)objc_msgSend(location[0], "substringWithRange:", v16, v56);
    v27 = (id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\/\\*\\s*apple-ota-disable-default-css\\s*\\*\\/"), 1, 0);
    v9 = (void *)objc_msgSend(v28[0], "length");
    v53 = 0;
    v52 = v9;
    v54 = 0;
    v55 = v9;
    v24[1] = 0;
    v24[2] = v9;
    v25 = objc_msgSend(v27, "rangeOfFirstMatchInString:options:range:", v28[0], 0, 0, v9);
    v26 = v10;
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v24[0] = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v41, v28[0]);
      v43 = (id)objc_msgSend(location[0], "stringByReplacingCharactersInRange:withString:", v35, v36, v24[0]);
      v23 = 1;
      objc_storeStrong(v24, 0);
    }
    else
    {
      v43 = location[0];
      v23 = 1;
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(v28, 0);
  }
  else
  {
    v22 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<style>%@</style>"), v41);
    v21 = (id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("<html[^>]*>"), 1, 0);
    v14 = location[0];
    v11 = objc_msgSend(location[0], "length");
    v49 = 0;
    v48 = v11;
    v50 = 0;
    v51 = v11;
    v20 = (id)objc_msgSend(v21, "firstMatchInString:options:range:", v14, 0, 0, v11);
    if (v20)
    {
      v19 = objc_msgSend(v20, "range");
      objc_msgSend(v20, "range");
      v45 = v19 + v12;
      v44 = 0;
      v47 = 0;
      v46 = v19 + v12;
      v43 = (id)objc_msgSend(location[0], "stringByReplacingCharactersInRange:withString:", v19 + v12, 0, v22);
    }
    else
    {
      v43 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), location[0], v22);
    }
    v23 = 1;
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  return v43;
}

@end
