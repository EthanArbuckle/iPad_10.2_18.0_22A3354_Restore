NSString *__cdecl sub_100003EB0(id a1, NSSortDescriptor *a2)
{
  return -[NSSortDescriptor key](a2, "key");
}

void sub_10000455C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004574(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTRecencyUtil upNextForPodcastUuid:excludeExplicit:ctx:](MTRecencyUtil, "upNextForPodcastUuid:excludeExplicit:ctx:", v2, 0, *(_QWORD *)(a1 + 40)));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextEpisodeUuid"));
  v6 = _MTLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));
    objc_msgSend(v3, "modifiedDate");
    v16 = 138543874;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 2050;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "UpNext result from update cursor position for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", (uint8_t *)&v16, 0x20u);

  }
  v11 = _MTLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));
    v16 = 138543618;
    v17 = v5;
    v18 = 2114;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", (uint8_t *)&v16, 0x16u);

  }
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "episodeForUuid:", v4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "episodeForUuid:", v5));
    if (objc_msgSend(v15, "listenNowEpisode"))
    {
      objc_msgSend(v15, "setListenNowEpisode:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    if (v14 && (objc_msgSend(v14, "listenNowEpisode") & 1) == 0)
    {
      objc_msgSend(v14, "setListenNowEpisode:", 1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(v3, "modifiedDate");
      objc_msgSend(*(id *)(a1 + 32), "setModifiedDate:");
    }

  }
  if (*(_BYTE *)(a1 + 56) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "saveInCurrentBlock");

}

void sub_100004924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000493C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000494C(uint64_t a1)
{

}

void sub_100004954(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "podcastForFeedUrl:", *(_QWORD *)(a1 + 40)));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100004D1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100004D34(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:](MTEpisode, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:", v3));
  objc_msgSend(v2, "setPredicate:", v4);

  objc_msgSend(v2, "setFetchLimit:", 1);
  v5 = *(void **)(a1 + 40);
  v8 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v2, &v8));
  v7 = v8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "count") != 0;

  objc_msgSend(v7, "logAndThrow:", 0);
}

void sub_100004F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004F5C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_fetchRequestForDistinctSeasons"));
  v3 = *(void **)(a1 + 40);
  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v2, &v9));
  v5 = v9;
  objc_msgSend(v5, "logAndThrow:", 0);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", kEpisodeSeasonNumber));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void sub_100005124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000513C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeType:](MTEpisode, "predicateForEpisodeType:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSeasonNumberWithNoEpisodeNumber:](MTEpisode, "predicateForSeasonNumberWithNoEpisodeNumber:", *(_QWORD *)(a1 + 64)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "AND:", v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AND:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForPubDateAscending:](MTEpisode, "sortDescriptorsForPubDateAscending:", 0));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", kMTEpisodeEntityName, v5, v6, 0, 1));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

uint64_t sub_1000054D0()
{
  return 0;
}

uint64_t sub_1000054D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v4 = sub_100005C94(&qword_1000192F8);
  v5 = swift_allocObject(v4, 48, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100011CB0;
  *(_QWORD *)(v5 + 32) = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  *(_QWORD *)(v5 + 40) = v6;
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(a2 + 16))(&v10, a1, a2);
  if (v11)
  {
    sub_100005E2C(&v10, (uint64_t)v12);
    v7 = v13;
    v8 = v14;
    sub_100005E44(v12, v13);
    *(_QWORD *)&v10 = sub_1000054D8(v7, v8);
    sub_100005E68(v5);
    v5 = v10;
    sub_100005FBC(v12);
  }
  else
  {
    sub_100005DEC((uint64_t)&v10);
  }
  return v5;
}

void sub_1000055BC(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  NSString v24;
  uint64_t v25;
  uint64_t v26;
  NSURL *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  _BYTE *v32;
  id *v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id *v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  _BYTE v60[4];
  int v61;
  id *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;

  v3 = v2;
  v61 = a2;
  v5 = type metadata accessor for CLSContextMetadata(0);
  v6 = __chkstk_darwin(v5);
  v8 = &v60[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  v62 = (id *)&v60[-v9];
  v10 = type metadata accessor for Logger(0);
  v63 = *(_QWORD *)(v10 - 8);
  v64 = v10;
  v11 = __chkstk_darwin(v10);
  v13 = (id *)&v60[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  v15 = &v60[-v14];
  v16 = sub_100005C94((uint64_t *)&unk_100019520);
  __chkstk_darwin(v16);
  v18 = &v60[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = objc_msgSend(a1, "identifier");
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
  v22 = v21;

  if (v20 == *(_QWORD *)(v3 + 8) && v22 == *(_QWORD *)(v3 + 16))
  {
    swift_bridgeObjectRelease(v22);
  }
  else
  {
    v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v22);
    swift_bridgeObjectRelease(v22);
    if ((v23 & 1) == 0)
    {
      v47 = sub_100005CD4();
      v48 = v13;
      static OS_os_log.classKit.getter(v47);
      sub_100005D10(v3, (uint64_t)v8);
      v49 = a1;
      v50 = Logger.logObject.getter();
      v51 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = swift_slowAlloc(22, -1);
        v53 = swift_slowAlloc(64, -1);
        v66 = v53;
        *(_DWORD *)v52 = 136315394;
        v62 = v48;
        v54 = objc_msgSend(v49, "identifier");
        v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
        v57 = v56;

        v65 = (id)sub_10000716C(v55, v57, &v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66);

        swift_bridgeObjectRelease(v57);
        *(_WORD *)(v52 + 12) = 2080;
        v58 = *((_QWORD *)v8 + 1);
        v59 = *((_QWORD *)v8 + 2);
        swift_bridgeObjectRetain(v59);
        v65 = (id)sub_10000716C(v58, v59, &v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66);
        swift_bridgeObjectRelease(v59);
        sub_100005D54((uint64_t)v8);
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "Unable to update context identifier from %s to %s", (uint8_t *)v52, 0x16u);
        swift_arrayDestroy(v53, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v53, -1, -1);
        swift_slowDealloc(v52, -1, -1);

        (*(void (**)(id *, uint64_t))(v63 + 8))(v62, v64);
      }
      else
      {

        sub_100005D54((uint64_t)v8);
        (*(void (**)(id *, uint64_t))(v63 + 8))(v13, v64);
      }
      return;
    }
  }
  if (objc_msgSend(a1, "type") == *(id *)v3)
  {
    v24 = String._bridgeToObjectiveC()();
    objc_msgSend(a1, "setTitle:", v24);

    objc_msgSend(a1, "setAssignable:", *(unsigned __int8 *)(v3 + 40));
    objc_msgSend(a1, "setDisplayOrder:", *(_QWORD *)(v3 + 48));
    sub_100005DA4(v3 + *(int *)(v5 + 36), (uint64_t)v18);
    v25 = type metadata accessor for URL(0);
    v26 = *(_QWORD *)(v25 - 8);
    v28 = 0;
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v26 + 48))(v18, 1, v25) != 1)
    {
      URL._bridgeToObjectiveC()(v27);
      v28 = v29;
      (*(void (**)(_BYTE *, uint64_t))(v26 + 8))(v18, v25);
    }
    objc_msgSend(a1, "setUniversalLinkURL:", v28);

    if ((v61 & 1) != 0)
    {
      v30 = (void *)(*(uint64_t (**)(void))(v3 + *(int *)(v5 + 40)))();
      objc_msgSend(a1, "setThumbnail:", v30);

    }
  }
  else
  {
    v31 = sub_100005CD4();
    v32 = v15;
    static OS_os_log.classKit.getter(v31);
    v33 = v62;
    sub_100005D10(v3, (uint64_t)v62);
    v34 = a1;
    v35 = Logger.logObject.getter();
    v36 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = swift_slowAlloc(22, -1);
      v38 = swift_slowAlloc(64, -1);
      v66 = v38;
      *(_DWORD *)v37 = 136315394;
      v65 = objc_msgSend(v34, "type");
      type metadata accessor for CLSContextType(0);
      v40 = v39;
      v41 = String.init<A>(describing:)(&v65, v39);
      v43 = v42;
      v65 = (id)sub_10000716C(v41, v42, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66);

      swift_bridgeObjectRelease(v43);
      *(_WORD *)(v37 + 12) = 2080;
      v65 = *v33;
      v44 = String.init<A>(describing:)(&v65, v40);
      v46 = v45;
      v65 = (id)sub_10000716C(v44, v45, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66);
      swift_bridgeObjectRelease(v46);
      sub_100005D54((uint64_t)v33);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Unable to update context type from %s to %s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy(v38, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v37, -1, -1);
    }
    else
    {

      sub_100005D54((uint64_t)v33);
    }

    (*(void (**)(_BYTE *, uint64_t))(v63 + 8))(v32, v64);
  }
}

_QWORD *sub_100005C14@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100005C24(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100005C30@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t type metadata accessor for CLSContextMetadata(uint64_t a1)
{
  uint64_t result;

  result = qword_100019370;
  if (!qword_100019370)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CLSContextMetadata);
  return result;
}

uint64_t sub_100005C94(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005CD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019510;
  if (!qword_100019510)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100019510);
  }
  return result;
}

uint64_t sub_100005D10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CLSContextMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005D54(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CLSContextMetadata(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for CLSContextType(uint64_t a1)
{
  sub_1000069D8(a1, &qword_100019310, (uint64_t)&unk_100014940);
}

uint64_t sub_100005DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005C94((uint64_t *)&unk_100019520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005DEC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005C94(&qword_100019300);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005E2C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_QWORD *sub_100005E44(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100005E68(uint64_t a1)
{
  char **v1;
  unint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;
  char v17;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_1000089F4(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[16 * v9 + 32];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy(v10);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = *((_QWORD *)v3 + 2);
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    *((_QWORD *)v3 + 2) = v14;
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v17 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v17, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100005FBC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

__n128 sub_100005FDC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005FEC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_10000600C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_1000069D8(a1, &qword_100019308, (uint64_t)&unk_100014918);
}

_QWORD *sub_100006048(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(const void *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v17);
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v8 = a2[2];
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 24) = v7;
    v9 = a2[4];
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    *(_QWORD *)(a1 + 48) = a2[6];
    v10 = a3[9];
    v11 = (void *)(a1 + v10);
    v12 = (char *)a2 + v10;
    *(_QWORD *)(a1 + 32) = v9;
    v13 = type metadata accessor for URL(0);
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    if (v15(v12, 1, v13))
    {
      v16 = sub_100005C94((uint64_t *)&unk_100019520);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    v18 = a3[10];
    v19 = a3[11];
    v20 = (_QWORD *)((char *)v4 + v18);
    v21 = (uint64_t *)((char *)a2 + v18);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    *(_QWORD *)((char *)v4 + v19) = *(uint64_t *)((char *)a2 + v19);
    v23 = a3[12];
    v24 = *(uint64_t *)((char *)a2 + v23);
    *(_QWORD *)((char *)v4 + v23) = v24;
    swift_retain(v22);
    swift_bridgeObjectRetain(v24);
  }
  return v4;
}

uint64_t sub_1000061AC(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
  v4 = a1 + a2[9];
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_release(*(_QWORD *)(a1 + a2[10] + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[12]));
}

uint64_t sub_100006244(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v7 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v6;
  v8 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v9 = a3[9];
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  *(_QWORD *)(a1 + 32) = v8;
  v12 = type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  if (v14(v11, 1, v12))
  {
    v15 = sub_100005C94((uint64_t *)&unk_100019520);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v16 = a3[10];
  v17 = a3[11];
  v18 = (_QWORD *)(a1 + v16);
  v19 = (_QWORD *)(a2 + v16);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  v21 = a3[12];
  v22 = *(_QWORD *)(a2 + v21);
  *(_QWORD *)(a1 + v21) = v22;
  swift_retain(v20);
  swift_bridgeObjectRetain(v22);
  return a1;
}

uint64_t sub_10000637C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v10 = a3[9];
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = type metadata accessor for URL(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = sub_100005C94((uint64_t *)&unk_100019520);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  v19 = a3[10];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  v23 = v20[1];
  *v20 = *v21;
  v20[1] = v22;
  swift_retain(v22);
  swift_release(v23);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v24 = a3[12];
  v25 = *(_QWORD *)(a1 + v24);
  v26 = *(_QWORD *)(a2 + v24);
  *(_QWORD *)(a1 + v24) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v25);
  return a1;
}

uint64_t sub_100006530(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v6 = a3[9];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = sub_100005C94((uint64_t *)&unk_100019520);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_10000663C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v6);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease(v8);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v9 = a3[9];
  v10 = (void *)(a1 + v9);
  v11 = (void *)(a2 + v9);
  v12 = type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = sub_100005C94((uint64_t *)&unk_100019520);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  v18 = a3[10];
  v19 = *(_QWORD *)(a1 + v18 + 8);
  *(_OWORD *)(a1 + v18) = *(_OWORD *)(a2 + v18);
  swift_release(v19);
  v20 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v21 = *(_QWORD *)(a1 + v20);
  *(_QWORD *)(a1 + v20) = *(_QWORD *)(a2 + v20);
  swift_bridgeObjectRelease(v21);
  return a1;
}

uint64_t sub_1000067B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000067C4);
}

uint64_t sub_1000067C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_100005C94((uint64_t *)&unk_100019520);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_100006844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006850);
}

uint64_t sub_100006850(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = sub_100005C94((uint64_t *)&unk_100019520);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

void sub_1000068C8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[9];

  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[1] = &unk_100011D48;
  v4[2] = &unk_100011D48;
  v4[3] = &unk_100011D60;
  v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
  sub_100006970(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(v2 - 8) + 64;
    v4[6] = (char *)&value witness table for () + 64;
    v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[8] = &unk_100011D78;
    swift_initStructMetadata(a1, 256, 9, v4, a1 + 16);
  }
}

void sub_100006970(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100019380)
  {
    v2 = type metadata accessor for URL(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100019380);
  }
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_1000069D8(a1, &qword_1000193D0, (uint64_t)&unk_100014960);
}

void sub_1000069D8(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void sub_100006A1C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  id v10;
  void *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[5];
  _QWORD *v18;

  sub_100007060(0, &qword_1000193D8, NSPredicate_ptr);
  v5 = sub_100005C94(&qword_1000193E0);
  v6 = swift_allocObject(v5, 112, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100011DF0;
  static String._unconditionallyBridgeFromObjectiveC(_:)(CLSPredicateKeyPathParent);
  v8 = v7;
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  *(_QWORD *)(v6 + 56) = sub_100007060(0, &qword_1000193E8, NSString_ptr);
  *(_QWORD *)(v6 + 64) = sub_100006FD0(&qword_1000193F0, &qword_1000193E8, NSString_ptr);
  *(_QWORD *)(v6 + 32) = v9;
  *(_QWORD *)(v6 + 96) = sub_100007060(0, &qword_1000193F8, CLSContext_ptr);
  *(_QWORD *)(v6 + 104) = sub_100006FD0((unint64_t *)&qword_100019530, &qword_1000193F8, CLSContext_ptr);
  *(_QWORD *)(v6 + 72) = v2;
  v10 = v2;
  v11 = (void *)NSPredicate.init(format:_:)(0x4025203D204B25, 0xE700000000000000, v6);
  v12 = objc_msgSend((id)objc_opt_self(CLSDataStore), "shared");
  v13 = (_QWORD *)swift_allocObject(&unk_1000149B0, 40, 7);
  v13[2] = v11;
  v13[3] = a1;
  v13[4] = a2;
  v17[4] = sub_10000703C;
  v18 = v13;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_100006F38;
  v17[3] = &unk_1000149C8;
  v14 = _Block_copy(v17);
  v15 = v18;
  v16 = v11;
  swift_retain(a2);
  swift_release(v15);
  objc_msgSend(v12, "contextsMatchingPredicate:completion:", v16, v14);
  _Block_release(v14);

}

uint64_t sub_100006C34(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  os_log_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  os_log_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(_QWORD);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v8 = type metadata accessor for Logger(0);
  __chkstk_darwin();
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v39 = v9;
    sub_100007060(0, (unint64_t *)&qword_100019510, OS_os_log_ptr);
    v12 = swift_errorRetain(a2);
    static OS_os_log.classKit.getter(v12);
    swift_errorRetain(a2);
    v13 = a3;
    swift_errorRetain(a2);
    v14 = v13;
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.error.getter();
    v17 = v16;
    if (os_log_type_enabled(v15, v16))
    {
      v18 = swift_slowAlloc(22, -1);
      v37 = a1;
      v19 = v18;
      v20 = (_QWORD *)swift_slowAlloc(8, -1);
      v35 = swift_slowAlloc(32, -1);
      v40 = (uint64_t)v14;
      v41 = v35;
      *(_DWORD *)v19 = 138412546;
      v38 = a4;
      v36 = v8;
      v34 = v17;
      v21 = v14;
      v33 = v15;
      v22 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41);
      *v20 = v14;

      *(_WORD *)(v19 + 12) = 2080;
      v40 = a2;
      swift_errorRetain(a2);
      v23 = sub_100005C94(&qword_100019500);
      v24 = String.init<A>(describing:)(&v40, v23);
      v26 = v25;
      v40 = sub_10000716C(v24, v25, &v41);
      a4 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41);
      swift_bridgeObjectRelease(v26);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      v27 = v33;
      _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v34, "Error loading contexts for predicate %@ - %s", (uint8_t *)v19, 0x16u);
      v28 = sub_100005C94(&qword_100019400);
      swift_arrayDestroy(v20, 1, v28);
      swift_slowDealloc(v20, -1, -1);
      v29 = v35;
      swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      v30 = v19;
      a1 = v37;
      swift_slowDealloc(v30, -1, -1);

      swift_errorRelease(a2);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v36);
    }
    else
    {
      swift_errorRelease(a2);

      swift_errorRelease(a2);
      swift_errorRelease(a2);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v8);
    }
  }
  return a4(a1);
}

void sub_100006F38(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = sub_100007060(0, &qword_1000193F8, CLSContext_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v7);
  swift_retain(v5);
  v9 = a3;
  v6(v8, a3);
  swift_release(v5);
  swift_bridgeObjectRelease(v8);

}

uint64_t sub_100006FD0(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_100007060(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007010()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000703C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100006C34(a1, a2, *(void **)(v2 + 16), *(uint64_t (**)(_QWORD))(v2 + 24));
}

uint64_t sub_100007048(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007058(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100007060(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100007098(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000070A8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1000070DC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000070FC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v6 = a4();
  v8 = v7;
  v9 = sub_10000716C(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_10000716C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000723C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100007834((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100007834((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100005FBC(v12);
  return v7;
}

uint64_t sub_10000723C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1000073F4(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_1000073F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100007488(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000076D8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000076D8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100007488(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_1000075FC(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_1000075FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100005C94(&qword_100019408);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100007660(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

uint64_t sub_1000076D8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100005C94(&qword_100019408);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

_BYTE **sub_100007824(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_100007834(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1000078EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = _convertErrorToNSError(_:)();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_100007938(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

uint64_t sub_10000798C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CEF8(a1);
}

uint64_t sub_1000079AC(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(a1, "setFetchBatchSize:", 10);
  v17 = 0;
  v18 = 0;
  v7 = (_QWORD *)swift_allocObject(&unk_100014AA0, 64, 7);
  v7[2] = &v17;
  v7[3] = v3;
  v7[4] = a1;
  v7[5] = a2;
  v7[6] = a3;
  v7[7] = &v18;
  v8 = swift_allocObject(&unk_100014AC8, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_10000B818;
  *(_QWORD *)(v8 + 24) = v7;
  v15[4] = sub_10000B83C;
  v16 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10000891C;
  v15[3] = &unk_100014AE0;
  v9 = _Block_copy(v15);
  v10 = v16;
  v11 = v3;
  v12 = a1;
  swift_retain(a3);
  swift_retain(v8);
  swift_release(v10);
  objc_msgSend(v11, "performBlockAndWait:", v9);
  _Block_release(v9);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation(v8, "", 100, 170, 24, 1);
  result = swift_release(v8);
  if ((v11 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v18)
    {
      v14 = swift_errorRetain(v18);
      swift_willThrow(v14);
      swift_bridgeObjectRelease(v17);
      swift_errorRelease(v18);
    }
    else
    {
      a3 = v17;
    }
    swift_release(v7);
    return a3;
  }
  return result;
}

uint64_t sub_100007B60(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(a1, "setFetchBatchSize:", 10);
  v17 = 0;
  v18 = 0;
  v7 = (_QWORD *)swift_allocObject(&unk_100014BB8, 64, 7);
  v7[2] = &v17;
  v7[3] = v3;
  v7[4] = a1;
  v7[5] = a2;
  v7[6] = a3;
  v7[7] = &v18;
  v8 = swift_allocObject(&unk_100014BE0, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_10000BF94;
  *(_QWORD *)(v8 + 24) = v7;
  v15[4] = sub_10000C0F8;
  v16 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10000891C;
  v15[3] = &unk_100014BF8;
  v9 = _Block_copy(v15);
  v10 = v16;
  v11 = v3;
  v12 = a1;
  swift_retain(a3);
  swift_retain(v8);
  swift_release(v10);
  objc_msgSend(v11, "performBlockAndWait:", v9);
  _Block_release(v9);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation(v8, "", 100, 170, 24, 1);
  result = swift_release(v8);
  if ((v11 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v18)
    {
      v14 = swift_errorRetain(v18);
      swift_willThrow(v14);
      swift_bridgeObjectRelease(v17);
      swift_errorRelease(v18);
    }
    else
    {
      a3 = v17;
    }
    swift_release(v7);
    return a3;
  }
  return result;
}

uint64_t sub_100007D14(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(a1, "setFetchBatchSize:", 10);
  v17 = 0;
  v18 = 0;
  v7 = (_QWORD *)swift_allocObject(&unk_100014B40, 64, 7);
  v7[2] = &v17;
  v7[3] = v3;
  v7[4] = a1;
  v7[5] = a2;
  v7[6] = a3;
  v7[7] = &v18;
  v8 = swift_allocObject(&unk_100014B68, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_10000BA70;
  *(_QWORD *)(v8 + 24) = v7;
  v15[4] = sub_10000C0F8;
  v16 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10000891C;
  v15[3] = &unk_100014B80;
  v9 = _Block_copy(v15);
  v10 = v16;
  v11 = v3;
  v12 = a1;
  swift_retain(a3);
  swift_retain(v8);
  swift_release(v10);
  objc_msgSend(v11, "performBlockAndWait:", v9);
  _Block_release(v9);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation(v8, "", 100, 170, 24, 1);
  result = swift_release(v8);
  if ((v11 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v18)
    {
      v14 = swift_errorRetain(v18);
      swift_willThrow(v14);
      swift_bridgeObjectRelease(v17);
      swift_errorRelease(v18);
    }
    else
    {
      a3 = v17;
    }
    swift_release(v7);
    return a3;
  }
  return result;
}

void sub_100007EC8(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(a1, "uuid");
  if (v3)
  {
    v4 = v3;
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

uint64_t sub_100007F28@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C120(a1);
}

uint64_t sub_100007F48(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSString v32;
  NSString v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  NSURL *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;

  v51 = a3;
  v5 = sub_100005C94((uint64_t *)&unk_100019520);
  result = __chkstk_darwin(v5);
  v52 = (uint64_t)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = *(_QWORD *)(a2 + 16);
  if (v56)
  {
    if ((unint64_t)a1 >> 62)
    {
LABEL_28:
      if (a1 < 0)
        v48 = a1;
      else
        v48 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a2);
      swift_bridgeObjectRetain(a1);
      v59 = _CocoaArrayWrapper.endIndex.getter(v48);
      swift_bridgeObjectRelease(a1);
    }
    else
    {
      v59 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(a2);
    }
    v8 = type metadata accessor for CLSContextMetadata(0);
    v9 = 0;
    v49 = a2;
    v50 = v8;
    v10 = *(_QWORD *)(v8 - 8);
    v55 = a2 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    v58 = a1 & 0xC000000000000001;
    v54 = *(_QWORD *)(v10 + 72);
    v53 = xmmword_100011CB0;
    do
    {
      v16 = (uint64_t *)(v55 + v54 * v9);
      if (v59)
      {
        v57 = v9;
        v18 = v16[1];
        v17 = v16[2];
        v19 = a1;
        swift_bridgeObjectRetain(a1);
        a1 = 4;
        while (1)
        {
          v20 = v58
              ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a1 - 4, v19)
              : *(id *)(v19 + 8 * a1);
          v21 = v20;
          a2 = a1 - 3;
          if (__OFADD__(a1 - 4, 1))
            break;
          v22 = objc_msgSend(v20, "identifier", v49);
          v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
          v25 = v24;

          if (v23 == v18 && v25 == v17)
          {
            a1 = v19;
            swift_bridgeObjectRelease(v19);
LABEL_24:
            swift_bridgeObjectRelease(v17);
            sub_1000055BC(v21, 0);
            v44 = static os_log_type_t.debug.getter();
            v45 = sub_100005C94(&qword_1000193E0);
            v46 = swift_allocObject(v45, 72, 7);
            *(_OWORD *)(v46 + 16) = v53;
            *(_QWORD *)(v46 + 56) = sub_100007060(0, &qword_1000193F8, CLSContext_ptr);
            *(_QWORD *)(v46 + 64) = sub_10000B778();
            *(_QWORD *)(v46 + 32) = v21;
            sub_100007060(0, (unint64_t *)&qword_100019510, OS_os_log_ptr);
            v47 = v21;
            v14 = (id)static OS_os_log.default.getter();
            os_log(_:dso:log:_:_:)(v44, &_mh_execute_header, v14, "Updated context - %@", 20, 2, v46);

            swift_bridgeObjectRelease(v46);
            v9 = v57;
            goto LABEL_6;
          }
          v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v25);
          swift_bridgeObjectRelease(v25);
          if ((v27 & 1) != 0)
          {
            a1 = v19;
            v17 = v19;
            goto LABEL_24;
          }

          ++a1;
          if (a2 == v59)
          {
            a1 = v19;
            swift_bridgeObjectRelease(v19);
            v9 = v57;
            goto LABEL_20;
          }
        }
        __break(1u);
        goto LABEL_28;
      }
LABEL_20:
      v28 = *v16;
      v29 = v16[2];
      v30 = v16[4];
      v31 = objc_allocWithZone((Class)CLSContext);
      swift_bridgeObjectRetain(v29);
      swift_bridgeObjectRetain(v30);
      v32 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v29);
      v33 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v30);
      v34 = objc_msgSend(v31, "initWithType:identifier:title:", v28, v32, v33);

      objc_msgSend(v34, "setAssignable:", *((unsigned __int8 *)v16 + 40));
      objc_msgSend(v34, "setDisplayOrder:", v16[6]);
      v35 = (uint64_t)v16 + *(int *)(v50 + 36);
      v36 = v52;
      sub_100005DA4(v35, v52);
      v37 = type metadata accessor for URL(0);
      v38 = *(_QWORD *)(v37 - 8);
      v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37);
      v41 = 0;
      if (v39 != 1)
      {
        v42 = v52;
        URL._bridgeToObjectiveC()(v40);
        v41 = v43;
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v42, v37);
      }
      objc_msgSend(v34, "setUniversalLinkURL:", v41, v49);

      v11 = static os_log_type_t.debug.getter();
      v12 = sub_100005C94(&qword_1000193E0);
      v13 = swift_allocObject(v12, 72, 7);
      *(_OWORD *)(v13 + 16) = v53;
      *(_QWORD *)(v13 + 56) = sub_100007060(0, &qword_1000193F8, CLSContext_ptr);
      *(_QWORD *)(v13 + 64) = sub_10000B778();
      *(_QWORD *)(v13 + 32) = v34;
      sub_100007060(0, (unint64_t *)&qword_100019510, OS_os_log_ptr);
      v14 = v34;
      v15 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)(v11, &_mh_execute_header, v15, "Built context - %@", 18, 2, v13);
      swift_bridgeObjectRelease(v13);

      objc_msgSend(v51, "addChildContext:", v14);
LABEL_6:

      ++v9;
    }
    while (v9 != v56);
    return swift_bridgeObjectRelease(v49);
  }
  return result;
}

Swift::Int sub_100008450(unint64_t *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  Swift::Int result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for CLSContextMetadata(0) - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v3 = sub_10000A900(v3);
  v4 = *(_QWORD *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_100008E04(v6);
  *a1 = v3;
  return result;
}

_QWORD *sub_1000084D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;

  v2 = type metadata accessor for CLSContextMetadata(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005C94(&qword_100019568);
  v7 = __chkstk_darwin(v6);
  v30 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v11 = (uint64_t *)((char *)&v26 - v10);
  __chkstk_darwin(v9);
  v13 = (uint64_t *)((char *)&v26 - v12);
  v31 = _swiftEmptyArrayStorage;
  sub_10000A704(0, 0, 0);
  v14 = v31;
  v15 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain(a1);
  v29 = v15;
  v26 = a1;
  if (v15)
  {
    v16 = 0;
    v17 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v27 = *(_QWORD *)(v3 + 72);
    v28 = v17;
    v18 = a1 + v17;
    do
    {
      v19 = (uint64_t)&v30[*(int *)(v6 + 48)];
      sub_100005D10(v18, v19);
      v20 = (uint64_t)v11 + *(int *)(v6 + 48);
      *v11 = v16;
      sub_10000B974(v19, v20);
      sub_10000B9E8((uint64_t)v11, (uint64_t)v13);
      v21 = *v13;
      sub_100005D10((uint64_t)v13 + *(int *)(v6 + 48), (uint64_t)v5);
      *((_QWORD *)v5 + 6) = v21;
      sub_10000BA30((uint64_t)v13, &qword_100019568);
      if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
      {
        sub_10000A704(0, v14[2] + 1, 1);
        v14 = v31;
      }
      v23 = v14[2];
      v22 = v14[3];
      if (v23 >= v22 >> 1)
      {
        sub_10000A704(v22 > 1, v23 + 1, 1);
        v14 = v31;
      }
      ++v16;
      v14[2] = v23 + 1;
      v24 = v27;
      sub_10000B974((uint64_t)v5, (uint64_t)v14 + v28 + v23 * v27);
      v18 += v24;
    }
    while (v29 != v16);
  }
  swift_bridgeObjectRelease(v26);
  return v14;
}

id sub_100008754()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextRequestHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ContextRequestHandler()
{
  return objc_opt_self(_TtC25PodcastsClassKitExtension21ContextRequestHandler);
}

id sub_1000087A4(char **a1, void *a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, id))
{
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;

  v8 = sub_100007060(0, &qword_100019540, MTPodcast_ptr);
  v9 = NSManagedObjectContext.fetch<A>(_:)(a3, v8);
  v10 = sub_10000BABC(v9, a4);
  swift_bridgeObjectRelease(v9);
  v11 = *a1;
  *a1 = v10;
  swift_bridgeObjectRelease(v11);
  return objc_msgSend(a2, "reset");
}

id sub_100008864(uint64_t *a1, void *a2, uint64_t a3, void (*a4)(id), uint64_t a5, uint64_t a6, unint64_t *a7, _QWORD *a8)
{
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v12 = sub_100007060(0, a7, a8);
  v13 = NSManagedObjectContext.fetch<A>(_:)(a3, v12);
  v14 = sub_10000BC84(v13, a4);
  swift_bridgeObjectRelease(v13);
  v15 = *a1;
  *a1 = (uint64_t)v14;
  swift_bridgeObjectRelease(v15);
  return objc_msgSend(a2, "reset");
}

uint64_t sub_10000891C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_10000893C()
{
  return 1;
}

Swift::Int sub_100008944()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_100008984()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_1000089A8(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

char *sub_1000089F4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100005C94(&qword_1000192F8);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000A934(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100008B00(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_100008B14(a1, a2, a3, a4, &qword_100019560, (uint64_t (*)(_QWORD))&type metadata accessor for URLQueryItem);
}

uint64_t sub_100008B14(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_100005C94(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  v19 = j__malloc_size(v18);
  if (!v15)
    goto LABEL_29;
  if (v19 - v17 == 0x8000000000000000 && v15 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  v21 = a6(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v24 = (unint64_t)v18 + v23;
  if ((a1 & 1) != 0)
  {
    v25 = a4 + v23;
    if ((unint64_t)v18 < a4 || v24 >= v25 + *(_QWORD *)(v22 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v23, v25, v11, v21);
    }
    else if (v18 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v23);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000B85C(0, v11, v24, a4, a6);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

unsigned __int8 *sub_100008D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 *v12;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v15 = a2;
  swift_bridgeObjectRetain(a2);
  v4 = String.init<A>(_:)(&v14, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v6 = v4;
  v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v9 = HIBYTE(v7) & 0xF;
    v14 = v6;
    v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  v6 = sub_10000A248(v4, v5);
  v11 = v10;
  swift_bridgeObjectRelease(v7);
  v7 = v11;
  if ((v11 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v6, v7);
  }
LABEL_7:
  v12 = sub_100009FCC(v8, v9, a3);
  swift_bridgeObjectRelease(v7);
  return v12;
}

Swift::Int sub_100008E04(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  Swift::Int result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  Swift::Int v31;
  uint64_t v32;
  Swift::Int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  Swift::Int v46;
  Swift::Int v47;
  Swift::Int v48;
  uint64_t v49;
  uint64_t v50;
  Swift::Int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v63;
  unint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  BOOL v89;
  uint64_t v90;
  char v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  unint64_t v120;
  char *v121;
  _QWORD *v122;
  uint64_t v123;
  _QWORD *v124;
  Swift::Int v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  Swift::Int v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;

  v2 = v1;
  v137 = type metadata accessor for CLSContextMetadata(0);
  v132 = *(_QWORD *)(v137 - 8);
  v4 = __chkstk_darwin(v137);
  v129 = (uint64_t)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v138 = (uint64_t)&v123 - v7;
  v8 = __chkstk_darwin(v6);
  v135 = (uint64_t)&v123 - v9;
  __chkstk_darwin(v8);
  v134 = (uint64_t)&v123 - v10;
  v11 = a1[1];
  result = _minimumMergeRunLength(_:)(v11);
  if (result >= v11)
  {
    if (v11 < 0)
      goto LABEL_141;
    if (v11)
      return sub_10000976C(0, v11, 1, a1);
    return result;
  }
  if (v11 >= 0)
    v13 = v11;
  else
    v13 = v11 + 1;
  if (v11 < -1)
    goto LABEL_149;
  v125 = result;
  if (v11 < 2)
  {
    v17 = (char *)&_swiftEmptyArrayStorage;
    v131 = (unint64_t)&_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v132 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v132 + 80));
    v124 = &_swiftEmptyArrayStorage;
    if (v11 != 1)
    {
      v19 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
LABEL_104:
      if (v19 >= 2)
      {
        v115 = *a1;
        do
        {
          v116 = v19 - 2;
          if (v19 < 2)
            goto LABEL_136;
          if (!v115)
            goto LABEL_148;
          v109 = v17;
          v117 = *(_QWORD *)&v17[16 * v116 + 32];
          v118 = *(_QWORD *)&v17[16 * v19 + 24];
          sub_10000997C(v115 + *(_QWORD *)(v132 + 72) * v117, v115 + *(_QWORD *)(v132 + 72) * *(_QWORD *)&v17[16 * v19 + 16], v115 + *(_QWORD *)(v132 + 72) * v118, v131);
          if (v2)
            goto LABEL_116;
          if (v118 < v117)
            goto LABEL_137;
          if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0)
            v109 = sub_100009FB8((uint64_t)v17);
          if (v116 >= *((_QWORD *)v109 + 2))
            goto LABEL_138;
          v119 = &v109[16 * v116 + 32];
          *(_QWORD *)v119 = v117;
          *((_QWORD *)v119 + 1) = v118;
          v120 = *((_QWORD *)v109 + 2);
          if (v19 > v120)
            goto LABEL_139;
          memmove(&v109[16 * v19 + 16], &v109[16 * v19 + 32], 16 * (v120 - v19));
          *((_QWORD *)v109 + 2) = v120 - 1;
          v19 = v120 - 1;
          v17 = v109;
        }
        while (v120 > 2);
      }
      v121 = v17;
LABEL_118:
      swift_bridgeObjectRelease(v121);
      v122 = v124;
      v124[2] = 0;
      return swift_bridgeObjectRelease(v122);
    }
  }
  else
  {
    v14 = v13 >> 1;
    v15 = static Array._allocateBufferUninitialized(minimumCapacity:)(v13 >> 1, v137);
    *(_QWORD *)(v15 + 16) = v14;
    v16 = *(unsigned __int8 *)(v132 + 80);
    v124 = (_QWORD *)v15;
    v131 = v15 + ((v16 + 32) & ~v16);
  }
  v18 = 0;
  v17 = (char *)&_swiftEmptyArrayStorage;
  v136 = a1;
  while (1)
  {
    v20 = v18;
    v21 = v18 + 1;
    if (v18 + 1 >= v11)
    {
      v31 = v18 + 1;
    }
    else
    {
      v22 = *a1;
      v23 = *(_QWORD *)(v132 + 72);
      v24 = *a1 + v23 * v21;
      v130 = v18;
      v25 = v134;
      sub_100005D10(v24, v134);
      v26 = v135;
      sub_100005D10(v22 + v23 * v130, v135);
      v27 = *(int *)(v137 + 44);
      v28 = *(double *)(v25 + v27);
      v29 = *(double *)(v26 + v27);
      sub_100005D54(v26);
      v30 = v25;
      v20 = v130;
      sub_100005D54(v30);
      v31 = v20 + 2;
      v127 = v22;
      v139 = v23;
      if (v20 + 2 < v11)
      {
        v128 = v2;
        v126 = v17;
        v133 = v23 * v21;
        v32 = v22;
        v33 = v20 + 2;
        v34 = v23 * (v20 + 2);
        while (1)
        {
          v35 = v134;
          sub_100005D10(v32 + v34, v134);
          v36 = v135;
          sub_100005D10(v32 + v133, v135);
          v37 = *(double *)(v35 + *(int *)(v137 + 44)) >= *(double *)(v36 + *(int *)(v137 + 44));
          sub_100005D54(v36);
          sub_100005D54(v35);
          if (v28 < v29 == v37)
            break;
          v32 += v139;
          if (v11 == ++v33)
          {
            v31 = v11;
            v17 = v126;
            goto LABEL_23;
          }
        }
        v17 = v126;
        v31 = v33;
LABEL_23:
        v2 = v128;
        v20 = v130;
      }
      if (v28 < v29)
      {
        if (v31 < v20)
          goto LABEL_142;
        if (v20 < v31)
        {
          v133 = v11;
          v126 = v17;
          v38 = 0;
          v39 = v139;
          v40 = v139 * (v31 - 1);
          v41 = v31 * v139;
          v42 = v20;
          v43 = v20 * v139;
          do
          {
            if (v42 != v31 + v38 - 1)
            {
              v128 = v2;
              v44 = v127;
              if (!v127)
                goto LABEL_147;
              v45 = v127 + v43;
              sub_10000B974(v127 + v43, v129);
              if (v43 < v40 || v45 >= v44 + v41)
              {
                swift_arrayInitWithTakeFrontToBack(v44 + v43, v44 + v40, 1, v137);
              }
              else if (v43 != v40)
              {
                swift_arrayInitWithTakeBackToFront(v44 + v43);
              }
              sub_10000B974(v129, v44 + v40);
              a1 = v136;
              v2 = v128;
              v39 = v139;
            }
            ++v42;
            --v38;
            v40 -= v39;
            v41 -= v39;
            v43 += v39;
          }
          while (v42 < v31 + v38);
          v17 = v126;
          v20 = v130;
          v11 = v133;
        }
      }
    }
    if (v31 < v11)
    {
      if (__OFSUB__(v31, v20))
        goto LABEL_140;
      if (v31 - v20 < v125)
        break;
    }
LABEL_56:
    if (v31 < v20)
      goto LABEL_135;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v17);
    v139 = v31;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v17 = sub_100009DB4(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
    v64 = *((_QWORD *)v17 + 2);
    v63 = *((_QWORD *)v17 + 3);
    v19 = v64 + 1;
    if (v64 >= v63 >> 1)
      v17 = sub_100009DB4((char *)(v63 > 1), v64 + 1, 1, v17);
    *((_QWORD *)v17 + 2) = v19;
    v65 = v17 + 32;
    v66 = &v17[16 * v64 + 32];
    v67 = v139;
    *(_QWORD *)v66 = v20;
    *((_QWORD *)v66 + 1) = v67;
    if (v64)
    {
      while (1)
      {
        v68 = v19 - 1;
        if (v19 >= 4)
        {
          v73 = &v65[16 * v19];
          v74 = *((_QWORD *)v73 - 8);
          v75 = *((_QWORD *)v73 - 7);
          v79 = __OFSUB__(v75, v74);
          v76 = v75 - v74;
          if (v79)
            goto LABEL_124;
          v78 = *((_QWORD *)v73 - 6);
          v77 = *((_QWORD *)v73 - 5);
          v79 = __OFSUB__(v77, v78);
          v71 = v77 - v78;
          v72 = v79;
          if (v79)
            goto LABEL_125;
          v80 = v19 - 2;
          v81 = &v65[16 * v19 - 32];
          v83 = *(_QWORD *)v81;
          v82 = *((_QWORD *)v81 + 1);
          v79 = __OFSUB__(v82, v83);
          v84 = v82 - v83;
          if (v79)
            goto LABEL_127;
          v79 = __OFADD__(v71, v84);
          v85 = v71 + v84;
          if (v79)
            goto LABEL_130;
          if (v85 >= v76)
          {
            v103 = &v65[16 * v68];
            v105 = *(_QWORD *)v103;
            v104 = *((_QWORD *)v103 + 1);
            v79 = __OFSUB__(v104, v105);
            v106 = v104 - v105;
            if (v79)
              goto LABEL_134;
            v96 = v71 < v106;
            goto LABEL_93;
          }
        }
        else
        {
          if (v19 != 3)
          {
            v97 = *((_QWORD *)v17 + 4);
            v98 = *((_QWORD *)v17 + 5);
            v79 = __OFSUB__(v98, v97);
            v90 = v98 - v97;
            v91 = v79;
            goto LABEL_87;
          }
          v70 = *((_QWORD *)v17 + 4);
          v69 = *((_QWORD *)v17 + 5);
          v79 = __OFSUB__(v69, v70);
          v71 = v69 - v70;
          v72 = v79;
        }
        if ((v72 & 1) != 0)
          goto LABEL_126;
        v80 = v19 - 2;
        v86 = &v65[16 * v19 - 32];
        v88 = *(_QWORD *)v86;
        v87 = *((_QWORD *)v86 + 1);
        v89 = __OFSUB__(v87, v88);
        v90 = v87 - v88;
        v91 = v89;
        if (v89)
          goto LABEL_129;
        v92 = &v65[16 * v68];
        v94 = *(_QWORD *)v92;
        v93 = *((_QWORD *)v92 + 1);
        v79 = __OFSUB__(v93, v94);
        v95 = v93 - v94;
        if (v79)
          goto LABEL_132;
        if (__OFADD__(v90, v95))
          goto LABEL_133;
        if (v90 + v95 >= v71)
        {
          v96 = v71 < v95;
LABEL_93:
          if (v96)
            v68 = v80;
          goto LABEL_95;
        }
LABEL_87:
        if ((v91 & 1) != 0)
          goto LABEL_128;
        v99 = &v65[16 * v68];
        v101 = *(_QWORD *)v99;
        v100 = *((_QWORD *)v99 + 1);
        v79 = __OFSUB__(v100, v101);
        v102 = v100 - v101;
        if (v79)
          goto LABEL_131;
        if (v102 < v90)
          goto LABEL_14;
LABEL_95:
        v107 = v68 - 1;
        if (v68 - 1 >= v19)
        {
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
          goto LABEL_144;
        }
        v108 = *a1;
        if (!*a1)
          goto LABEL_146;
        v109 = v17;
        v110 = &v65[16 * v107];
        v111 = *(_QWORD *)v110;
        v112 = &v65[16 * v68];
        v113 = *((_QWORD *)v112 + 1);
        sub_10000997C(v108 + *(_QWORD *)(v132 + 72) * *(_QWORD *)v110, v108 + *(_QWORD *)(v132 + 72) * *(_QWORD *)v112, v108 + *(_QWORD *)(v132 + 72) * v113, v131);
        if (v2)
        {
LABEL_116:
          v121 = v109;
          goto LABEL_118;
        }
        if (v113 < v111)
          goto LABEL_121;
        if (v68 > *((_QWORD *)v109 + 2))
          goto LABEL_122;
        *(_QWORD *)v110 = v111;
        *(_QWORD *)&v65[16 * v107 + 8] = v113;
        v114 = *((_QWORD *)v109 + 2);
        if (v68 >= v114)
          goto LABEL_123;
        v17 = v109;
        v19 = v114 - 1;
        memmove(&v65[16 * v68], v112 + 16, 16 * (v114 - 1 - v68));
        *((_QWORD *)v109 + 2) = v114 - 1;
        a1 = v136;
        if (v114 <= 2)
          goto LABEL_14;
      }
    }
    v19 = 1;
LABEL_14:
    v11 = a1[1];
    v18 = v139;
    if (v139 >= v11)
      goto LABEL_104;
  }
  if (__OFADD__(v20, v125))
    goto LABEL_143;
  if (v20 + v125 >= v11)
    v46 = v11;
  else
    v46 = v20 + v125;
  if (v46 >= v20)
  {
    if (v31 != v46)
    {
      v130 = v20;
      v126 = v17;
      v127 = v46;
      v128 = v2;
      v47 = *(_QWORD *)(v132 + 72);
      v139 = v47 * (v31 - 1);
      v133 = v47;
      v48 = v31 * v47;
      do
      {
        v49 = 0;
        v50 = v130;
        while (1)
        {
          v51 = v31;
          v52 = *a1;
          v53 = v134;
          sub_100005D10(v48 + v49 + *a1, v134);
          v54 = v139 + v49 + v52;
          v55 = v135;
          sub_100005D10(v54, v135);
          v56 = *(int *)(v137 + 44);
          v57 = *(double *)(v53 + v56);
          v58 = *(double *)(v55 + v56);
          sub_100005D54(v55);
          sub_100005D54(v53);
          if (v57 >= v58)
            break;
          v59 = *a1;
          if (!*a1)
            goto LABEL_145;
          v60 = v59 + v48 + v49;
          v61 = v59 + v139 + v49;
          sub_10000B974(v60, v138);
          swift_arrayInitWithTakeFrontToBack(v60, v61, 1, v137);
          sub_10000B974(v138, v61);
          v49 -= v133;
          ++v50;
          v31 = v51;
          a1 = v136;
          if (v51 == v50)
            goto LABEL_49;
        }
        v31 = v51;
LABEL_49:
        ++v31;
        v139 += v133;
        v48 += v133;
      }
      while (v31 != v127);
      v31 = v127;
      v2 = v128;
      v17 = v126;
      v20 = v130;
    }
    goto LABEL_56;
  }
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000976C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
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

  v28 = a1;
  v31 = type metadata accessor for CLSContextMetadata(0);
  v7 = __chkstk_darwin(v31);
  v32 = (uint64_t)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v26 - v10;
  result = __chkstk_darwin(v9);
  v15 = (char *)&v26 - v14;
  v30 = a3;
  v27 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v34 = v16 * (v30 - 1);
    v29 = v16;
    v33 = v16 * v30;
LABEL_5:
    v17 = 0;
    v18 = v28;
    while (1)
    {
      v19 = *a4;
      sub_100005D10(v33 + v17 + *a4, (uint64_t)v15);
      sub_100005D10(v34 + v17 + v19, (uint64_t)v11);
      v20 = *(int *)(v31 + 44);
      v21 = *(double *)&v15[v20];
      v22 = *(double *)&v11[v20];
      sub_100005D54((uint64_t)v11);
      result = sub_100005D54((uint64_t)v15);
      if (v21 >= v22)
      {
LABEL_4:
        v34 += v29;
        v33 += v29;
        if (++v30 == v27)
          return result;
        goto LABEL_5;
      }
      v23 = *a4;
      if (!*a4)
        break;
      v24 = v23 + v33 + v17;
      v25 = v23 + v34 + v17;
      sub_10000B974(v24, v32);
      swift_arrayInitWithTakeFrontToBack(v24, v25, 1, v31);
      result = sub_10000B974(v32, v25);
      v17 -= v29;
      if (v30 == ++v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10000997C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  double v25;
  double v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v30;
  unint64_t v32;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t result;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;

  v8 = type metadata accessor for CLSContextMetadata(0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v44 - v12;
  v15 = *(_QWORD *)(v14 + 72);
  if (!v15)
  {
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  v16 = a1;
  if (a2 - a1 == 0x8000000000000000 && v15 == -1)
    goto LABEL_70;
  v17 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v15 == -1)
    goto LABEL_71;
  v18 = (uint64_t)(a2 - a1) / v15;
  v48 = a1;
  v47 = a4;
  v19 = v17 / v15;
  if (v18 >= v17 / v15)
  {
    if ((v19 & 0x8000000000000000) == 0)
    {
      v45 = a1;
      v21 = v19 * v15;
      if (a4 < a2 || a2 + v21 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack(a4, a2, v19, v8);
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront(a4);
      }
      v32 = a4 + v21;
      v46 = a4 + v21;
      v48 = a2;
      if (v21 >= 1 && v45 < a2)
      {
        v34 = -v15;
        do
        {
          v35 = a3 + v34;
          sub_100005D10(v32 + v34, (uint64_t)v13);
          v36 = a2 + v34;
          sub_100005D10(a2 + v34, (uint64_t)v11);
          v37 = *(int *)(v8 + 44);
          v38 = *(double *)&v13[v37];
          v39 = *(double *)&v11[v37];
          sub_100005D54((uint64_t)v11);
          sub_100005D54((uint64_t)v13);
          if (v38 >= v39)
          {
            v40 = v46;
            v41 = v46 + v34;
            v46 += v34;
            if (a3 < v40 || v35 >= v40)
            {
              swift_arrayInitWithTakeFrontToBack(a3 + v34, v41, 1, v8);
            }
            else if (a3 != v40)
            {
              swift_arrayInitWithTakeBackToFront(a3 + v34);
            }
            v36 = a2;
          }
          else
          {
            if (a3 < a2 || v35 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack(a3 + v34, a2 + v34, 1, v8);
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront(a3 + v34);
            }
            v48 += v34;
          }
          v32 = v46;
          if (v46 <= a4)
            break;
          a2 = v36;
          a3 += v34;
        }
        while (v36 > v45);
      }
      goto LABEL_68;
    }
  }
  else if ((v18 & 0x8000000000000000) == 0)
  {
    v20 = v18 * v15;
    if (a4 < v16 || v16 + v20 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, v16, v18, v8);
    }
    else if (a4 != v16)
    {
      swift_arrayInitWithTakeBackToFront(a4);
    }
    v22 = a4 + v20;
    v46 = a4 + v20;
    if (v20 >= 1 && a2 < a3)
    {
      do
      {
        sub_100005D10(a2, (uint64_t)v13);
        sub_100005D10(a4, (uint64_t)v11);
        v24 = *(int *)(v8 + 44);
        v25 = *(double *)&v13[v24];
        v26 = *(double *)&v11[v24];
        sub_100005D54((uint64_t)v11);
        sub_100005D54((uint64_t)v13);
        v27 = v48;
        if (v25 >= v26)
        {
          v30 = v47 + v15;
          if (v48 < v47 || v48 >= v30)
          {
            swift_arrayInitWithTakeFrontToBack(v48, v47, 1, v8);
          }
          else if (v48 != v47)
          {
            swift_arrayInitWithTakeBackToFront(v48);
          }
          v47 = v30;
          v28 = a2;
        }
        else
        {
          v28 = a2 + v15;
          if (v48 < a2 || v48 >= v28)
          {
            swift_arrayInitWithTakeFrontToBack(v48, a2, 1, v8);
          }
          else if (v48 == a2)
          {
            v27 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront(v48);
          }
        }
        v48 = v27 + v15;
        a4 = v47;
        if (v47 >= v22)
          break;
        a2 = v28;
      }
      while (v28 < a3);
    }
LABEL_68:
    sub_100009EAC(&v48, &v47, (uint64_t *)&v46);
    return 1;
  }
LABEL_72:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_100009DB4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100005C94(&qword_100019570);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_100009EAC(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for CLSContextMetadata(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  v10 = v8 / v7;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v10 * v7)
    return swift_arrayInitWithTakeFrontToBack(v3, v4, v10, result);
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront(v3);
  return result;
}

char *sub_100009FB8(uint64_t a1)
{
  return sub_100009DB4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

unsigned __int8 *sub_100009FCC(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_10000A248(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1;
  v3 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v3 = 11;
  v4 = String.subscript.getter(15, v3 | (v2 << 16), a1, a2);
  v6 = v5;
  v9 = sub_10000A2C4(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_10000A2C4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v5 = a3;
  if ((a4 & 0x1000000000000000) != 0)
  {
    v12 = sub_10000A408(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)sub_1000075FC(v12, 0);
      v5 = sub_10000A4F4((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
      v13 = v15[3];
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRelease(v13);
      if (v5 != v9)
      {
        __break(1u);
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (unint64_t)_swiftEmptyArrayStorage;
    }
    v14 = static String._uncheckedFromUTF8(_:)(v8 + 32, *(_QWORD *)(v8 + 16));
    swift_release(v8);
    return v14;
  }
  else
  {
    v8 = a1 >> 16;
    v9 = a2 >> 16;
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_5:
        v10 += v8;
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }
LABEL_11:
      v10 = _StringObject.sharedUTF8.getter(v5, a4);
      if (!v10)
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      goto LABEL_5;
    }
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return static String._uncheckedFromUTF8(_:)((char *)v15 + v8, v9 - v8);
  }
}

unint64_t sub_10000A408(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_100007660(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_100007660(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }
  __break(1u);
  return result;
}

unint64_t sub_10000A4F4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_100007660(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = _StringObject.sharedUTF8.getter(a6, a7);
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_100007660(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = String.UTF8View._foreignIndex(after:)(v12, a6, a7);
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_10000A704(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10000A720(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_10000A720(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100005C94((uint64_t *)&unk_100019550);
  v11 = *(_QWORD *)(type metadata accessor for CLSContextMetadata(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for CLSContextMetadata(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v21);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000A900(unint64_t a1)
{
  return sub_100008B14(0, *(_QWORD *)(a1 + 16), 0, a1, (uint64_t *)&unk_100019550, type metadata accessor for CLSContextMetadata);
}

uint64_t sub_10000A934(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10000AA24()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSString v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;

  v1 = (void *)objc_opt_self(MTDB);
  if (objc_msgSend(v1, "canExtensionOpenDatabase"))
  {
    v2 = objc_msgSend(v1, "sharedInstance");
    v3 = objc_msgSend(v2, "resetableImportContext");

    static String._unconditionallyBridgeFromObjectiveC(_:)(kMTPodcastEntityName);
    v5 = v4;
    v6 = objc_allocWithZone((Class)NSFetchRequest);
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
    v8 = objc_msgSend(v6, "initWithEntityName:", v7);

    v9 = objc_msgSend((id)objc_opt_self(MTPodcast), "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
    objc_msgSend(v8, "setPredicate:", v9);

    v0 = sub_1000079AC(v8, (uint64_t)sub_10000798C, 0);
  }
  else
  {
    v10 = sub_10000B7D0();
    v11 = swift_allocError(&type metadata for ClassKitError, v10, 0, 0);
    swift_willThrow(v11);
  }
  return v0;
}

void sub_10000ABA0(void *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  sub_100007060(0, &qword_100019518, NSObject_ptr);
  v3 = objc_msgSend((id)objc_opt_self(CLSDataStore), "shared");
  v4 = objc_msgSend(v3, "mainAppContext");

  v5 = static NSObject.== infix(_:_:)(a1, v4);
  if ((v5 & 1) != 0)
  {
    v6 = sub_10000AA24();
    if (!v1)
    {
      v7 = v6;
      if (v6)
      {
        v8 = swift_allocObject(&unk_100014A78, 32, 7);
        *(_QWORD *)(v8 + 16) = v7;
        *(_QWORD *)(v8 + 24) = a1;
        swift_bridgeObjectRetain(v7);
        v9 = a1;
        sub_100006A1C((uint64_t)sub_10000B770, v8);
        swift_bridgeObjectRelease(v7);
        swift_release(v8);
      }
    }
  }
}

uint64_t sub_10000ACAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSString v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;

  v2 = v1;
  static String._unconditionallyBridgeFromObjectiveC(_:)(kMTPodcastEntityName);
  v5 = v4;
  v6 = objc_allocWithZone((Class)NSFetchRequest);
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  v8 = objc_msgSend(v6, "initWithEntityName:", v7);

  v9 = objc_msgSend((id)objc_opt_self(MTPodcast), "predicateForPodcastStoreId:", a1);
  objc_msgSend(v8, "setPredicate:", v9);

  v10 = (_QWORD *)sub_100007B60(v8, (uint64_t)sub_100007EC8, 0);
  if (!v1)
  {
    v11 = v10;
    if (v10)
    {
      if (v10[2])
      {
        v2 = v10[4];
        swift_bridgeObjectRetain(v10[5]);
      }
      else
      {
        v2 = 0;
      }
      swift_bridgeObjectRelease(v11);
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

id sub_10000ADF8(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSString v13;
  id v14;
  void *v15;
  NSString v16;
  id v17;

  v4 = (void *)objc_opt_self(MTDB);
  if (objc_msgSend(v4, "canExtensionOpenDatabase"))
  {
    v2 = objc_msgSend(v4, "sharedInstance");
    v5 = objc_msgSend(v2, "resetableImportContext");

    sub_10000ACAC(a1);
    if (v1 || (v2 = v6) == 0)
    {

    }
    else
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(kMTEpisodeEntityName);
      v11 = v10;
      v12 = objc_allocWithZone((Class)NSFetchRequest);
      v13 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v11);
      v14 = objc_msgSend(v12, "initWithEntityName:", v13);

      v15 = (void *)objc_opt_self(MTEpisode);
      v16 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v2);
      v17 = objc_msgSend(v15, "predicateForUserEpisodesOnPodcastUuid:ctx:", v16, v5);

      objc_msgSend(v14, "setPredicate:", v17);
      v2 = (id)sub_100007D14(v14, (uint64_t)sub_100007F28, 0);

    }
  }
  else
  {
    v7 = sub_10000B7D0();
    v8 = swift_allocError(&type metadata for ClassKitError, v7, 0, 0);
    swift_willThrow(v8);
  }
  return v2;
}

void sub_10000AFE0(void *a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  unsigned __int8 *v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  unint64_t v32[2];

  v3 = objc_msgSend(a1, "identifier");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  v7 = HIBYTE(v6) & 0xF;
  v8 = v4 & 0xFFFFFFFFFFFFLL;
  if ((v6 & 0x2000000000000000) != 0)
    v9 = HIBYTE(v6) & 0xF;
  else
    v9 = v4 & 0xFFFFFFFFFFFFLL;
  if (!v9)
  {
    swift_bridgeObjectRelease(v6);
    return;
  }
  if ((v6 & 0x1000000000000000) != 0)
  {
    v11 = (uint64_t)sub_100008D20(v4, v6, 10);
    LOBYTE(v4) = v31;
    goto LABEL_44;
  }
  if ((v6 & 0x2000000000000000) == 0)
  {
    if ((v4 & 0x1000000000000000) != 0)
      v10 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v10 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v4, v6);
    v11 = (uint64_t)sub_100009FCC(v10, v8, 10);
    LOBYTE(v4) = v12 & 1;
    goto LABEL_44;
  }
  v32[0] = v4;
  v32[1] = v6 & 0xFFFFFFFFFFFFFFLL;
  if (v4 == 43)
  {
    if (!v7)
    {
LABEL_59:
      __break(1u);
      return;
    }
    if (v7 == 1 || (BYTE1(v4) - 48) > 9u)
      goto LABEL_31;
    v11 = (BYTE1(v4) - 48);
    if (v7 != 2)
    {
      if ((BYTE2(v4) - 48) > 9u)
        goto LABEL_31;
      v11 = 10 * (BYTE1(v4) - 48) + (BYTE2(v4) - 48);
      v13 = v7 - 3;
      if (v13)
      {
        v14 = (unsigned __int8 *)v32 + 3;
        while (1)
        {
          v15 = *v14 - 48;
          if (v15 > 9)
            goto LABEL_31;
          v16 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63)
            goto LABEL_31;
          v11 = v16 + v15;
          if (__OFADD__(v16, v15))
            goto LABEL_31;
          LOBYTE(v4) = 0;
          ++v14;
          if (!--v13)
            goto LABEL_44;
        }
      }
    }
LABEL_43:
    LOBYTE(v4) = 0;
    goto LABEL_44;
  }
  if (v4 != 45)
  {
    if (!v7 || (v4 - 48) > 9u)
      goto LABEL_31;
    v11 = (v4 - 48);
    if (v7 != 1)
    {
      if ((BYTE1(v4) - 48) > 9u)
        goto LABEL_31;
      v11 = 10 * (v4 - 48) + (BYTE1(v4) - 48);
      v17 = v7 - 2;
      if (v17)
      {
        v18 = (unsigned __int8 *)v32 + 2;
        while (1)
        {
          v19 = *v18 - 48;
          if (v19 > 9)
            goto LABEL_31;
          v20 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63)
            goto LABEL_31;
          v11 = v20 + v19;
          if (__OFADD__(v20, v19))
            goto LABEL_31;
          LOBYTE(v4) = 0;
          ++v18;
          if (!--v17)
            goto LABEL_44;
        }
      }
    }
    goto LABEL_43;
  }
  if (!v7)
  {
    __break(1u);
    goto LABEL_59;
  }
  if (v7 == 1 || (BYTE1(v4) - 48) > 9u)
    goto LABEL_31;
  if (v7 != 2)
  {
    if ((BYTE2(v4) - 48) <= 9u)
    {
      v11 = -10 * (BYTE1(v4) - 48) - (BYTE2(v4) - 48);
      v21 = v7 - 3;
      if (!v21)
        goto LABEL_43;
      v28 = (unsigned __int8 *)v32 + 3;
      while (1)
      {
        v29 = *v28 - 48;
        if (v29 > 9)
          break;
        v30 = 10 * v11;
        if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63)
          break;
        v11 = v30 - v29;
        if (__OFSUB__(v30, v29))
          break;
        LOBYTE(v4) = 0;
        ++v28;
        if (!--v21)
          goto LABEL_44;
      }
    }
LABEL_31:
    v11 = 0;
    LOBYTE(v4) = 1;
    goto LABEL_44;
  }
  LOBYTE(v4) = 0;
  v11 = -(uint64_t)(BYTE1(v4) - 48);
LABEL_44:
  swift_bridgeObjectRelease(v6);
  if ((v4 & 1) == 0)
  {
    v22 = sub_10000ADF8(v11);
    if (!v1)
    {
      if (v22)
      {
        v32[0] = (unint64_t)v22;
        sub_100008450(v32);
        v23 = v32[0];
        v24 = swift_bridgeObjectRetain(v32[0]);
        v25 = sub_1000084D4(v24);
        swift_bridgeObjectRelease_n(v23, 2);
        v26 = swift_allocObject(&unk_100014B18, 32, 7);
        *(_QWORD *)(v26 + 16) = v25;
        *(_QWORD *)(v26 + 24) = a1;
        swift_bridgeObjectRetain(v25);
        v27 = a1;
        sub_100006A1C((uint64_t)sub_10000C11C, v26);
        swift_bridgeObjectRelease(v25);
        swift_release(v26);
      }
    }
  }
}

void sub_10000B37C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = objc_msgSend(a1, "identifierPath");
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, &type metadata for String);

  v9 = *(_QWORD *)(v8 + 16);
  swift_bridgeObjectRelease(v8);
  if (v9 == 2)
  {
    sub_10000AFE0(a1);
    if (v3)
      return;
    v10 = objc_msgSend((id)objc_opt_self(CLSDataStore), "shared");
    v18 = a2;
    v19 = a3;
    v14 = _NSConcreteStackBlock;
    v15 = 1107296256;
    v11 = &unk_100014A18;
    goto LABEL_7;
  }
  if (v9 == 1)
  {
    sub_10000ABA0(a1);
    if (!v3)
    {
      v10 = objc_msgSend((id)objc_opt_self(CLSDataStore), "shared");
      v18 = a2;
      v19 = a3;
      v14 = _NSConcreteStackBlock;
      v15 = 1107296256;
      v11 = &unk_100014A40;
LABEL_7:
      v16 = sub_100007938;
      v17 = v11;
      v12 = _Block_copy(&v14);
      v13 = v19;
      swift_retain(a3);
      swift_release(v13);
      objc_msgSend(v10, "saveWithCompletion:", v12, v14, v15);
      _Block_release(v12);

    }
  }
}

uint64_t sub_10000B518(void *a1, void (**a2)(_QWORD, _QWORD))
{
  uint64_t v4;

  v4 = swift_allocObject(&unk_100014A00, 24, 7);
  *(_QWORD *)(v4 + 16) = a2;
  _Block_copy(a2);
  sub_10000B37C(a1, (uint64_t)sub_10000B708, v4);
  a2[2](a2, 0);
  return swift_release(v4);
}

uint64_t sub_10000B6E4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000B708(uint64_t a1)
{
  uint64_t v1;

  sub_1000078EC(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_10000B710()
{
  unint64_t result;

  result = qword_100019508;
  if (!qword_100019508)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100019508);
  }
  return result;
}

uint64_t sub_10000B754(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000B764(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000B770(uint64_t a1)
{
  uint64_t v1;

  return sub_100007F48(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_10000B778()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019530;
  if (!qword_100019530)
  {
    v1 = sub_100007060(255, &qword_1000193F8, CLSContext_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100019530);
  }
  return result;
}

unint64_t sub_10000B7D0()
{
  unint64_t result;

  result = qword_100019538;
  if (!qword_100019538)
  {
    result = swift_getWitnessTable(&unk_100011ECC, &type metadata for ClassKitError);
    atomic_store(result, (unint64_t *)&qword_100019538);
  }
  return result;
}

id sub_10000B818()
{
  return sub_10000BA84(&qword_100019540, MTPodcast_ptr);
}

uint64_t sub_10000B82C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B83C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000B85C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(a5(0) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 72);
  v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  v13 = v11 * v5;
  v14 = a3 + v13;
  v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v14;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000B974(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CLSContextMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B9BC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B9E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005C94(&qword_100019568);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BA30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005C94(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_10000BA70()
{
  return sub_10000BA84(&qword_100019578, MTEpisode_ptr);
}

id sub_10000BA84(unint64_t *a1, _QWORD *a2)
{
  uint64_t v2;

  return sub_100008864(*(uint64_t **)(v2 + 16), *(void **)(v2 + 24), *(_QWORD *)(v2 + 32), *(void (**)(id))(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), a1, a2);
}

uint64_t sub_10000BAAC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

char *sub_10000BABC(unint64_t a1, void (*a2)(uint64_t *__return_ptr, id))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t *__return_ptr, id);

  v23 = a2;
  v3 = v2;
  v4 = a1;
  if (a1 >> 62)
    goto LABEL_19;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v5; v5 = _CocoaArrayWrapper.endIndex.getter(v17))
  {
    v20 = v4 & 0xC000000000000001;
    v6 = (char *)_swiftEmptyArrayStorage;
    v7 = 4;
    v19 = v4;
    while (1)
    {
      v9 = v20 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, v4) : *(id *)(v4 + 8 * v7);
      v10 = v9;
      v11 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v23(&v21, v9);
      if (v3)
      {
        swift_bridgeObjectRelease(v6);
        swift_bridgeObjectRelease(v4);

        return v6;
      }

      v12 = v22;
      if (v22)
      {
        v13 = v5;
        v14 = v21;
        if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0)
          v6 = sub_1000089F4(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
        v16 = *((_QWORD *)v6 + 2);
        v15 = *((_QWORD *)v6 + 3);
        if (v16 >= v15 >> 1)
          v6 = sub_1000089F4((char *)(v15 > 1), v16 + 1, 1, v6);
        *((_QWORD *)v6 + 2) = v16 + 1;
        v8 = &v6[16 * v16];
        *((_QWORD *)v8 + 4) = v14;
        *((_QWORD *)v8 + 5) = v12;
        v4 = v19;
        v5 = v13;
      }
      ++v7;
      if (v11 == v5)
      {
        swift_bridgeObjectRelease(v4);
        return v6;
      }
    }
    __break(1u);
LABEL_19:
    if (v4 < 0)
      v17 = v4;
    else
      v17 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
  }
  swift_bridgeObjectRelease(v4);
  return (char *)_swiftEmptyArrayStorage;
}

_QWORD *sub_10000BC84(uint64_t a1, void (*a2)(id))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(id);
  uint64_t v28;

  v3 = v2;
  v27 = a2;
  v5 = sub_100005C94(&qword_100019548);
  __chkstk_darwin(v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for CLSContextMetadata(0);
  v28 = *(_QWORD *)(v26 - 8);
  v8 = __chkstk_darwin(v26);
  v25 = (uint64_t)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v23 = (uint64_t)&v22 - v10;
  if ((unint64_t)a1 >> 62)
    goto LABEL_20;
  v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v11; v11 = _CocoaArrayWrapper.endIndex.getter(v20))
  {
    v24 = a1 & 0xC000000000000001;
    v12 = &_swiftEmptyArrayStorage;
    v13 = 4;
    v22 = a1;
    while (1)
    {
      v14 = v24 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v13 - 4, a1) : *(id *)(a1 + 8 * v13);
      v15 = v14;
      v16 = v13 - 3;
      if (__OFADD__(v13 - 4, 1))
        break;
      v27(v14);
      if (v3)
      {
        swift_bridgeObjectRelease(v12);
        swift_bridgeObjectRelease(a1);

        return v12;
      }

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v7, 1, v26) == 1)
      {
        sub_10000BA30((uint64_t)v7, &qword_100019548);
      }
      else
      {
        v17 = v23;
        sub_10000B974((uint64_t)v7, v23);
        sub_10000B974(v17, v25);
        if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0)
          v12 = (_QWORD *)sub_100008B14(0, v12[2] + 1, 1, (unint64_t)v12, (uint64_t *)&unk_100019550, type metadata accessor for CLSContextMetadata);
        v19 = v12[2];
        v18 = v12[3];
        if (v19 >= v18 >> 1)
          v12 = (_QWORD *)sub_100008B14(v18 > 1, v19 + 1, 1, (unint64_t)v12, (uint64_t *)&unk_100019550, type metadata accessor for CLSContextMetadata);
        v12[2] = v19 + 1;
        sub_10000B974(v25, (uint64_t)v12+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(_QWORD *)(v28 + 72) * v19);
        a1 = v22;
      }
      ++v13;
      if (v16 == v11)
      {
        swift_bridgeObjectRelease(a1);
        return v12;
      }
    }
    __break(1u);
LABEL_20:
    if (a1 < 0)
      v20 = a1;
    else
      v20 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
  swift_bridgeObjectRelease(a1);
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000BF60()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 64, 7);
}

id sub_10000BF94()
{
  uint64_t v0;

  return sub_1000087A4(*(char ***)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(uint64_t *__return_ptr, id))(v0 + 40));
}

uint64_t sub_10000BFA4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t getEnumTagSinglePayload for ClassKitError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for ClassKitError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_10000C048 + 4 * byte_100011E10[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10000C068 + 4 * byte_100011E15[v4]))();
}

_BYTE *sub_10000C048(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10000C068(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000C070(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000C078(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000C080(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000C088(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_10000C094()
{
  return 0;
}

ValueMetadata *type metadata accessor for ClassKitError()
{
  return &type metadata for ClassKitError;
}

unint64_t sub_10000C0B4()
{
  unint64_t result;

  result = qword_100019580;
  if (!qword_100019580)
  {
    result = swift_getWitnessTable(&unk_100011EA4, &type metadata for ClassKitError);
    atomic_store(result, (unint64_t *)&qword_100019580);
  }
  return result;
}

uint64_t sub_10000C120@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (**v23)();
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t (*v34)();
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  _UNKNOWN **v47;

  v2 = v1;
  v4 = sub_100005C94((uint64_t *)&unk_100019520);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (int *)type metadata accessor for CLSContextMetadata(0);
  v8 = *((_QWORD *)v7 - 1);
  __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend((id)objc_opt_self(MTStoreIdentifier), "isEmpty:", objc_msgSend(v1, "storeTrackId")) & 1) != 0)return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v8 + 56))(a1, 1, 1, v7);
  v11 = objc_msgSend(v1, "title");
  if (!v11)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v8 + 56))(a1, 1, 1, v7);
  v12 = v11;
  v41 = a1;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v38 = v14;
  v39 = v13;

  *(_QWORD *)&v45 = objc_msgSend(v2, "storeTrackId");
  v15 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
  v17 = v16;
  v18 = objc_msgSend(v2, "podcast");
  if (v18)
  {
    v19 = v18;
    *((_QWORD *)&v46 + 1) = sub_100007060(0, &qword_100019540, MTPodcast_ptr);
    v47 = &off_100014D60;
    *(_QWORD *)&v45 = v19;
  }
  else
  {
    v47 = 0;
    v45 = 0u;
    v46 = 0u;
  }
  v10[40] = 1;
  *((_QWORD *)v10 + 6) = 0;
  v21 = (uint64_t)&v10[v7[9]];
  v22 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = (uint64_t (**)())&v10[v7[10]];
  *v23 = sub_1000054D0;
  v23[1] = 0;
  v40 = v7[11];
  *(_QWORD *)&v10[v40] = 0;
  v24 = v7[12];
  *(_QWORD *)&v10[v24] = 0;
  *(_QWORD *)v10 = 14;
  *((_QWORD *)v10 + 1) = v15;
  v25 = v39;
  *((_QWORD *)v10 + 2) = v17;
  *((_QWORD *)v10 + 3) = v25;
  *((_QWORD *)v10 + 4) = v38;
  sub_10000CD74((uint64_t)&v45, (uint64_t)v42);
  v26 = v43;
  if (v43)
  {
    v27 = v44;
    sub_100005E44(v42, v43);
    v26 = sub_1000054D8(v26, v27);
    sub_100005DEC((uint64_t)&v45);
    sub_100005FBC(v42);
  }
  else
  {
    sub_100005DEC((uint64_t)&v45);
    sub_100005DEC((uint64_t)v42);
  }
  swift_bridgeObjectRelease(*(_QWORD *)&v10[v24]);
  *(_QWORD *)&v10[v24] = v26;
  *((_QWORD *)v10 + 6) = objc_msgSend(v2, "episodeNumber");
  sub_10000C4F0((uint64_t)v6);
  sub_10000CDBC((uint64_t)v6, v21);
  v28 = objc_msgSend(v2, "uuid");
  v29 = (uint64_t)v28;
  if (v28)
  {
    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    v32 = v31;

    v33 = (double)CLSContextThumbnailMaximumAllowedDimension;
    v29 = swift_allocObject(&unk_100014D40, 48, 7);
    *(_QWORD *)(v29 + 16) = v30;
    *(_QWORD *)(v29 + 24) = v32;
    *(double *)(v29 + 32) = v33;
    *(double *)(v29 + 40) = v33;
    v34 = (uint64_t (*)())sub_10000CE28;
  }
  else
  {
    v34 = sub_1000054D0;
  }
  swift_release(v23[1]);
  *v23 = v34;
  v23[1] = (uint64_t (*)())v29;
  objc_msgSend(v2, "pubDate");
  v35 = v41;
  *(_QWORD *)&v10[v40] = v36;
  sub_10000CE34((uint64_t)v10, v35, type metadata accessor for CLSContextMetadata);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v8 + 56))(v35, 0, 1, v7);
  return sub_10000CEBC((uint64_t)v10, type metadata accessor for CLSContextMetadata);
}

uint64_t sub_10000C4F0@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  id v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
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
  uint64_t *v51;
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
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;

  v2 = v1;
  v68 = a1;
  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = type metadata accessor for URLComponents(0);
  v7 = *(_QWORD *)(v67 - 8);
  __chkstk_darwin(v67);
  v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for PodcastsURLEpisodeParameters(0);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v66 - v14;
  v16 = objc_msgSend(v2, "podcast");
  if (v16)
  {
    v17 = v16;
    v18 = objc_msgSend(v16, "storeCollectionId");

    *(_OWORD *)v15 = 0u;
    *((_OWORD *)v15 + 1) = 0u;
    *(_WORD *)(v15 + 57) = 514;
    v19 = &v15[*(int *)(v10 + 40)];
    v20 = type metadata accessor for MetricsWidgetContext(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
    *((_QWORD *)v15 + 4) = v18;
    v15[40] = 0;
    *((_QWORD *)v15 + 6) = objc_msgSend(v2, "storeTrackId");
    v15[56] = 0;
    type metadata accessor for PodcastsURLScheme();
    sub_10000CE34((uint64_t)v15, (uint64_t)v13, type metadata accessor for PodcastsURLEpisodeParameters);
    v21 = type metadata accessor for PodcastsURLShowCommand(0);
    v22 = swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
    sub_10000CE78((uint64_t)v13, v22 + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters);
    v23 = type metadata accessor for PodcastsURLNowPlayingCommand();
    if (swift_dynamicCastClass(v22, v23))
    {
      v24 = swift_retain(v22);
      URLComponents.init()(v24);
      if (qword_100019280 != -1)
        swift_once(&qword_100019280, sub_10000DC04);
      v25 = qword_10001A0B0;
      v26 = *(_QWORD *)algn_10001A0B8;
      swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
      URLComponents.scheme.setter(v25, v26);
      if (qword_100019288 != -1)
        swift_once(&qword_100019288, sub_10000DC28);
      v27 = &qword_1000195F0;
    }
    else
    {
      v33 = type metadata accessor for PodcastsURLBrowseCommand();
      if (!swift_dynamicCastClass(v22, v33))
      {
        v43 = type metadata accessor for PodcastsURLOpenCommand(0);
        v44 = swift_dynamicCastClass(v22, v43);
        if (v44)
        {
          v45 = v44;
          swift_retain(v22);
          sub_10000DE48(v45, v68);
          goto LABEL_18;
        }
        v46 = swift_dynamicCastClass(v22, v21);
        if (v46)
        {
          v47 = v46;
          v48 = swift_retain(v22);
          URLComponents.init()(v48);
          if (qword_100019280 != -1)
            swift_once(&qword_100019280, sub_10000DC04);
          v49 = qword_10001A0B0;
          v50 = *(_QWORD *)algn_10001A0B8;
          swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
          URLComponents.scheme.setter(v49, v50);
          if (qword_1000192A0 != -1)
            swift_once(&qword_1000192A0, sub_10000DC8C);
          v51 = &qword_100019620;
        }
        else
        {
          v52 = type metadata accessor for PodcastsURLPlayCommand(0);
          v53 = swift_dynamicCastClass(v22, v52);
          if (v53)
          {
            v47 = v53;
            v54 = swift_retain(v22);
            URLComponents.init()(v54);
            if (qword_100019280 != -1)
              swift_once(&qword_100019280, sub_10000DC04);
            v55 = qword_10001A0B0;
            v56 = *(_QWORD *)algn_10001A0B8;
            swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
            URLComponents.scheme.setter(v55, v56);
            if (qword_1000192A8 != -1)
              swift_once(&qword_1000192A8, sub_10000DCA8);
            v51 = &qword_100019630;
          }
          else
          {
            v57 = type metadata accessor for PodcastsURLShowAndPlayCommand(0);
            v58 = swift_dynamicCastClass(v22, v57);
            if (!v58)
            {
              v65 = type metadata accessor for URL(0);
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 56))(v68, 1, 1, v65);
              goto LABEL_19;
            }
            v47 = v58;
            v59 = swift_retain(v22);
            URLComponents.init()(v59);
            if (qword_100019280 != -1)
              swift_once(&qword_100019280, sub_10000DC04);
            v60 = qword_10001A0B0;
            v61 = *(_QWORD *)algn_10001A0B8;
            swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
            URLComponents.scheme.setter(v60, v61);
            if (qword_1000192B0 != -1)
              swift_once(&qword_1000192B0, sub_10000DCC4);
            v51 = &qword_100019640;
          }
        }
        v62 = *v51;
        v63 = v51[1];
        swift_bridgeObjectRetain(v63);
        URLComponents.host.setter(v62, v63);
        v64 = sub_10000EA40((uint64_t *)(v47
                                      + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters));
        v39 = URLComponents.queryItems.setter(v64);
LABEL_17:
        URLComponents.url.getter(v39);
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v67);
LABEL_18:
        swift_release(v22);
LABEL_19:
        swift_release(v22);
        return sub_10000CEBC((uint64_t)v15, type metadata accessor for PodcastsURLEpisodeParameters);
      }
      v34 = swift_retain(v22);
      URLComponents.init()(v34);
      if (qword_100019280 != -1)
        swift_once(&qword_100019280, sub_10000DC04);
      v35 = qword_10001A0B0;
      v36 = *(_QWORD *)algn_10001A0B8;
      swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
      URLComponents.scheme.setter(v35, v36);
      if (qword_100019290 != -1)
        swift_once(&qword_100019290, sub_10000DC50);
      v27 = &qword_100019600;
    }
    v37 = *v27;
    v38 = v27[1];
    swift_bridgeObjectRetain(v38);
    v39 = URLComponents.host.setter(v37, v38);
    goto LABEL_17;
  }
  v28 = sub_100007060(0, (unint64_t *)&qword_100019510, OS_os_log_ptr);
  static OS_os_log.classKit.getter(v28);
  v29 = v2;
  v30 = Logger.logObject.getter();
  v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v32 = 134217984;
    v69 = -[NSObject storeTrackId](v29, "storeTrackId");
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70);

    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Unable to build share URL, unknown show for episode - %lld", v32, 0xCu);
    swift_slowDealloc(v32, -1, -1);
  }
  else
  {

    v30 = v29;
  }
  v41 = v68;

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v42 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v41, 1, 1, v42);
}

id sub_10000CC08(double a1, double a2)
{
  void *v4;
  NSString v5;
  id v6;
  id v7;

  v4 = (void *)objc_opt_self(MTEpisode);
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v4, "artworkForEpisodeUuid:size:triggerDownload:", v5, 0, a1, a2);

  v7 = objc_msgSend(v6, "CGImage");
  return v7;
}

uint64_t sub_10000CCB4()
{
  id *v0;

  objc_msgSend(*v0, "storeTrackId");
  return dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
}

double sub_10000CD00@<D0>(uint64_t a1@<X8>)
{
  id *v1;
  id v3;
  id v4;
  double result;

  v3 = objc_msgSend(*v1, "podcast");
  if (v3)
  {
    v4 = v3;
    *(_QWORD *)(a1 + 24) = sub_100007060(0, &qword_100019540, MTPodcast_ptr);
    *(_QWORD *)(a1 + 32) = &off_100014D60;
    *(_QWORD *)a1 = v4;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_10000CD74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005C94(&qword_100019300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CDBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005C94((uint64_t *)&unk_100019520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CE04()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 48, 7);
}

id sub_10000CE28()
{
  uint64_t v0;

  return sub_10000CC08(*(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_10000CE34(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000CE78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PodcastsURLEpisodeParameters(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CEBC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000CEF8@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (**v21)();
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t (*v33)();
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];
  uint64_t v38;
  uint64_t v39;
  _OWORD v40[2];
  uint64_t v41;

  v2 = v1;
  v4 = sub_100005C94((uint64_t *)&unk_100019520);
  __chkstk_darwin(v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (int *)type metadata accessor for CLSContextMetadata(0);
  v8 = *((_QWORD *)v7 - 1);
  __chkstk_darwin(v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend((id)objc_opt_self(MTStoreIdentifier), "isEmpty:", objc_msgSend(v1, "storeCollectionId")) & 1) != 0)return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v8 + 56))(a1, 1, 1, v7);
  v11 = objc_msgSend(v1, "title");
  if (!v11)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v8 + 56))(a1, 1, 1, v7);
  v12 = v11;
  v36 = a1;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v34 = v14;

  *(_QWORD *)&v40[0] = objc_msgSend(v2, "storeCollectionId");
  v15 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
  v17 = v16;
  v41 = 0;
  memset(v40, 0, sizeof(v40));
  v10[40] = 1;
  *((_QWORD *)v10 + 6) = 0;
  v18 = (uint64_t)&v10[v7[9]];
  v19 = type metadata accessor for URL(0);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v35 = v18;
  v20(v18, 1, 1, v19);
  v21 = (uint64_t (**)())&v10[v7[10]];
  *v21 = sub_1000054D0;
  v21[1] = 0;
  *(_QWORD *)&v10[v7[11]] = 0;
  v22 = v7[12];
  *(_QWORD *)&v10[v22] = 0;
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = v15;
  *((_QWORD *)v10 + 2) = v17;
  *((_QWORD *)v10 + 3) = v13;
  *((_QWORD *)v10 + 4) = v34;
  sub_10000CD74((uint64_t)v40, (uint64_t)v37);
  v23 = v38;
  if (v38)
  {
    v24 = v39;
    sub_100005E44(v37, v38);
    v23 = sub_1000054D8(v23, v24);
    sub_100005DEC((uint64_t)v40);
    sub_100005FBC(v37);
  }
  else
  {
    sub_100005DEC((uint64_t)v40);
    sub_100005DEC((uint64_t)v37);
  }
  swift_bridgeObjectRelease(*(_QWORD *)&v10[v22]);
  *(_QWORD *)&v10[v22] = v23;
  v10[40] = 0;
  sub_10000D254((uint64_t)v6);
  sub_10000CDBC((uint64_t)v6, v35);
  v26 = objc_msgSend(v2, "uuid");
  v27 = (uint64_t)v26;
  v28 = v36;
  if (v26)
  {
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    v31 = v30;

    v32 = (double)CLSContextThumbnailMaximumAllowedDimension;
    v27 = swift_allocObject(&unk_100014D90, 48, 7);
    *(_QWORD *)(v27 + 16) = v29;
    *(_QWORD *)(v27 + 24) = v31;
    *(double *)(v27 + 32) = v32;
    *(double *)(v27 + 40) = v32;
    v33 = (uint64_t (*)())sub_10000D8FC;
  }
  else
  {
    v33 = sub_1000054D0;
  }
  swift_release(v21[1]);
  *v21 = v33;
  v21[1] = (uint64_t (*)())v27;
  sub_10000CE34((uint64_t)v10, v28, type metadata accessor for CLSContextMetadata);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v8 + 56))(v28, 0, 1, v7);
  return sub_10000CEBC((uint64_t)v10, type metadata accessor for CLSContextMetadata);
}

uint64_t sub_10000D254@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
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
  char *v53;
  uint64_t v54;
  uint64_t v55;

  v2 = v1;
  v4 = type metadata accessor for URLComponents(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PodcastsURLEpisodeParameters(0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v55 - v13;
  *((_QWORD *)v14 + 6) = 0;
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  v14[56] = 1;
  *(_WORD *)(v14 + 57) = 514;
  v15 = (char *)&v55 + *(int *)(v12 + 40) - v13;
  v16 = type metadata accessor for MetricsWidgetContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  *((_QWORD *)v14 + 4) = objc_msgSend(v2, "storeCollectionId");
  v14[40] = 0;
  type metadata accessor for PodcastsURLScheme();
  sub_10000CE34((uint64_t)v14, (uint64_t)v11, type metadata accessor for PodcastsURLEpisodeParameters);
  v17 = type metadata accessor for PodcastsURLShowCommand(0);
  v18 = swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  sub_10000CE78((uint64_t)v11, v18 + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters);
  v19 = type metadata accessor for PodcastsURLNowPlayingCommand();
  if (swift_dynamicCastClass(v18, v19))
  {
    v20 = swift_retain(v18);
    URLComponents.init()(v20);
    if (qword_100019280 != -1)
      swift_once(&qword_100019280, sub_10000DC04);
    v21 = qword_10001A0B0;
    v22 = *(_QWORD *)algn_10001A0B8;
    swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
    URLComponents.scheme.setter(v21, v22);
    if (qword_100019288 != -1)
      swift_once(&qword_100019288, sub_10000DC28);
    v23 = &qword_1000195F0;
LABEL_13:
    v28 = *v23;
    v29 = v23[1];
    swift_bridgeObjectRetain(v29);
    v30 = URLComponents.host.setter(v28, v29);
    goto LABEL_14;
  }
  v24 = type metadata accessor for PodcastsURLBrowseCommand();
  if (swift_dynamicCastClass(v18, v24))
  {
    v25 = swift_retain(v18);
    URLComponents.init()(v25);
    if (qword_100019280 != -1)
      swift_once(&qword_100019280, sub_10000DC04);
    v26 = qword_10001A0B0;
    v27 = *(_QWORD *)algn_10001A0B8;
    swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
    URLComponents.scheme.setter(v26, v27);
    if (qword_100019290 != -1)
      swift_once(&qword_100019290, sub_10000DC50);
    v23 = &qword_100019600;
    goto LABEL_13;
  }
  v32 = type metadata accessor for PodcastsURLOpenCommand(0);
  v33 = swift_dynamicCastClass(v18, v32);
  if (v33)
  {
    v34 = v33;
    swift_retain(v18);
    sub_10000DE48(v34, a1);
    goto LABEL_15;
  }
  v35 = swift_dynamicCastClass(v18, v17);
  if (v35)
  {
    v36 = v35;
    v37 = swift_retain(v18);
    URLComponents.init()(v37);
    if (qword_100019280 != -1)
      swift_once(&qword_100019280, sub_10000DC04);
    v38 = qword_10001A0B0;
    v39 = *(_QWORD *)algn_10001A0B8;
    swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
    URLComponents.scheme.setter(v38, v39);
    if (qword_1000192A0 != -1)
      swift_once(&qword_1000192A0, sub_10000DC8C);
    v40 = &qword_100019620;
  }
  else
  {
    v41 = type metadata accessor for PodcastsURLPlayCommand(0);
    v42 = swift_dynamicCastClass(v18, v41);
    if (v42)
    {
      v36 = v42;
      v43 = swift_retain(v18);
      URLComponents.init()(v43);
      if (qword_100019280 != -1)
        swift_once(&qword_100019280, sub_10000DC04);
      v44 = qword_10001A0B0;
      v45 = *(_QWORD *)algn_10001A0B8;
      swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
      URLComponents.scheme.setter(v44, v45);
      if (qword_1000192A8 != -1)
        swift_once(&qword_1000192A8, sub_10000DCA8);
      v40 = &qword_100019630;
    }
    else
    {
      v46 = type metadata accessor for PodcastsURLShowAndPlayCommand(0);
      v47 = swift_dynamicCastClass(v18, v46);
      if (!v47)
      {
        v54 = type metadata accessor for URL(0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(a1, 1, 1, v54);
        goto LABEL_16;
      }
      v36 = v47;
      v48 = swift_retain(v18);
      URLComponents.init()(v48);
      if (qword_100019280 != -1)
        swift_once(&qword_100019280, sub_10000DC04);
      v49 = qword_10001A0B0;
      v50 = *(_QWORD *)algn_10001A0B8;
      swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
      URLComponents.scheme.setter(v49, v50);
      if (qword_1000192B0 != -1)
        swift_once(&qword_1000192B0, sub_10000DCC4);
      v40 = &qword_100019640;
    }
  }
  v51 = *v40;
  v52 = v40[1];
  swift_bridgeObjectRetain(v52);
  URLComponents.host.setter(v51, v52);
  v53 = sub_10000EA40((uint64_t *)(v36
                                + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters));
  v30 = URLComponents.queryItems.setter(v53);
LABEL_14:
  URLComponents.url.getter(v30);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_15:
  swift_release(v18);
LABEL_16:
  swift_release(v18);
  return sub_10000CEBC((uint64_t)v14, type metadata accessor for PodcastsURLEpisodeParameters);
}

id sub_10000D7D0(double a1, double a2)
{
  void *v4;
  NSString v5;
  id v6;
  id v7;

  v4 = (void *)objc_opt_self(MTPodcast);
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v4, "artworkForPodcastUuid:size:triggerDownload:", v5, 0, a1, a2);

  v7 = objc_msgSend(v6, "CGImage");
  return v7;
}

uint64_t sub_10000D87C()
{
  id *v0;

  objc_msgSend(*v0, "storeCollectionId");
  return dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
}

double sub_10000D8C8@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_10000D8D8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 48, 7);
}

id sub_10000D8FC()
{
  uint64_t v0;

  return sub_10000D7D0(*(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_10000D908()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for PodcastsURLCommand()
{
  return objc_opt_self(_TtC25PodcastsClassKitExtension18PodcastsURLCommand);
}

uint64_t type metadata accessor for PodcastsURLNowPlayingCommand()
{
  return objc_opt_self(_TtC25PodcastsClassKitExtension28PodcastsURLNowPlayingCommand);
}

uint64_t type metadata accessor for PodcastsURLBrowseCommand()
{
  return objc_opt_self(_TtC25PodcastsClassKitExtension24PodcastsURLBrowseCommand);
}

uint64_t sub_10000D978()
{
  uint64_t v0;

  return sub_10000E9B8(v0 + OBJC_IVAR____TtC25PodcastsClassKitExtension22PodcastsURLOpenCommand_widgetContext);
}

uint64_t sub_10000D988()
{
  return sub_10000DA3C(&OBJC_IVAR____TtC25PodcastsClassKitExtension22PodcastsURLOpenCommand_widgetContext, (void (*)(uint64_t))sub_10000E9B8);
}

uint64_t sub_10000D99C()
{
  return type metadata accessor for PodcastsURLOpenCommand(0);
}

uint64_t type metadata accessor for PodcastsURLOpenCommand(uint64_t a1)
{
  return sub_10000DB9C(a1, (uint64_t *)&unk_1000198C0, (uint64_t)&nominal type descriptor for PodcastsURLOpenCommand);
}

uint64_t sub_10000D9B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA90(a1, a2, a3, (uint64_t (*)(uint64_t))sub_10000D9C4);
}

void sub_10000D9C4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000198D0)
  {
    v2 = type metadata accessor for MetricsWidgetContext(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000198D0);
  }
}

uint64_t sub_10000DA18()
{
  uint64_t v0;

  return sub_10000E97C(v0 + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters);
}

uint64_t sub_10000DA28()
{
  return sub_10000DA3C(&OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters, (void (*)(uint64_t))sub_10000E97C);
}

uint64_t sub_10000DA3C(_QWORD *a1, void (*a2)(uint64_t))
{
  uint64_t v2;

  a2(v2 + *a1);
  return swift_deallocClassInstance(v2, *(unsigned int *)(*(_QWORD *)v2 + 48), *(unsigned __int16 *)(*(_QWORD *)v2 + 52));
}

uint64_t sub_10000DA68()
{
  return type metadata accessor for PodcastsURLEpisodeCommand(0);
}

uint64_t type metadata accessor for PodcastsURLEpisodeCommand(uint64_t a1)
{
  return sub_10000DB9C(a1, qword_100019980, (uint64_t)&nominal type descriptor for PodcastsURLEpisodeCommand);
}

uint64_t sub_10000DA84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DA90(a1, a2, a3, type metadata accessor for PodcastsURLEpisodeParameters);
}

uint64_t sub_10000DA90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result;
  unint64_t v6;
  uint64_t v7;

  result = a4(319);
  if (v6 <= 0x3F)
  {
    v7 = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 1, &v7, a1 + 88);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for PodcastsURLEpisodeParameters(uint64_t a1)
{
  return sub_10000DB9C(a1, qword_100019E60, (uint64_t)&nominal type descriptor for PodcastsURLEpisodeParameters);
}

uint64_t sub_10000DB14()
{
  return type metadata accessor for PodcastsURLShowCommand(0);
}

uint64_t type metadata accessor for PodcastsURLShowCommand(uint64_t a1)
{
  return sub_10000DB9C(a1, qword_100019A38, (uint64_t)&nominal type descriptor for PodcastsURLShowCommand);
}

uint64_t sub_10000DB34()
{
  return type metadata accessor for PodcastsURLPlayCommand(0);
}

uint64_t type metadata accessor for PodcastsURLPlayCommand(uint64_t a1)
{
  return sub_10000DB9C(a1, qword_100019AF0, (uint64_t)&nominal type descriptor for PodcastsURLPlayCommand);
}

uint64_t sub_10000DB50()
{
  uint64_t v0;

  sub_10000E97C(v0 + OBJC_IVAR____TtC25PodcastsClassKitExtension25PodcastsURLEpisodeCommand_episodeParameters);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10000DB80()
{
  return type metadata accessor for PodcastsURLShowAndPlayCommand(0);
}

uint64_t type metadata accessor for PodcastsURLShowAndPlayCommand(uint64_t a1)
{
  return sub_10000DB9C(a1, qword_100019BA8, (uint64_t)&nominal type descriptor for PodcastsURLShowAndPlayCommand);
}

uint64_t sub_10000DB9C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_10000DBD0(uint64_t a1)
{
  _BYTE v2[8];

  return swift_updateClassMetadata2(a1, 256, 0, v2, a1 + 104);
}

void sub_10000DC04()
{
  qword_10001A0B0 = 0x7374736163646F70;
  *(_QWORD *)algn_10001A0B8 = 0xE800000000000000;
}

void sub_10000DC28()
{
  qword_1000195F0 = 0x6979616C50776F6ELL;
  *(_QWORD *)algn_1000195F8 = 0xEA0000000000676ELL;
}

void sub_10000DC50()
{
  qword_100019600 = 0x6573776F7262;
  *(_QWORD *)algn_100019608 = 0xE600000000000000;
}

void sub_10000DC70()
{
  qword_100019610 = 1852141679;
  *(_QWORD *)algn_100019618 = 0xE400000000000000;
}

void sub_10000DC8C()
{
  qword_100019620 = 2003789939;
  *(_QWORD *)algn_100019628 = 0xE400000000000000;
}

void sub_10000DCA8()
{
  qword_100019630 = 2036427888;
  *(_QWORD *)algn_100019638 = 0xE400000000000000;
}

void sub_10000DCC4()
{
  qword_100019640 = 0x79616C70776F6873;
  *(_QWORD *)algn_100019648 = 0xE800000000000000;
}

void sub_10000DCE8()
{
  qword_100019650 = 0x5574736163646F70;
  *(_QWORD *)algn_100019658 = 0xEB00000000646975;
}

void sub_10000DD14()
{
  qword_100019660 = 0x5565646F73697065;
  *(_QWORD *)algn_100019668 = 0xEB00000000646975;
}

void sub_10000DD40()
{
  qword_100019670 = 0x4974736163646F70;
  *(_QWORD *)algn_100019678 = 0xE900000000000064;
}

void sub_10000DD68()
{
  qword_100019680 = 0x4965646F73697065;
  *(_QWORD *)algn_100019688 = 0xE900000000000064;
}

void sub_10000DD90()
{
  qword_100019690 = 0x616C506563726F66;
  *(_QWORD *)algn_100019698 = 0xE900000000000079;
}

void sub_10000DDB8()
{
  strcpy((char *)&qword_1000196A0, "episodeContext");
  algn_1000196A8[7] = -18;
}

void sub_10000DDE8()
{
  qword_1000196B0 = 0x6F4E6E657473696CLL;
  *(_QWORD *)algn_1000196B8 = 0xEF7478654E705577;
}

void sub_10000DE18()
{
  strcpy((char *)&qword_1000196C0, "widgetContext");
  *(_WORD *)&algn_1000196C8[6] = -4864;
}

uint64_t sub_10000DE48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Swift::String_optional v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];

  v24[1] = a2;
  sub_100005C94(&qword_100019E00);
  __chkstk_darwin();
  v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MetricsWidgetContext(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URLComponents(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin();
  v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  URLComponents.init()(v11);
  if (qword_100019280 != -1)
    swift_once(&qword_100019280, sub_10000DC04);
  v14 = qword_10001A0B0;
  v15 = *(_QWORD *)algn_10001A0B8;
  swift_bridgeObjectRetain(*(_QWORD *)algn_10001A0B8);
  URLComponents.scheme.setter(v14, v15);
  if (qword_100019298 != -1)
    swift_once(&qword_100019298, sub_10000DC70);
  v16 = qword_100019610;
  v17 = *(_QWORD *)algn_100019618;
  swift_bridgeObjectRetain(*(_QWORD *)algn_100019618);
  URLComponents.host.setter(v16, v17);
  sub_10000E9F8(a1 + OBJC_IVAR____TtC25PodcastsClassKitExtension22PodcastsURLOpenCommand_widgetContext, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    v18 = sub_10000E9B8((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v19 = MetricsWidgetContext.encodeToString()();
    if (v19.value._object)
    {
      v20 = sub_100005C94(&qword_100019560);
      v21 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
      v22 = swift_allocObject(v20, ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(_QWORD *)(v21 + 72), *(unsigned __int8 *)(v21 + 80) | 7);
      *(_OWORD *)(v22 + 16) = xmmword_100011CB0;
      if (qword_1000192F0 != -1)
        swift_once(&qword_1000192F0, sub_10000DE18);
      URLQueryItem.init(name:value:)(qword_1000196C0, *(_QWORD *)algn_1000196C8, v19.value._countAndFlagsBits, v19.value._object);
      swift_bridgeObjectRelease(v19.value._object);
      URLComponents.queryItems.setter(v22);
    }
    v18 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  URLComponents.url.getter(v18);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t type metadata accessor for PodcastsURLScheme()
{
  return objc_opt_self(_TtC25PodcastsClassKitExtension17PodcastsURLScheme);
}

uint64_t type metadata accessor for PodcastsURLScheme.Command()
{
  return objc_opt_self(_TtCC25PodcastsClassKitExtension17PodcastsURLSchemeP33_57F6E4C7C2FB9BD35777DC6A620EEA427Command);
}

uint64_t type metadata accessor for PodcastsURLScheme.Param()
{
  return objc_opt_self(_TtCC25PodcastsClassKitExtension17PodcastsURLSchemeP33_57F6E4C7C2FB9BD35777DC6A620EEA425Param);
}

_QWORD *sub_10000E170(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v14);
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_WORD *)(a1 + 56) = *((_WORD *)a2 + 28);
    v7 = *(int *)(a3 + 40);
    v8 = (char *)a2 + v7;
    v9 = (void *)(a1 + v7);
    *(_BYTE *)(a1 + 58) = *((_BYTE *)a2 + 58);
    v10 = type metadata accessor for MetricsWidgetContext(0);
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    if (v12(v8, 1, v10))
    {
      v13 = sub_100005C94(&qword_100019E00);
      memcpy(v9, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v9, v8, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t sub_10000E2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  v4 = a1 + *(int *)(a2 + 40);
  v5 = type metadata accessor for MetricsWidgetContext(0);
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t sub_10000E324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(const void *, uint64_t, uint64_t);
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  v6 = *(int *)(a3 + 40);
  v7 = (const void *)(a2 + v6);
  v8 = (void *)(a1 + v6);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  v9 = type metadata accessor for MetricsWidgetContext(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  if (v11(v7, 1, v9))
  {
    v12 = sub_100005C94(&qword_100019E00);
    memcpy(v8, v7, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v8, v7, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  }
  return a1;
}

uint64_t sub_10000E428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v10;
  v11 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v11;
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  v12 = *(int *)(a3 + 40);
  v13 = (void *)(a1 + v12);
  v14 = (void *)(a2 + v12);
  v15 = type metadata accessor for MetricsWidgetContext(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v20 = sub_100005C94(&qword_100019E00);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_10000E5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  v5 = *(int *)(a3 + 40);
  v6 = (const void *)(a2 + v5);
  v7 = (void *)(a1 + v5);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  v8 = type metadata accessor for MetricsWidgetContext(0);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8))
  {
    v10 = sub_100005C94(&qword_100019E00);
    memcpy(v7, v6, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v7, v6, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_10000E684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v10 = *(_WORD *)(a2 + 57);
  v11 = *(int *)(a3 + 40);
  v12 = (void *)(a1 + v11);
  v13 = (void *)(a2 + v11);
  *(_WORD *)(a1 + 57) = v10;
  v14 = type metadata accessor for MetricsWidgetContext(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 40))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    v19 = sub_100005C94(&qword_100019E00);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 32))(v12, v13, v14);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

uint64_t sub_10000E7D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E7E0);
}

uint64_t sub_10000E7E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_100005C94(&qword_100019E00);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v9);
  }
}

uint64_t sub_10000E86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E878);
}

uint64_t sub_10000E878(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = sub_100005C94(&qword_100019E00);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

void sub_10000E8F0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = &unk_1000120B0;
  v4[1] = &unk_1000120B0;
  v4[2] = &unk_1000120C8;
  v4[3] = &unk_1000120C8;
  v4[4] = &unk_1000120E0;
  v4[5] = &unk_1000120E0;
  sub_10000D9C4(319);
  if (v3 <= 0x3F)
  {
    v4[6] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 7, v4, a1 + 16);
  }
}

uint64_t sub_10000E97C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PodcastsURLEpisodeParameters(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E9B8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005C94(&qword_100019E00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005C94(&qword_100019E00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_10000EA40(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void (*v48)(char *, char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  int v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  Swift::String_optional v69;
  char *v70;
  unint64_t v71;
  unint64_t v72;
  void (*v74)(char *, char *, uint64_t);
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  sub_100005C94(&qword_100019E00);
  ((void (*)(void))__chkstk_darwin)();
  v83 = (uint64_t)&v74 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for MetricsWidgetContext(0);
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v80 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = type metadata accessor for URLQueryItem(0);
  v6 = *(_QWORD *)(v84 - 8);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v79 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v74 - v10;
  v12 = __chkstk_darwin(v9);
  v82 = (char *)&v74 - v13;
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v74 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v74 - v18;
  v20 = __chkstk_darwin(v17);
  v22 = (char *)&v74 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)&v74 - v23;
  v25 = a1[1];
  if (v25)
  {
    v81 = v11;
    v26 = *a1;
    if (qword_1000192B8 != -1)
      swift_once(&qword_1000192B8, sub_10000DCE8);
    URLQueryItem.init(name:value:)(qword_100019650, *(_QWORD *)algn_100019658, v26, v25);
    v27 = (char *)sub_100008B00(0, 1, 1, (unint64_t)&_swiftEmptyArrayStorage);
    v29 = *((_QWORD *)v27 + 2);
    v28 = *((_QWORD *)v27 + 3);
    v77 = v4;
    v78 = v3;
    if (v29 >= v28 >> 1)
      v27 = (char *)sub_100008B00(v28 > 1, v29 + 1, 1, (unint64_t)v27);
    *((_QWORD *)v27 + 2) = v29 + 1;
    v30 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v31 = *(_QWORD *)(v6 + 72);
    v32 = &v27[v30 + v31 * v29];
    v33 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v34 = v24;
    v35 = v84;
    v33(v32, v34, v84);
    v36 = a1[3];
    if (v36)
    {
      v37 = a1[2];
      if (qword_1000192C0 != -1)
        swift_once(&qword_1000192C0, sub_10000DD14);
      URLQueryItem.init(name:value:)(qword_100019660, *(_QWORD *)algn_100019668, v37, v36);
      v39 = *((_QWORD *)v27 + 2);
      v38 = *((_QWORD *)v27 + 3);
      if (v39 >= v38 >> 1)
        v27 = (char *)sub_100008B00(v38 > 1, v39 + 1, 1, (unint64_t)v27);
      *((_QWORD *)v27 + 2) = v39 + 1;
      v33(&v27[v30 + v39 * v31], v22, v35);
    }
    v4 = v77;
    v3 = v78;
    v11 = v81;
  }
  else if ((a1[5] & 1) != 0)
  {
    v27 = (char *)&_swiftEmptyArrayStorage;
    v35 = v84;
  }
  else
  {
    v81 = v11;
    v40 = a1[4];
    if (qword_1000192C8 != -1)
      swift_once(&qword_1000192C8, sub_10000DD40);
    v41 = qword_100019670;
    v42 = *(_QWORD *)algn_100019678;
    v85 = v40;
    v43 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
    v45 = v44;
    URLQueryItem.init(name:value:)(v41, v42, v43, v44);
    swift_bridgeObjectRelease(v45);
    v27 = (char *)sub_100008B00(0, 1, 1, (unint64_t)&_swiftEmptyArrayStorage);
    v47 = *((_QWORD *)v27 + 2);
    v46 = *((_QWORD *)v27 + 3);
    if (v47 >= v46 >> 1)
      v27 = (char *)sub_100008B00(v46 > 1, v47 + 1, 1, (unint64_t)v27);
    v35 = v84;
    *((_QWORD *)v27 + 2) = v47 + 1;
    v76 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v75 = *(_QWORD *)(v6 + 72);
    v48 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v48(&v27[v76 + v75 * v47], v19, v35);
    if ((a1[7] & 1) != 0)
    {
      v11 = v81;
    }
    else
    {
      v74 = v48;
      v49 = a1[6];
      v11 = v81;
      if (qword_1000192D0 != -1)
        swift_once(&qword_1000192D0, sub_10000DD68);
      v50 = qword_100019680;
      v51 = *(_QWORD *)algn_100019688;
      v85 = v49;
      v52 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
      v54 = v53;
      URLQueryItem.init(name:value:)(v50, v51, v52, v53);
      swift_bridgeObjectRelease(v54);
      v56 = *((_QWORD *)v27 + 2);
      v55 = *((_QWORD *)v27 + 3);
      if (v56 >= v55 >> 1)
        v27 = (char *)sub_100008B00(v55 > 1, v56 + 1, 1, (unint64_t)v27);
      v35 = v84;
      *((_QWORD *)v27 + 2) = v56 + 1;
      v74(&v27[v76 + v56 * v75], v16, v35);
    }
  }
  v57 = *((unsigned __int8 *)a1 + 57);
  if (v57 != 2)
  {
    if (qword_1000192D8 != -1)
      swift_once(&qword_1000192D8, sub_10000DD90);
    if ((v57 & 1) != 0)
      v58 = 1702195828;
    else
      v58 = 0x65736C6166;
    if ((v57 & 1) != 0)
      v59 = 0xE400000000000000;
    else
      v59 = 0xE500000000000000;
    URLQueryItem.init(name:value:)(qword_100019690, *(_QWORD *)algn_100019698, v58, v59);
    swift_bridgeObjectRelease(v59);
    if ((swift_isUniquelyReferenced_nonNull_native(v27) & 1) == 0)
      v27 = (char *)sub_100008B00(0, *((_QWORD *)v27 + 2) + 1, 1, (unint64_t)v27);
    v61 = *((_QWORD *)v27 + 2);
    v60 = *((_QWORD *)v27 + 3);
    if (v61 >= v60 >> 1)
      v27 = (char *)sub_100008B00(v60 > 1, v61 + 1, 1, (unint64_t)v27);
    *((_QWORD *)v27 + 2) = v61 + 1;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v27[((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v61], v82, v35);
  }
  if ((*((_BYTE *)a1 + 58) & 1) != 0)
  {
    if (qword_1000192E0 != -1)
      swift_once(&qword_1000192E0, sub_10000DDB8);
    v62 = qword_1000196A0;
    v63 = *(_QWORD *)algn_1000196A8;
    if (qword_1000192E8 != -1)
      swift_once(&qword_1000192E8, sub_10000DDE8);
    URLQueryItem.init(name:value:)(v62, v63, qword_1000196B0, *(_QWORD *)algn_1000196B8);
    if ((swift_isUniquelyReferenced_nonNull_native(v27) & 1) == 0)
      v27 = (char *)sub_100008B00(0, *((_QWORD *)v27 + 2) + 1, 1, (unint64_t)v27);
    v65 = *((_QWORD *)v27 + 2);
    v64 = *((_QWORD *)v27 + 3);
    if (v65 >= v64 >> 1)
      v27 = (char *)sub_100008B00(v64 > 1, v65 + 1, 1, (unint64_t)v27);
    *((_QWORD *)v27 + 2) = v65 + 1;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v27[((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v65], v11, v35);
  }
  v66 = type metadata accessor for PodcastsURLEpisodeParameters(0);
  v67 = v83;
  sub_10000E9F8((uint64_t)a1 + *(int *)(v66 + 40), v83);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v67, 1, v3) == 1)
  {
    sub_10000E9B8(v67);
  }
  else
  {
    v68 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v80, v67, v3);
    v69 = MetricsWidgetContext.encodeToString()();
    if (v69.value._object)
    {
      if (qword_1000192F0 != -1)
        swift_once(&qword_1000192F0, sub_10000DE18);
      v70 = v79;
      URLQueryItem.init(name:value:)(qword_1000196C0, *(_QWORD *)algn_1000196C8, v69.value._countAndFlagsBits, v69.value._object);
      swift_bridgeObjectRelease(v69.value._object);
      if ((swift_isUniquelyReferenced_nonNull_native(v27) & 1) == 0)
        v27 = (char *)sub_100008B00(0, *((_QWORD *)v27 + 2) + 1, 1, (unint64_t)v27);
      v72 = *((_QWORD *)v27 + 2);
      v71 = *((_QWORD *)v27 + 3);
      if (v72 >= v71 >> 1)
        v27 = (char *)sub_100008B00(v71 > 1, v72 + 1, 1, (unint64_t)v27);
      *((_QWORD *)v27 + 2) = v72 + 1;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v27[((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v72], v70, v35);
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v68, v3);
  }
  return v27;
}

id objc_msgSend_AND_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AND:");
}

id objc_msgSend__fetchRequestForDistinctSeasons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRequestForDistinctSeasons");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adamID");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_applyShowTypeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyShowTypeSetting:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "author");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_episodeForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForUuid:");
}

id objc_msgSend_episodeUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuid");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_feedChangedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedChangedDate");
}

id objc_msgSend_feedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedURL");
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestWithEntityName:");
}

id objc_msgSend_findEpisodeWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEpisodeWithRequest:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flags");
}

id objc_msgSend_hasHTML(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasHTML");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifiers");
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageURL");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSerialShowTypeInFeed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSerialShowTypeInFeed");
}

id objc_msgSend_isValidShowTypeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidShowTypeSetting:");
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemDescription");
}

id objc_msgSend_lastDatePlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastDatePlayed");
}

id objc_msgSend_lastImplicitlyFollowedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastImplicitlyFollowedDate");
}

id objc_msgSend_latestSeasonNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestSeasonNumber");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lenientSharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lenientSharedInstance");
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "library");
}

id objc_msgSend_listenNowEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenNowEpisode");
}

id objc_msgSend_logAndThrow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAndThrow:");
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectContext");
}

id objc_msgSend_markPlaylistsForUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markPlaylistsForUpdate");
}

id objc_msgSend_markSubscriptionSyncDirty_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markSubscriptionSyncDirty:for:");
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifiedDate");
}

id objc_msgSend_mt_compactMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_compactMap:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsUpdate");
}

id objc_msgSend_newestEpisodeWithFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestEpisodeWithFilter:");
}

id objc_msgSend_nextEpisodeUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextEpisodeUuid");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_returnsObjectsAsFaults_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentID");
}

id objc_msgSend_playbackNewestToOldest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackNewestToOldest");
}

id objc_msgSend_playlist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlist");
}

id objc_msgSend_playlistIfDefault(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistIfDefault");
}

id objc_msgSend_playlistSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistSettings");
}

id objc_msgSend_podcast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcast");
}

id objc_msgSend_podcastForFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastForFeedUrl:");
}

id objc_msgSend_podcastUuidForFeedUrlString_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUuidForFeedUrlString:ctx:");
}

id objc_msgSend_predicateForEpisodeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeType:");
}

id objc_msgSend_predicateForEpisodesWithSeasonNumbersOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:");
}

id objc_msgSend_predicateForNotHiddenNotImplicitlyFollowedPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
}

id objc_msgSend_predicateForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcast:");
}

id objc_msgSend_predicateForSeasonNumberWithNoEpisodeNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSeasonNumberWithNoEpisodeNumber:");
}

id objc_msgSend_predicateForSubscriptionSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSubscriptionSyncType:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_saveInCurrentBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveInCurrentBlock");
}

id objc_msgSend_seasonNumbers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonNumbers");
}

id objc_msgSend_seasonSortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonSortDescriptorsForSortOrder");
}

id objc_msgSend_seasonTrailerInSeason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonTrailerInSeason:");
}

id objc_msgSend_setEpisodeGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeGuid:");
}

id objc_msgSend_setEpisodeTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeTitle:");
}

id objc_msgSend_setExcludeUnentitled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExcludeUnentitled:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setListenNowEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListenNowEpisode:");
}

id objc_msgSend_setModifiedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifiedDate:");
}

id objc_msgSend_setNeedsUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsUpdate:");
}

id objc_msgSend_setPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentID:");
}

id objc_msgSend_setPodcastFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastFeedUrl:");
}

id objc_msgSend_setPodcastTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastTitle:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPrimitiveValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimitiveValue:forKey:");
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesToFetch:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setReturnsDistinctResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnsDistinctResults:");
}

id objc_msgSend_setSortAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortAscending:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setStoreTrackId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreTrackId:");
}

id objc_msgSend_setStreamUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamUrl:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_showTypeInFeed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeInFeed");
}

id objc_msgSend_showTypeSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeSetting");
}

id objc_msgSend_sortAscending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortAscending");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:");
}

id objc_msgSend_sortDescriptorsForPlayOrderByEpisodeNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPlayOrderByEpisodeNumber");
}

id objc_msgSend_sortDescriptorsForPlayOrderByPubDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPlayOrderByPubDate");
}

id objc_msgSend_sortDescriptorsForPubDateAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPubDateAscending:");
}

id objc_msgSend_sortOrderAscForShowType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortOrderAscForShowType:");
}

id objc_msgSend_storeCollectionId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCollectionId");
}

id objc_msgSend_streamURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamURL");
}

id objc_msgSend_stringBySmartlyStrippingHTML(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringBySmartlyStrippingHTML");
}

id objc_msgSend_subscribed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribed");
}

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncType");
}

id objc_msgSend_timestampBoundByNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampBoundByNow:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_universalStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "universalStore");
}

id objc_msgSend_upNextForPodcastUuid_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextForPodcastUuid:excludeExplicit:ctx:");
}

id objc_msgSend_updateAvg(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAvg");
}

id objc_msgSend_updateStdDev(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStdDev");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vendorID");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}
