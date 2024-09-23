@implementation _SCRCThreadTask

+ (id)newThreadTaskWithTarget:(id)a3 selector:(SEL)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 firstObject:(id)a7 moreObjects:(char *)a8
{
  uint64_t v9;
  uint64_t v10;
  id v13;
  id v14;
  _SCRCThreadTask *v15;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  v13 = a7;
  v14 = a3;
  v15 = -[_SCRCThreadTask initWithTarget:selector:cancelMask:count:firstObject:moreObjects:]([_SCRCThreadTask alloc], "initWithTarget:selector:cancelMask:count:firstObject:moreObjects:", v14, a4, v10, v9, v13, a8);

  return v15;
}

- (_SCRCThreadTask)initWithTarget:(id)a3 selector:(SEL)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 firstObject:(id)a7 moreObjects:(char *)a8
{
  id v15;
  id v16;
  _SCRCThreadTask *v17;
  _SCRCThreadTask *v18;
  uint64_t v19;
  NSMutableArray *objectArray;
  NSMutableArray *v21;
  void *v22;
  unsigned int v23;
  void **v24;
  void *v25;
  NSMutableArray *v26;
  void *v27;
  id v28;
  void *v29;
  objc_super v31;
  char *v32;

  v15 = a3;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)_SCRCThreadTask;
  v32 = a8;
  v17 = -[_SCRCThreadTask init](&v31, sel_init);
  v18 = v17;
  if (a6 < 9)
  {
    if (v17)
    {
      objc_storeStrong(&v17->_target, a3);
      v18->_selector = a4;
      v18->_mask = a5;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a6);
      v19 = objc_claimAutoreleasedReturnValue();
      objectArray = v18->_objectArray;
      v18->_objectArray = (NSMutableArray *)v19;

      if (a6)
      {
        v21 = v18->_objectArray;
        if (v16)
        {
          -[NSMutableArray addObject:](v18->_objectArray, "addObject:", v16);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v21, "addObject:", v22);

        }
        if (a6 >= 2)
        {
          v23 = a6 - 1;
          do
          {
            v24 = (void **)v32;
            v32 += 8;
            v25 = *v24;
            v26 = v18->_objectArray;
            if (*v24)
            {
              -[NSMutableArray addObject:](v26, "addObject:", v25);
            }
            else
            {
              v27 = (void *)MEMORY[0x24BDBCEF8];
              v28 = 0;
              objc_msgSend(v27, "null");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](v26, "addObject:", v29);

            }
            --v23;
          }
          while (v23);
        }
      }
    }
  }
  else
  {

    v18 = 0;
  }

  return v18;
}

- (void)dealloc
{
  NSConditionLock *waitLock;
  objc_super v4;

  waitLock = self->_waitLock;
  if (waitLock)
    -[NSConditionLock unlockWithCondition:](waitLock, "unlockWithCondition:", 1);
  v4.receiver = self;
  v4.super_class = (Class)_SCRCThreadTask;
  -[_SCRCThreadTask dealloc](&v4, sel_dealloc);
}

- (void)setWaitLock:(id)a3
{
  NSConditionLock *v5;
  NSConditionLock *v6;
  NSConditionLock **p_waitLock;
  NSConditionLock *waitLock;
  NSConditionLock *v9;

  v5 = (NSConditionLock *)a3;
  waitLock = self->_waitLock;
  p_waitLock = &self->_waitLock;
  v6 = waitLock;
  if (waitLock != v5)
  {
    v9 = v5;
    if (v6)
      -[NSConditionLock unlockWithCondition:](v6, "unlockWithCondition:", 1);
    objc_storeStrong((id *)p_waitLock, a3);
    v5 = v9;
  }

}

- (void)fire
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id target;
  const char *selector;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  NSConditionLock *waitLock;
  NSConditionLock *v78;
  const char *v79;
  id v80;
  void *v81;
  const char *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  const char *v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  const char *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  const char *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  const char *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;

  if (self->_target && self->_selector)
  {
    v129 = (void *)MEMORY[0x212BD430C]();
    switch(-[NSMutableArray count](self->_objectArray, "count"))
    {
      case 0:
        v3 = objc_msgSend(self->_target, self->_selector);
        goto LABEL_193;
      case 1:
        target = self->_target;
        selector = self->_selector;
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v13)
        {
          v14 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v23 = objc_msgSend(target, selector, v14);
        if (v7 != v13)

        goto LABEL_81;
      case 2:
        v5 = self->_target;
        v6 = self->_selector;
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          v9 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 == v18)
        {
          v19 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v28 = objc_msgSend(v5, v6, v9, v19);
        if (v17 != v18)

        if (v7 != v8)
        goto LABEL_80;
      case 3:
        v125 = self->_selector;
        v128 = self->_target;
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          v10 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 == v21)
        {
          v22 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29 == v30)
        {
          v31 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v38 = objc_msgSend(v128, v125, v10, v22, v31);
        if (v29 != v30)

        if (v20 != v21)
        if (v7 != v8)

LABEL_80:
LABEL_81:

        goto LABEL_193;
      case 4:
        v109 = self->_selector;
        v114 = self->_target;
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v127 == v4)
        {
          v124 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 == v16)
        {
          v119 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25 == v26)
        {
          v27 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35 == v36)
        {
          v37 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 3);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v45 = objc_msgSend(v114, v109, v124, v119, v27, v37);
        if (v35 != v36)

        if (v25 != v26)
        if (v15 != v16)

        if (v127 != v4)
        goto LABEL_192;
      case 5:
        v98 = self->_selector;
        v101 = self->_target;
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        if (v127 == v126)
        {
          v115 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
          v115 = objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v121 == v24)
        {
          v110 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32 == v33)
        {
          v107 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40 == v41)
        {
          v42 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 3);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 4);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48 == v49)
        {
          v50 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 4);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v58 = objc_msgSend(v101, v98, v115, v110, v107, v42, v50);
        if (v48 != v49)

        if (v40 != v41)
        if (v32 != v33)

        if (v121 != v24)
        if (v127 == v126)
          goto LABEL_191;
        v59 = (void *)v115;
        break;
      case 6:
        v88 = self->_selector;
        v91 = self->_target;
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        if (v127 == v126)
        {
          v105 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
          v105 = objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        if (v122 == v117)
        {
          v102 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v112 == v34)
        {
          v99 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43 == v44)
        {
          v95 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 3);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 4);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51 == v52)
        {
          v53 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 4);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 5);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60 == v61)
        {
          v62 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 5);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v68 = objc_msgSend(v91, v88, v105, v102, v99, v95, v53, v62);
        if (v60 != v61)

        if (v51 != v52)
        if (v43 != v44)

        if (v112 != v34)
        if (v122 != v117)

        if (v127 == v126)
          goto LABEL_191;
        v59 = (void *)v105;
        break;
      case 7:
        v82 = self->_selector;
        v84 = self->_target;
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        if (v127 == v126)
        {
          v97 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
          v97 = objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        if (v120 == v116)
        {
          v94 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        if (v111 == v106)
        {
          v93 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 3);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v103 == v39)
        {
          v90 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 3);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 4);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46 == v47)
        {
          v87 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 4);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 5);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55 == v56)
        {
          v57 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 5);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 6);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v65 == v66)
        {
          v67 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 6);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v72 = objc_msgSend(v84, v82, v97, v94, v93, v90, v87, v57, v67);
        if (v65 != v66)

        if (v55 != v56)
        if (v46 != v47)

        if (v103 != v39)
        if (v111 != v106)

        if (v120 != v116)
        if (v127 == v126)
          goto LABEL_191;
        v59 = (void *)v97;
        break;
      case 8:
        v79 = self->_selector;
        v80 = self->_target;
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        if (v127 == v126)
        {
          v92 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 0);
          v92 = objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        if (v123 == v118)
        {
          v89 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 1);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        if (v113 == v108)
        {
          v86 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 2);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 3);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (v104 == v100)
        {
          v85 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 3);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 4);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v96 == v54)
        {
          v83 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 4);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 5);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63 == v64)
        {
          v81 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 5);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 6);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69 == v70)
        {
          v71 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 6);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 7);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v73 == v74)
        {
          v75 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_objectArray, "objectAtIndexedSubscript:", 7);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v76 = objc_msgSend(v80, v79, v92, v89, v86, v85, v83, v81, v71, v75);
        if (v73 != v74)

        if (v69 != v70)
        if (v63 != v64)

        if (v96 != v54)
        if (v104 != v100)

        if (v113 != v108)
        if (v123 != v118)

        if (v127 == v126)
          goto LABEL_191;
        v59 = (void *)v92;
        break;
      default:
        goto LABEL_193;
    }

LABEL_191:
LABEL_192:

LABEL_193:
    waitLock = self->_waitLock;
    if (waitLock)
    {
      -[NSConditionLock lock](waitLock, "lock");
      -[NSConditionLock unlockWithCondition:](self->_waitLock, "unlockWithCondition:", 1);
      v78 = self->_waitLock;
      self->_waitLock = 0;

    }
    objc_autoreleasePoolPop(v129);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectArray, 0);
  objc_storeStrong((id *)&self->_waitLock, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
