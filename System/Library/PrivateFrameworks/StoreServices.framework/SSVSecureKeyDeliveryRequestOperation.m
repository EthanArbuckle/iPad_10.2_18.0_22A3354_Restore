@implementation SSVSecureKeyDeliveryRequestOperation

- (SSVSecureKeyDeliveryRequestOperation)init
{
  SSVSecureKeyDeliveryRequestOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSVSecureKeyDeliveryRequestOperation;
  v2 = -[SSVSecureKeyDeliveryRequestOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVSecureKeyDeliveryRequestOperation.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (NSURL)certificateURL
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SSVSecureKeyDeliveryRequestOperation_certificateURL__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __54__SSVSecureKeyDeliveryRequestOperation_certificateURL__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 256));
}

- (NSURL)keyServerURL
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SSVSecureKeyDeliveryRequestOperation_keyServerURL__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __52__SSVSecureKeyDeliveryRequestOperation_keyServerURL__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 264));
}

- (NSData)persistentContentKeyContext
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SSVSecureKeyDeliveryRequestOperation_persistentContentKeyContext__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __67__SSVSecureKeyDeliveryRequestOperation_persistentContentKeyContext__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 304));
}

- (AVAssetResourceLoadingRequest)resourceLoadingRequest
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SSVSecureKeyDeliveryRequestOperation_resourceLoadingRequest__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVAssetResourceLoadingRequest *)v3;
}

void __62__SSVSecureKeyDeliveryRequestOperation_resourceLoadingRequest__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 272));
}

- (id)responseBlock
{
  NSObject *accessQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__59;
  v10 = __Block_byref_object_dispose__60;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SSVSecureKeyDeliveryRequestOperation_responseBlock__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (void *)MEMORY[0x1A8585DF0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__SSVSecureKeyDeliveryRequestOperation_responseBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSData)serverPlaybackContextData
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__SSVSecureKeyDeliveryRequestOperation_serverPlaybackContextData__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __65__SSVSecureKeyDeliveryRequestOperation_serverPlaybackContextData__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 312));
}

- (void)setCertificateURL:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SSVSecureKeyDeliveryRequestOperation_setCertificateURL___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __58__SSVSecureKeyDeliveryRequestOperation_setCertificateURL___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 256), *(id *)(a1 + 40));
}

- (void)setPersistentContentKeyContext:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SSVSecureKeyDeliveryRequestOperation_setPersistentContentKeyContext___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __71__SSVSecureKeyDeliveryRequestOperation_setPersistentContentKeyContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 304), *(id *)(a1 + 40));
}

- (void)setKeyServerURL:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SSVSecureKeyDeliveryRequestOperation_setKeyServerURL___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __56__SSVSecureKeyDeliveryRequestOperation_setKeyServerURL___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
}

- (void)setITunesStoreRequest:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__SSVSecureKeyDeliveryRequestOperation_setITunesStoreRequest___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(accessQueue, v4);
}

uint64_t __62__SSVSecureKeyDeliveryRequestOperation_setITunesStoreRequest___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 288) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setResourceLoadingRequest:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SSVSecureKeyDeliveryRequestOperation_setResourceLoadingRequest___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __66__SSVSecureKeyDeliveryRequestOperation_setResourceLoadingRequest___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 272), *(id *)(a1 + 40));
}

- (void)setResponseBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SSVSecureKeyDeliveryRequestOperation_setResponseBlock___block_invoke;
  v7[3] = &unk_1E47B8AC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __57__SSVSecureKeyDeliveryRequestOperation_setResponseBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 280);
  *(_QWORD *)(v3 + 280) = v2;

}

- (void)setShouldIncludeGUID:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SSVSecureKeyDeliveryRequestOperation_setShouldIncludeGUID___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(accessQueue, v4);
}

uint64_t __61__SSVSecureKeyDeliveryRequestOperation_setShouldIncludeGUID___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 289) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setServerPlaybackContextData:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SSVSecureKeyDeliveryRequestOperation_setServerPlaybackContextData___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __69__SSVSecureKeyDeliveryRequestOperation_setServerPlaybackContextData___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 312), *(id *)(a1 + 40));
}

- (BOOL)shouldIncludeGUID
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SSVSecureKeyDeliveryRequestOperation_shouldIncludeGUID__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SSVSecureKeyDeliveryRequestOperation_shouldIncludeGUID__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 289);
  return result;
}

- (BOOL)isITunesStoreRequest
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__SSVSecureKeyDeliveryRequestOperation_isITunesStoreRequest__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__SSVSecureKeyDeliveryRequestOperation_isITunesStoreRequest__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 288);
  return result;
}

- (void)configureWithURLBagDictionary:(id)a3
{
  void *v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SSVSecureKeyDeliveryRequestOperation_configureWithURLBagDictionary___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __70__SSVSecureKeyDeliveryRequestOperation_configureWithURLBagDictionary___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 296), *(id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 40))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 288) = 1;
}

- (void)main
{
  NSObject *accessQueue;
  uint64_t v4;
  SSVURLBagInterpreter *v5;
  SSVURLBagInterpreter *v6;
  id v7;
  void *v8;
  SSVLoadURLOperation *v9;
  SSVLoadURLOperation *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  SSVSAPSignaturePolicy *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  int v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  int v43;
  NSObject *v44;
  void *v45;
  int v46;
  int v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  SSVLoadURLOperation *v61;
  SSVLoadURLOperation *v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  SSVSAPSignaturePolicy *v66;
  void *v67;
  double v68;
  uint64_t v69;
  double v70;
  void *v71;
  int v72;
  int v73;
  NSObject *v74;
  void *v75;
  int v76;
  int v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  NSObject *v89;
  void *v90;
  int v91;
  int v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  int v103;
  int v104;
  NSObject *v105;
  void *v106;
  int v107;
  int v108;
  void *v109;
  id v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
  int v126;
  int v127;
  NSObject *v128;
  int v129;
  int v130;
  id v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  int v141;
  int v142;
  NSObject *v143;
  void *v144;
  id v145;
  void *v146;
  id v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  int v156;
  int v157;
  void *v158;
  NSObject *v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  int v175;
  void *v176;
  int v177;
  NSObject *v178;
  int v179;
  void *v180;
  int v181;
  void *v182;
  id v183;
  void *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  id v191;
  void *v192;
  int v193;
  int v194;
  NSObject *v195;
  void *v196;
  int v197;
  int v198;
  void *v199;
  id v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  int *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  SSVLoadURLOperation *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  double v236;
  _QWORD v237[7];
  uint64_t v238;
  uint64_t *v239;
  uint64_t v240;
  uint64_t (*v241)(uint64_t, uint64_t);
  void (*v242)(uint64_t);
  id v243;
  id v244;
  id v245;
  _QWORD v246[6];
  uint64_t v247;
  uint64_t *v248;
  uint64_t v249;
  uint64_t (*v250)(uint64_t, uint64_t);
  void (*v251)(uint64_t);
  id v252;
  uint64_t v253;
  uint64_t *v254;
  uint64_t v255;
  uint64_t (*v256)(uint64_t, uint64_t);
  void (*v257)(uint64_t);
  id v258;
  _QWORD block[12];
  uint64_t v260;
  uint64_t *v261;
  uint64_t v262;
  uint64_t (*v263)(uint64_t, uint64_t);
  void (*v264)(uint64_t);
  id v265;
  uint64_t v266;
  uint64_t *v267;
  uint64_t v268;
  char v269;
  uint64_t v270;
  uint64_t *v271;
  uint64_t v272;
  char v273;
  uint64_t v274;
  uint64_t *v275;
  uint64_t v276;
  uint64_t (*v277)(uint64_t, uint64_t);
  void (*v278)(uint64_t);
  id v279;
  uint64_t v280;
  uint64_t *v281;
  uint64_t v282;
  uint64_t (*v283)(uint64_t, uint64_t);
  void (*v284)(uint64_t);
  id v285;
  uint64_t v286;
  uint64_t *v287;
  uint64_t v288;
  uint64_t (*v289)(uint64_t, uint64_t);
  void (*v290)(uint64_t);
  id v291;
  uint64_t v292;
  uint64_t *v293;
  uint64_t v294;
  uint64_t (*v295)(uint64_t, uint64_t);
  void (*v296)(uint64_t);
  id v297;
  const __CFString *v298;
  void *v299;
  int v300;
  id v301;
  __int16 v302;
  uint64_t v303;
  __int16 v304;
  uint64_t v305;
  _BYTE v306[24];
  uint64_t (*v307)(uint64_t, uint64_t);
  void (*v308)(uint64_t);
  id v309;
  void *v310;
  void *v311;
  _QWORD v312[4];

  v312[1] = *MEMORY[0x1E0C80C00];
  if (-[SSVSecureKeyDeliveryRequestOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSVSecureKeyDeliveryErrorDomain"), -2001, 0);
    v232 = (id)objc_claimAutoreleasedReturnValue();
    -[SSVSecureKeyDeliveryRequestOperation _sendResponseBlockWithError:](self, "_sendResponseBlockWithError:", v232);

    return;
  }
  v292 = 0;
  v293 = &v292;
  v294 = 0x3032000000;
  v295 = __Block_byref_object_copy__2;
  v296 = __Block_byref_object_dispose__2;
  v297 = 0;
  v286 = 0;
  v287 = &v286;
  v288 = 0x3032000000;
  v289 = __Block_byref_object_copy__2;
  v290 = __Block_byref_object_dispose__2;
  v291 = 0;
  v280 = 0;
  v281 = &v280;
  v282 = 0x3032000000;
  v283 = __Block_byref_object_copy__2;
  v284 = __Block_byref_object_dispose__2;
  v285 = 0;
  v274 = 0;
  v275 = &v274;
  v276 = 0x3032000000;
  v277 = __Block_byref_object_copy__2;
  v278 = __Block_byref_object_dispose__2;
  v279 = 0;
  v270 = 0;
  v271 = &v270;
  v272 = 0x2020000000;
  v273 = 0;
  v266 = 0;
  v267 = &v266;
  v268 = 0x2020000000;
  v269 = 0;
  v260 = 0;
  v261 = &v260;
  v262 = 0x3032000000;
  v263 = __Block_byref_object_copy__2;
  v264 = __Block_byref_object_dispose__2;
  v265 = 0;
  accessQueue = self->_accessQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke;
  block[3] = &unk_1E47B9878;
  block[4] = self;
  block[5] = &v292;
  block[6] = &v286;
  block[7] = &v274;
  block[8] = &v270;
  block[9] = &v266;
  block[10] = &v280;
  block[11] = &v260;
  dispatch_sync(accessQueue, block);
  if (v293[5] && v287[5] && v275[5])
  {
    if (*((_BYTE *)v271 + 24) && v281[5])
    {
      v5 = [SSVURLBagInterpreter alloc];
      v6 = -[SSVURLBagInterpreter initWithURLBagDictionary:](v5, "initWithURLBagDictionary:", v281[5]);
    }
    else
    {
      v6 = 0;
    }
    v7 = objc_alloc(MEMORY[0x1E0CB37A8]);
    v8 = (void *)objc_msgSend(v7, "initWithURL:", v293[5]);
    objc_msgSend(v8, "setHTTPMethod:", CFSTR("GET"));
    v233 = v8;
    v253 = 0;
    v254 = &v253;
    v255 = 0x3032000000;
    v256 = __Block_byref_object_copy__2;
    v257 = __Block_byref_object_dispose__2;
    v258 = 0;
    v247 = 0;
    v248 = &v247;
    v249 = 0x3032000000;
    v250 = __Block_byref_object_copy__2;
    v251 = __Block_byref_object_dispose__2;
    v252 = 0;
    v9 = -[SSVLoadURLOperation initWithURLRequest:]([SSVLoadURLOperation alloc], "initWithURLRequest:", v8);
    v10 = v9;
    if (*((_BYTE *)v271 + 24))
    {
      -[SSVLoadURLOperation setITunesStoreRequest:](v9, "setITunesStoreRequest:", 1);
      if (v281[5])
      {
        -[SSVLoadURLOperation configureWithURLBagDictionary:](v10, "configureWithURLBagDictionary:");
        -[SSVLoadURLOperation storeFrontSuffix](v10, "storeFrontSuffix");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (v12)
        {
          -[SSVURLBagInterpreter storeFrontSuffix](v6, "storeFrontSuffix");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSVLoadURLOperation setStoreFrontSuffix:](v10, "setStoreFrontSuffix:", v13);

        }
        -[SSVLoadURLOperation setMachineDataStyle:](v10, "setMachineDataStyle:", 2);
        v14 = -[SSVSAPSignaturePolicy initWithPolicyType:]([SSVSAPSignaturePolicy alloc], "initWithPolicyType:", 1);
        -[SSVLoadURLOperation setSAPSignaturePolicy:](v10, "setSAPSignaturePolicy:", v14);

      }
    }
    v246[0] = v4;
    v246[1] = 3221225472;
    v246[2] = __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke_2;
    v246[3] = &unk_1E47B98A0;
    v246[4] = &v247;
    v246[5] = &v253;
    -[SSVLoadURLOperation setOutputBlock:](v10, "setOutputBlock:", v246);
    -[SSVLoadURLOperation main](v10, "main");
    if (objc_msgSend((id)v248[5], "length"))
    {
      objc_msgSend((id)v275[5], "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URL");
      v230 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v230, "host");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dataUsingEncoding:", 4);
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = v16;
      if (*((_BYTE *)v267 + 24))
      {
        v17 = (void *)SSVAVFoundationFramework();
        SSVWeakLinkedStringConstantForString("AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v311 = v18;
        v312[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v312, &v311, 1);
        v226 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v226 = 0;
      }
      if (v261[5])
      {
        v231 = 0;
      }
      else
      {
        v35 = (void *)v275[5];
        v36 = v248[5];
        v245 = 0;
        objc_msgSend(v35, "streamingContentKeyRequestDataForApp:contentIdentifier:options:error:", v36, v227, v226, &v245);
        v37 = objc_claimAutoreleasedReturnValue();
        v231 = v245;
        v38 = (void *)v261[5];
        v261[5] = v37;

        -[SSVSecureKeyDeliveryRequestOperation setServerPlaybackContextData:](self, "setServerPlaybackContextData:", v261[5]);
        -[SSVSecureKeyDeliveryRequestOperation serverPlaybackContextDataDelegate](self, "serverPlaybackContextDataDelegate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "secureKeyDeliveryRequestOperationDidChangeServerPlaybackContextData:", self);

      }
      objc_msgSend(v230, "absoluteString");
      v40 = objc_claimAutoreleasedReturnValue();
      v228 = (void *)v40;
      if (v231 || !v261[5])
      {
        v19 = (uint64_t)v231;
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v41)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v42 = objc_msgSend(v41, "shouldLog");
        v43 = objc_msgSend(v41, "shouldLogToDisk");
        objc_msgSend(v41, "OSLogObject");
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v43)
          v46 = v42 | 2;
        else
          v46 = v42;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          v47 = v46;
        else
          v47 = v46 & 2;
        if (v47)
        {
          v48 = (void *)objc_opt_class();
          *(_DWORD *)v306 = 138543618;
          *(_QWORD *)&v306[4] = v48;
          *(_WORD *)&v306[12] = 2112;
          *(_QWORD *)&v306[14] = v19;
          v49 = v48;
          LODWORD(v215) = 22;
          v214 = (int *)v306;
          v50 = (void *)_os_log_send_and_compose_impl();

          if (!v50)
          {
LABEL_187:

            goto LABEL_188;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v50, 4, v306, v215);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          free(v50);
          SSFileLog(v41, CFSTR("%@"), v51, v52, v53, v54, v55, v56, (uint64_t)v45);
        }
LABEL_186:

        goto LABEL_187;
      }
      -[SSVSecureKeyDeliveryRequestOperation _streamingKeyDictionaryForID:URI:serverPlaybackContextData:](self, "_streamingKeyDictionaryForID:URI:serverPlaybackContextData:", 0, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v310 = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v310, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVSecureKeyDeliveryRequestOperation _streamingRequestDictionaryWithStreamingKeyDictionaries:](self, "_streamingRequestDictionaryWithStreamingKeyDictionaries:", v57);
      v224 = (void *)objc_claimAutoreleasedReturnValue();

      v244 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v224, 0, &v244);
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = v244;
      v19 = (uint64_t)v59;
      v223 = (void *)v58;
      if (v58 && !v59)
      {
        objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v287[5]);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setHTTPBody:", v58);
        objc_msgSend(v60, "setHTTPMethod:", CFSTR("POST"));
        objc_msgSend(v60, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v306 = 0;
        *(_QWORD *)&v306[8] = v306;
        *(_QWORD *)&v306[16] = 0x3032000000;
        v307 = __Block_byref_object_copy__2;
        v308 = __Block_byref_object_dispose__2;
        v309 = 0;
        v238 = 0;
        v239 = &v238;
        v240 = 0x3032000000;
        v241 = __Block_byref_object_copy__2;
        v242 = __Block_byref_object_dispose__2;
        v243 = 0;
        v61 = -[SSVLoadURLOperation initWithURLRequest:]([SSVLoadURLOperation alloc], "initWithURLRequest:", v60);
        v62 = v61;
        v222 = v61;
        if (*((_BYTE *)v271 + 24))
        {
          -[SSVLoadURLOperation setITunesStoreRequest:](v61, "setITunesStoreRequest:", 1);
          if (v281[5])
          {
            -[SSVLoadURLOperation configureWithURLBagDictionary:](v62, "configureWithURLBagDictionary:");
            -[SSVLoadURLOperation storeFrontSuffix](v62, "storeFrontSuffix");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v63 == 0;

            if (v64)
            {
              -[SSVURLBagInterpreter storeFrontSuffix](v6, "storeFrontSuffix");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[SSVLoadURLOperation setStoreFrontSuffix:](v222, "setStoreFrontSuffix:", v65);

            }
            -[SSVLoadURLOperation setMachineDataStyle:](v222, "setMachineDataStyle:", 2);
            v66 = -[SSVSAPSignaturePolicy initWithPolicyType:]([SSVSAPSignaturePolicy alloc], "initWithPolicyType:", 1);
            -[SSVLoadURLOperation setSAPSignaturePolicy:](v222, "setSAPSignaturePolicy:", v66);

            v62 = v222;
          }
        }
        +[SSVURLDataConsumer consumer](SSVURLProtocolConsumer, "consumer");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSVLoadURLOperation setDataConsumer:](v62, "setDataConsumer:", v67);

        v237[0] = v4;
        v237[1] = 3221225472;
        v237[2] = __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke_3;
        v237[3] = &unk_1E47B98C8;
        v237[4] = self;
        v237[5] = &v238;
        v237[6] = v306;
        -[SSVLoadURLOperation setOutputBlock:](v222, "setOutputBlock:", v237);
        -[SSVLoadURLOperation main](v222, "main");
        v236 = 0.0;
        v68 = 0.0;
        if (!objc_msgSend(v224, "count") || *(_QWORD *)(*(_QWORD *)&v306[8] + 40))
        {
          v69 = 0;
          v19 = 0;
          v70 = 0.0;
          goto LABEL_138;
        }
        objc_msgSend((id)v239[5], "objectForKey:", CFSTR("fairplay-streaming-response"));
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v124)
          {
            +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v125 = v124;
          v126 = objc_msgSend(v124, "shouldLog");
          v127 = objc_msgSend(v125, "shouldLogToDisk");
          v217 = v125;
          objc_msgSend(v125, "OSLogObject");
          v128 = objc_claimAutoreleasedReturnValue();
          v121 = v128;
          if (v127)
            v129 = v126 | 2;
          else
            v129 = v126;
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
            v130 = v129;
          else
            v130 = v129 & 2;
          if (v130)
          {
            v131 = (id)objc_opt_class();
            v132 = (void *)objc_opt_class();
            v300 = 138543618;
            v301 = v131;
            v302 = 2112;
            v303 = (uint64_t)v132;
            v133 = v132;
            LODWORD(v215) = 22;
            v214 = &v300;
            v19 = _os_log_send_and_compose_impl();

            if (!v19)
            {
              v69 = 0;
              v70 = 0.0;
              goto LABEL_137;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v300, v215);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            free((void *)v19);
            SSFileLog(v217, CFSTR("%@"), v134, v135, v136, v137, v138, v139, (uint64_t)v121);
          }
LABEL_112:
          v69 = 0;
          v19 = 0;
LABEL_135:
          v70 = 0.0;
          goto LABEL_136;
        }
        objc_msgSend(v219, "objectForKey:", CFSTR("version"));
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v120 = objc_msgSend(v217, "longLongValue");
          if (v120 == 1)
          {
            objc_msgSend(v219, "objectForKey:", CFSTR("streaming-keys"));
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v235 = 0;
              -[SSVSecureKeyDeliveryRequestOperation _contentKeyContextForStreamingKeyID:streamingKeyDictionaries:renewAfter:error:](self, "_contentKeyContextForStreamingKeyID:streamingKeyDictionaries:renewAfter:error:", 0, v121, &v236, &v235);
              v69 = objc_claimAutoreleasedReturnValue();
              v19 = (uint64_t)v235;
              -[SSVSecureKeyDeliveryRequestOperation _expirationTimeForStreamingKeyID:streamingKeyDictionaries:](self, "_expirationTimeForStreamingKeyID:streamingKeyDictionaries:", 0, v121);
              v70 = v122;
              -[SSVSecureKeyDeliveryRequestOperation _playbackStartTimeForStreamingKeyID:streamingKeyDictionaries:](self, "_playbackStartTimeForStreamingKeyID:streamingKeyDictionaries:", 0, v121);
              v68 = v123;
LABEL_136:

LABEL_137:
LABEL_138:
              if (!(v19 | v69))
              {
                v173 = *(void **)(*(_QWORD *)&v306[8] + 40);
                if (!v173)
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSVSecureKeyDeliveryErrorDomain"), -2005, 0);
                  v19 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_182;
                }
                v218 = v69;
                v19 = v173;
                +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v174)
                {
                  +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                  v174 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v175 = objc_msgSend(v174, "shouldLog", v214);
                v176 = v174;
                v177 = objc_msgSend(v174, "shouldLogToDisk");
                v220 = v176;
                objc_msgSend(v176, "OSLogObject");
                v178 = objc_claimAutoreleasedReturnValue();
                if (v177)
                  v179 = v175 | 2;
                else
                  v179 = v175;
                v180 = v178;
                if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
                  v181 = v179;
                else
                  v181 = v179 & 2;
                if (v181)
                {
                  v182 = (void *)objc_opt_class();
                  v300 = 138543618;
                  v301 = v182;
                  v302 = 2112;
                  v303 = v19;
                  v183 = v182;
                  LODWORD(v215) = 22;
                  v214 = &v300;
                  v184 = (void *)_os_log_send_and_compose_impl();

                  if (!v184)
                  {
LABEL_181:

                    v69 = v218;
                    goto LABEL_182;
                  }
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v184, 4, &v300, v215);
                  v180 = (void *)objc_claimAutoreleasedReturnValue();
                  free(v184);
                  SSFileLog(v220, CFSTR("%@"), v185, v186, v187, v188, v189, v190, (uint64_t)v180);
                }
LABEL_180:

                goto LABEL_181;
              }
              if (v19)
                goto LABEL_182;
              v172 = (void *)v275[5];
              if (!v172 || !v69)
                goto LABEL_182;
              if (self->_leaseAction == 3)
              {
                v19 = 0;
LABEL_182:
                self->_expirationTime = v70;
                self->_playbackStartTime = v68;

                _Block_object_dispose(&v238, 8);
                _Block_object_dispose(v306, 8);

                v90 = v221;
                goto LABEL_183;
              }
              v218 = v69;
              if (*((_BYTE *)v267 + 24))
              {
                v234 = 0;
                objc_msgSend(v172, "persistentContentKeyFromKeyVendorResponse:options:error:", v69, 0, &v234);
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                v191 = v234;
                if (v191)
                {
                  v180 = v191;
                  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
                  v192 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v192)
                  {
                    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                    v192 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v193 = objc_msgSend(v192, "shouldLog", v214);
                  v194 = objc_msgSend(v192, "shouldLogToDisk");
                  v216 = v192;
                  objc_msgSend(v192, "OSLogObject");
                  v195 = objc_claimAutoreleasedReturnValue();
                  v196 = v195;
                  if (v194)
                    v197 = v193 | 2;
                  else
                    v197 = v193;
                  if (os_log_type_enabled(v195, OS_LOG_TYPE_DEBUG))
                    v198 = v197;
                  else
                    v198 = v197 & 2;
                  if (v198)
                  {
                    v199 = (void *)objc_opt_class();
                    v300 = 138543618;
                    v301 = v199;
                    v302 = 2112;
                    v303 = (uint64_t)v180;
                    v200 = v199;
                    LODWORD(v215) = 22;
                    v214 = &v300;
                    v201 = (void *)_os_log_send_and_compose_impl();

                    if (!v201)
                    {
LABEL_171:

                      v69 = v218;
LABEL_176:
                      objc_msgSend((id)v275[5], "dataRequest", v214);
                      v209 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v209, "respondWithData:", v69);
                      goto LABEL_177;
                    }
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v201, 4, &v300, v215);
                    v196 = (void *)objc_claimAutoreleasedReturnValue();
                    free(v201);
                    SSFileLog(v216, CFSTR("%@"), v202, v203, v204, v205, v206, v207, (uint64_t)v196);
                  }

                  goto LABEL_171;
                }
                if (v220)
                {
                  -[SSVSecureKeyDeliveryRequestOperation setPersistentContentKeyContext:](self, "setPersistentContentKeyContext:");
                  v208 = (void *)SSVAVFoundationFramework();
                  SSVWeakLinkedStringConstantForString("AVStreamingKeyDeliveryPersistentContentKeyType", v208);
                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v275[5], "contentInformationRequest");
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v210, "setContentType:", v209);

                  objc_msgSend((id)v275[5], "dataRequest");
                  v211 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v211, "respondWithData:", v220);

                  v180 = 0;
LABEL_177:

                  if (v236 != 0.0)
                  {
                    objc_msgSend(v221, "dateByAddingTimeInterval:", v236);
                    v212 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend((id)v275[5], "contentInformationRequest");
                    v213 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v213, "setRenewalDate:", v212);

                  }
                  v19 = 0;
                  goto LABEL_180;
                }
              }
              v180 = 0;
              v220 = 0;
              goto LABEL_176;
            }
            goto LABEL_112;
          }
LABEL_124:
          +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", v214);
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v155)
          {
            +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v156 = objc_msgSend(v155, "shouldLog");
          v157 = objc_msgSend(v155, "shouldLogToDisk");
          v158 = v155;
          objc_msgSend(v155, "OSLogObject");
          v159 = objc_claimAutoreleasedReturnValue();
          v160 = v159;
          if (v157)
            v156 |= 2u;
          if (!os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
            v156 &= 2u;
          if (v156)
          {
            v161 = (void *)objc_opt_class();
            v300 = 138543874;
            v301 = v161;
            v302 = 2048;
            v303 = v120;
            v304 = 2048;
            v305 = 1;
            v162 = v161;
            LODWORD(v215) = 32;
            v214 = &v300;
            v163 = (void *)_os_log_send_and_compose_impl();

            if (!v163)
            {
LABEL_134:

              v170 = (void *)MEMORY[0x1E0CB35C8];
              v298 = CFSTR("SSVSecureKeyDeliveryErrorUserInfoKeyResponseVersion");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v120);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v299 = v121;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v299, &v298, 1);
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v170, "errorWithDomain:code:userInfo:", CFSTR("SSVSecureKeyDeliveryErrorDomain"), -2005, v171);
              v19 = objc_claimAutoreleasedReturnValue();

              v69 = 0;
              goto LABEL_135;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v163, 4, &v300, v215);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            free(v163);
            SSFileLog(v158, CFSTR("%@"), v164, v165, v166, v167, v168, v169, (uint64_t)v160);
          }

          goto LABEL_134;
        }
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v140)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v141 = objc_msgSend(v140, "shouldLog");
        v142 = objc_msgSend(v140, "shouldLogToDisk");
        objc_msgSend(v140, "OSLogObject");
        v143 = objc_claimAutoreleasedReturnValue();
        v144 = v143;
        if (v142)
          v141 |= 2u;
        if (!os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
          v141 &= 2u;
        if (v141)
        {
          v145 = (id)objc_opt_class();
          v146 = (void *)objc_opt_class();
          v300 = 138543618;
          v301 = v145;
          v302 = 2112;
          v303 = (uint64_t)v146;
          v147 = v146;
          LODWORD(v215) = 22;
          v214 = &v300;
          v148 = (void *)_os_log_send_and_compose_impl();

          if (!v148)
          {
LABEL_123:

            v120 = 0;
            goto LABEL_124;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v148, 4, &v300, v215);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          free(v148);
          SSFileLog(v140, CFSTR("%@"), v149, v150, v151, v152, v153, v154, (uint64_t)v144);
        }

        goto LABEL_123;
      }
      if (v59)
      {
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v60)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v87 = objc_msgSend(v60, "shouldLog");
        v88 = objc_msgSend(v60, "shouldLogToDisk");
        objc_msgSend(v60, "OSLogObject");
        v89 = objc_claimAutoreleasedReturnValue();
        v90 = v89;
        if (v88)
          v91 = v87 | 2;
        else
          v91 = v87;
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
          v92 = v91;
        else
          v92 = v91 & 2;
        if (v92)
        {
          v93 = (void *)objc_opt_class();
          *(_DWORD *)v306 = 138543618;
          *(_QWORD *)&v306[4] = v93;
          *(_WORD *)&v306[12] = 2112;
          *(_QWORD *)&v306[14] = v19;
          v94 = v93;
          LODWORD(v215) = 22;
          v214 = (int *)v306;
          v95 = (void *)_os_log_send_and_compose_impl();

          if (!v95)
          {
LABEL_184:

            v119 = v223;
            goto LABEL_185;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v95, 4, v306, v215);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          free(v95);
          SSFileLog(v60, CFSTR("%@"), v96, v97, v98, v99, v100, v101, (uint64_t)v90);
        }
LABEL_183:

        goto LABEL_184;
      }
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v102)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v103 = objc_msgSend(v102, "shouldLog");
      v104 = objc_msgSend(v102, "shouldLogToDisk");
      objc_msgSend(v102, "OSLogObject");
      v105 = objc_claimAutoreleasedReturnValue();
      v106 = v105;
      if (v104)
        v107 = v103 | 2;
      else
        v107 = v103;
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        v108 = v107;
      else
        v108 = v107 & 2;
      if (v108)
      {
        v109 = (void *)objc_opt_class();
        *(_DWORD *)v306 = 138543362;
        *(_QWORD *)&v306[4] = v109;
        v110 = v109;
        LODWORD(v215) = 12;
        v214 = (int *)v306;
        v111 = (void *)_os_log_send_and_compose_impl();

        if (!v111)
        {
LABEL_95:

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSVSecureKeyDeliveryErrorDomain"), -2004, 0);
          v118 = objc_claimAutoreleasedReturnValue();
          v119 = v223;
          v19 = v118;
LABEL_185:

          v45 = v224;
          goto LABEL_186;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v111, 4, v306, v215);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        free(v111);
        SSFileLog(v102, CFSTR("%@"), v112, v113, v114, v115, v116, v117, (uint64_t)v106);
      }

      goto LABEL_95;
    }
    v19 = (uint64_t)(id)v254[5];
    if (v19)
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v21 = objc_msgSend(v20, "shouldLog");
      v22 = objc_msgSend(v20, "shouldLogToDisk");
      objc_msgSend(v20, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v22)
        v24 = v21 | 2;
      else
        v24 = v21;
      v228 = v23;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        v25 = v24;
      else
        v25 = v24 & 2;
      v231 = v20;
      if (v25)
      {
        v26 = (void *)objc_opt_class();
        *(_DWORD *)v306 = 138543618;
        *(_QWORD *)&v306[4] = v26;
        *(_WORD *)&v306[12] = 2112;
        *(_QWORD *)&v306[14] = v19;
        v27 = v26;
        LODWORD(v215) = 22;
        v214 = (int *)v306;
        v28 = (void *)_os_log_send_and_compose_impl();

        if (v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v28, 4, v306, v215);
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          free(v28);
          SSFileLog(v20, CFSTR("%@"), v29, v30, v31, v32, v33, v34, (uint64_t)v229);

        }
        goto LABEL_189;
      }
LABEL_188:

LABEL_189:
      goto LABEL_190;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v71)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v72 = objc_msgSend(v71, "shouldLog");
    v73 = objc_msgSend(v71, "shouldLogToDisk");
    objc_msgSend(v71, "OSLogObject");
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v73)
      v76 = v72 | 2;
    else
      v76 = v72;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      v77 = v76;
    else
      v77 = v76 & 2;
    if (v77)
    {
      v78 = (void *)objc_opt_class();
      *(_DWORD *)v306 = 138543362;
      *(_QWORD *)&v306[4] = v78;
      v79 = v78;
      LODWORD(v215) = 12;
      v214 = (int *)v306;
      v80 = (void *)_os_log_send_and_compose_impl();

      if (!v80)
      {
LABEL_70:

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSVSecureKeyDeliveryErrorDomain"), -2003, 0);
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_190:
        -[SSVSecureKeyDeliveryRequestOperation _sendResponseBlockWithError:](self, "_sendResponseBlockWithError:", v19, v214);

        _Block_object_dispose(&v247, 8);
        _Block_object_dispose(&v253, 8);

        goto LABEL_191;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v80, 4, v306, v215);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      free(v80);
      SSFileLog(v71, CFSTR("%@"), v81, v82, v83, v84, v85, v86, (uint64_t)v75);
    }

    goto LABEL_70;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSVSecureKeyDeliveryErrorDomain"), -2002, 0);
  v6 = (SSVURLBagInterpreter *)objc_claimAutoreleasedReturnValue();
  -[SSVSecureKeyDeliveryRequestOperation _sendResponseBlockWithError:](self, "_sendResponseBlockWithError:", v6);
LABEL_191:

  _Block_object_dispose(&v260, 8);
  _Block_object_dispose(&v266, 8);
  _Block_object_dispose(&v270, 8);
  _Block_object_dispose(&v274, 8);

  _Block_object_dispose(&v280, 8);
  _Block_object_dispose(&v286, 8);

  _Block_object_dispose(&v292, 8);
}

void __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 256));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 264));
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 272));
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = *(_BYTE *)(a1[4] + 288);
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = *(_BYTE *)(a1[4] + 321);
  objc_storeStrong((id *)(*(_QWORD *)(a1[10] + 8) + 40), *(id *)(a1[4] + 296));
  objc_storeStrong((id *)(*(_QWORD *)(a1[11] + 8) + 40), *(id *)(a1[4] + 312));
}

void __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (v9)
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      *(_DWORD *)v27 = 138543618;
      *(_QWORD *)&v27[4] = v11;
      *(_WORD *)&v27[12] = 2112;
      *(_QWORD *)&v27[14] = objc_opt_class();
      v13 = *(id *)&v27[14];
      LODWORD(v26) = 22;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        v5 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, v27, v26, *(_OWORD *)v27, *(_QWORD *)&v27[16], v28);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v7, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v10);
    }

    goto LABEL_13;
  }
LABEL_14:
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v5;
  v23 = v5;

  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v6;

}

- (void)start
{
  id v3;
  objc_super v4;

  if (-[SSVSecureKeyDeliveryRequestOperation isFinished](self, "isFinished")
    && -[SSVSecureKeyDeliveryRequestOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSVSecureKeyDeliveryErrorDomain"), -2001, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SSVSecureKeyDeliveryRequestOperation _sendResponseBlockWithError:](self, "_sendResponseBlockWithError:", v3);

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SSVSecureKeyDeliveryRequestOperation;
    -[SSVSecureKeyDeliveryRequestOperation start](&v4, sel_start);
  }
}

- (id)_contentKeyContextForStreamingKeyID:(int64_t)a3 streamingKeyDictionaries:(id)a4 renewAfter:(double *)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  int v49;
  NSObject *v50;
  int v51;
  double *v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  NSObject *v77;
  int v78;
  void *v79;
  id v80;
  void *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  int v91;
  NSObject *v92;
  int v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  int v104;
  NSObject *v105;
  int v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int *v121;
  int *v122;
  int *v123;
  uint64_t v124;
  uint64_t v125;
  id *v126;
  double *v127;
  void *v129;
  void *v130;
  id obj;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  int v136;
  void *v137;
  __int16 v138;
  int64_t v139;
  __int16 v140;
  uint64_t v141;
  __int16 v142;
  void *v143;
  __int16 v144;
  void *v145;
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  obj = a4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
  if (!v8)
  {
    v45 = 0;
    v46 = 0;
    goto LABEL_110;
  }
  v9 = v8;
  v126 = a6;
  v127 = a5;
  v10 = *(_QWORD *)v133;
  v11 = &off_1E47B6000;
LABEL_3:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v133 != v10)
      objc_enumerationMutation(obj);
    v13 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v12);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v11[387], "sharedStoreServicesConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(v11[387], "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = objc_msgSend(v14, "shouldLog", v121, v124);
      if (objc_msgSend(v14, "shouldLogToDisk"))
        v16 = v15 | 2;
      else
        v16 = v15;
      objc_msgSend(v14, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        v18 = v16;
      else
        v18 = v16 & 2;
      if (!v18)
        goto LABEL_33;
      v19 = (void *)objc_opt_class();
      v20 = v19;
      v21 = (void *)objc_opt_class();
      v136 = 138543618;
      v137 = v19;
      v138 = 2112;
      v139 = (int64_t)v21;
      v22 = v21;
      LODWORD(v124) = 22;
      v121 = &v136;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
        v11 = &off_1E47B6000;
        goto LABEL_34;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, &v136, v124);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v23);
      SSFileLog(v14, CFSTR("%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v17);
      goto LABEL_32;
    }
    objc_msgSend(v13, "objectForKey:", CFSTR("id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(v11[387], "sharedStoreServicesConfig");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(v11[387], "sharedConfig");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v30 = -[NSObject shouldLog](v17, "shouldLog", v121);
      if (-[NSObject shouldLogToDisk](v17, "shouldLogToDisk"))
        v30 |= 2u;
      -[NSObject OSLogObject](v17, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        v32 = v30;
      else
        v32 = v30 & 2;
      if (!v32)
        goto LABEL_31;
      v33 = (void *)objc_opt_class();
      v34 = v33;
      v35 = (void *)objc_opt_class();
      v136 = 138543618;
      v137 = v33;
      v138 = 2112;
      v139 = (int64_t)v35;
      v36 = v35;
      LODWORD(v124) = 22;
      v121 = &v136;
      v37 = (void *)_os_log_send_and_compose_impl();

      if (v37)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v37, 4, &v136, v124);
        v31 = objc_claimAutoreleasedReturnValue();
        free(v37);
        SSFileLog(v17, CFSTR("%@"), v38, v39, v40, v41, v42, v43, (uint64_t)v31);
        v11 = &off_1E47B6000;
LABEL_31:

LABEL_33:
        goto LABEL_34;
      }
LABEL_32:
      v11 = &off_1E47B6000;
      goto LABEL_33;
    }
    if (objc_msgSend(v14, "longLongValue") == a3)
      break;
LABEL_34:

    if (v9 == ++v12)
    {
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
      v9 = v44;
      if (!v44)
      {
        v45 = 0;
        v46 = 0;
        goto LABEL_109;
      }
      goto LABEL_3;
    }
  }
  objc_msgSend(v11[387], "sharedStoreServicesConfig");
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v47;
  if (!v47)
  {
    objc_msgSend(v11[387], "sharedConfig");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49 = objc_msgSend(v48, "shouldLog", v121);
  if (objc_msgSend(v48, "shouldLogToDisk"))
    v49 |= 2u;
  objc_msgSend(v48, "OSLogObject");
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    v51 = v49;
  else
    v51 = v49 & 2;
  v52 = v127;
  if (v51)
  {
    v53 = (void *)objc_opt_class();
    v136 = 138543618;
    v137 = v53;
    v138 = 2048;
    v139 = a3;
    v54 = v53;
    LODWORD(v124) = 22;
    v122 = &v136;
    v55 = (void *)_os_log_send_and_compose_impl();

    if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v55, 4, &v136, v124);
      v50 = objc_claimAutoreleasedReturnValue();
      free(v55);
      SSFileLog(v48, CFSTR("%@"), v56, v57, v58, v59, v60, v61, (uint64_t)v50);
      goto LABEL_49;
    }
  }
  else
  {
LABEL_49:

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("status"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("failureType"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0 || (v64 = objc_msgSend(v62, "longLongValue")) == 0)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("ckc"), v122);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v68, 0);
      if (!objc_msgSend(v46, "length"))
      {
        v89 = v62;
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v90)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v129 = v63;
        v91 = objc_msgSend(v90, "shouldLog");
        if (objc_msgSend(v90, "shouldLogToDisk"))
          v91 |= 2u;
        objc_msgSend(v90, "OSLogObject");
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          v93 = v91;
        else
          v93 = v91 & 2;
        if (v93)
        {
          v94 = (void *)objc_opt_class();
          v136 = 138543618;
          v137 = v94;
          v138 = 2048;
          v139 = a3;
          v95 = v94;
          LODWORD(v124) = 22;
          v123 = &v136;
          v96 = (void *)_os_log_send_and_compose_impl();

          v62 = v89;
          if (!v96)
            goto LABEL_106;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v96, 4, &v136, v124);
          v92 = objc_claimAutoreleasedReturnValue();
          free(v96);
          SSFileLog(v90, CFSTR("%@"), v97, v98, v99, v100, v101, v102, (uint64_t)v92);
        }
        else
        {
          v62 = v89;
        }

LABEL_106:
        v46 = 0;
        v52 = v127;
        v63 = v129;
        if (!v127)
          goto LABEL_107;
        goto LABEL_96;
      }
LABEL_95:
      if (!v127)
      {
LABEL_107:
        v45 = 0;
        goto LABEL_108;
      }
LABEL_96:
      v71 = v63;
      objc_msgSend(v13, "objectForKey:", CFSTR("renew-after"), v123);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = 0;
      if (v72 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v72, "doubleValue");
        v118 = v119;
      }
      v45 = 0;
      *(_QWORD *)v52 = v118;
      goto LABEL_103;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = v68;
      if (!v127)
        goto LABEL_107;
      goto LABEL_96;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v103)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v104 = objc_msgSend(v103, "shouldLog");
    if (objc_msgSend(v103, "shouldLogToDisk"))
      v104 |= 2u;
    objc_msgSend(v103, "OSLogObject");
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      v106 = v104;
    else
      v106 = v104 & 2;
    if (v106)
    {
      v107 = (void *)objc_opt_class();
      v130 = v63;
      v108 = v107;
      v109 = (void *)objc_opt_class();
      v136 = 138543874;
      v137 = v107;
      v138 = 2048;
      v139 = a3;
      v140 = 2112;
      v141 = (uint64_t)v109;
      v110 = v109;
      LODWORD(v124) = 32;
      v123 = &v136;
      v111 = (void *)_os_log_send_and_compose_impl();

      v63 = v130;
      if (!v111)
      {
LABEL_94:

        v46 = 0;
        goto LABEL_95;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v111, 4, &v136, v124);
      v105 = objc_claimAutoreleasedReturnValue();
      free(v111);
      SSFileLog(v103, CFSTR("%@"), v112, v113, v114, v115, v116, v117, (uint64_t)v105);
    }

    goto LABEL_94;
  }
  v65 = v64;
  v66 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v65);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v66, "initWithObjectsAndKeys:", v67, CFSTR("SSVSecureKeyDeliveryErrorUserInfoKeyResponseStatus"), 0);

  v69 = 0x1E0CB3000;
  if (v63 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSServerErrorDomain"), objc_msgSend(v63, "integerValue"), 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setObject:forKey:", v70, CFSTR("SSVSecureKeyDeliveryErrorUserInfoKeyServerError"));

    v69 = 0x1E0CB3000uLL;
  }
  v71 = v63;
  objc_msgSend(v13, "objectForKey:", CFSTR("dialog"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v72, "isNSDictionary"))
    objc_msgSend(v68, "setObject:forKey:", v72, CFSTR("SSVSecureKeyDeliveryErrorUserInfoKeyDialogDictionary"));
  v73 = v62;
  v74 = (void *)objc_msgSend(objc_alloc(*(Class *)(v69 + 1480)), "initWithDomain:code:userInfo:", CFSTR("com.apple.fpsrequest"), v65, 0);
  objc_msgSend(v68, "setObject:forKey:", v74, *MEMORY[0x1E0CB3388]);

  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v75)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v76 = objc_msgSend(v75, "shouldLog");
  if (objc_msgSend(v75, "shouldLogToDisk"))
    v76 |= 2u;
  objc_msgSend(v75, "OSLogObject");
  v77 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    v78 = v76;
  else
    v78 = v76 & 2;
  if (v78)
  {
    v79 = (void *)objc_opt_class();
    v136 = 138544386;
    v137 = v79;
    v138 = 2048;
    v139 = a3;
    v140 = 2048;
    v141 = v65;
    v142 = 2114;
    v143 = v71;
    v144 = 2114;
    v145 = v72;
    v80 = v79;
    LODWORD(v125) = 52;
    v81 = (void *)_os_log_send_and_compose_impl();

    v62 = v73;
    v82 = 0x1E0CB3000;
    if (v81)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v81, 4, &v136, v125);
      v77 = objc_claimAutoreleasedReturnValue();
      free(v81);
      SSFileLog(v75, CFSTR("%@"), v83, v84, v85, v86, v87, v88, (uint64_t)v77);
      goto LABEL_101;
    }
  }
  else
  {
    v62 = v73;
    v82 = 0x1E0CB3000uLL;
LABEL_101:

  }
  objc_msgSend(*(id *)(v82 + 1480), "errorWithDomain:code:userInfo:", CFSTR("SSVSecureKeyDeliveryErrorDomain"), -2005, v68);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
LABEL_103:

  v63 = v71;
LABEL_108:

LABEL_109:
  a6 = v126;
LABEL_110:

  if (a6)
    *a6 = objc_retainAutorelease(v45);

  return v46;
}

- (double)_expirationTimeForStreamingKeyID:(int64_t)a3 streamingKeyDictionaries:(id)a4
{
  double result;

  -[SSVSecureKeyDeliveryRequestOperation _timeIntervalForStreamingKeyID:responseKey:streamingKeyDictionaries:](self, "_timeIntervalForStreamingKeyID:responseKey:streamingKeyDictionaries:", a3, CFSTR("expiration-time"), a4);
  return result;
}

- (double)_playbackStartTimeForStreamingKeyID:(int64_t)a3 streamingKeyDictionaries:(id)a4
{
  double result;

  -[SSVSecureKeyDeliveryRequestOperation _timeIntervalForStreamingKeyID:responseKey:streamingKeyDictionaries:](self, "_timeIntervalForStreamingKeyID:responseKey:streamingKeyDictionaries:", a3, CFSTR("playback-start-time"), a4);
  return result;
}

- (void)_sendResponseBlockWithError:(id)a3
{
  id v4;
  NSObject *accessQueue;
  uint64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__59;
  v12 = __Block_byref_object_dispose__60;
  v13 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SSVSecureKeyDeliveryRequestOperation__sendResponseBlockWithError___block_invoke;
  v7[3] = &unk_1E47B8680;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_barrier_sync(accessQueue, v7);
  v6 = v9[5];
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  _Block_object_dispose(&v8, 8);

}

void __68__SSVSecureKeyDeliveryRequestOperation__sendResponseBlockWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = 0;

}

- (id)_streamingKeyDictionaryForID:(int64_t)a3 URI:(id)a4 serverPlaybackContextData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", v11, CFSTR("id"), 0);

  if (v8)
    objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("uri"));
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("spc"));

  }
  -[SSVSecureKeyDeliveryRequestOperation rentalId](self, "rentalId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SSVSecureKeyDeliveryRequestOperation rentalId](self, "rentalId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("rental-id"));

  }
  if (-[SSVSecureKeyDeliveryRequestOperation skippedRentalCheckout](self, "skippedRentalCheckout"))
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("skipped-rental-checkout"));
  if (-[SSVSecureKeyDeliveryRequestOperation shouldIncludeGUID](self, "shouldIncludeGUID"))
  {
    +[SSDevice currentDevice](SSDevice, "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueDeviceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("guid"));

  }
  v18 = -[SSVSecureKeyDeliveryRequestOperation leaseAction](self, "leaseAction") - 1;
  if (v18 <= 2)
    objc_msgSend(v12, "setObject:forKey:", off_1E47B98E8[v18], CFSTR("lease-action"));
  if (-[SSVSecureKeyDeliveryRequestOperation offline](self, "offline"))
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("offline"));

  return v12;
}

- (id)_streamingRequestDictionaryWithStreamingKeyDictionaries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", &unk_1E481E690, CFSTR("version"), 0);
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("streaming-keys"));
  v7 = CFSTR("fairplay-streaming-request");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_timeIntervalForStreamingKeyID:(int64_t)a3 responseKey:(id)a4 streamingKeyDictionaries:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = a5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  v9 = 0.0;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "objectForKey:", CFSTR("id"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v15 = objc_msgSend(v14, "longLongValue");
            if (v6)
            {
              if (v15 == a3)
              {
                objc_msgSend(v13, "objectForKey:", v6);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = 0.0;
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v16, "doubleValue");
                  v9 = v17 / 1000.0;
                }

                goto LABEL_17;
              }
            }
          }

        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_17:

  return v9;
}

- (NSNumber)rentalId
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setRentalId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 328);
}

- (BOOL)skippedRentalCheckout
{
  return self->_skippedRentalCheckout;
}

- (void)setSkippedRentalCheckout:(BOOL)a3
{
  self->_skippedRentalCheckout = a3;
}

- (int64_t)leaseAction
{
  return self->_leaseAction;
}

- (void)setLeaseAction:(int64_t)a3
{
  self->_leaseAction = a3;
}

- (BOOL)offline
{
  return self->_offline;
}

- (void)setOffline:(BOOL)a3
{
  self->_offline = a3;
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (double)playbackStartTime
{
  return self->_playbackStartTime;
}

- (SSVSecureKeyDeliveryRequestOperationDelegate)serverPlaybackContextDataDelegate
{
  return (SSVSecureKeyDeliveryRequestOperationDelegate *)objc_loadWeakRetained((id *)&self->_serverPlaybackContextDataDelegate);
}

- (void)setServerPlaybackContextDataDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_serverPlaybackContextDataDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serverPlaybackContextDataDelegate);
  objc_storeStrong((id *)&self->_rentalId, 0);
  objc_storeStrong((id *)&self->_serverPlaybackContextData, 0);
  objc_storeStrong((id *)&self->_persistentContentKeyContext, 0);
  objc_storeStrong((id *)&self->_URLBagDictionary, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_resourceLoadingRequest, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
