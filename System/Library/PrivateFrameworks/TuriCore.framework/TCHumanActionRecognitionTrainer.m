@implementation TCHumanActionRecognitionTrainer

+ (id)graphsForSTGCNOptions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  void *v10;
  turi::neural_net::model_spec *v11;
  void *__p[2];
  char v14;
  turi::neural_net::model_spec *v15;

  v3 = a3;
  objc_msgSend(v3, "validate");
  std::string::basic_string[abi:ne180100]<0>(__p, "targetProbabilities");
  objc_msgSend(v3, "numClasses");
  objc_msgSend(v3, "numKeypoints");
  objc_msgSend(v3, "numFrames");
  turi::proprietary::human_action_recognition::init_human_action_recognition(&v15);
  if (v14 < 0)
    operator delete(__p[0]);
  v4 = objc_msgSend(v3, "batchSize");
  v5 = objc_msgSend(v3, "numFrames");
  v6 = objc_msgSend(v3, "numKeypoints");
  v7 = objc_msgSend(v3, "numClasses");
  objc_msgSend(v3, "dropoutProbability");
  v9 = v8;
  turi::neural_net::model_spec::export_params_view(v15, (uint64_t)__p);
  turi::proprietary::neural_net::mlc_human_action_recognition_backend::create_graphs(v4, v5, v6, v7, __p, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  std::__tree<std::__value_type<std::string,turi::neural_net::shared_float_array>,std::__map_value_compare<std::string,std::__value_type<std::string,turi::neural_net::shared_float_array>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,turi::neural_net::shared_float_array>>>::destroy((uint64_t)__p, (_QWORD *)__p[1]);
  v11 = v15;
  v15 = 0;
  if (v11)
  {
    turi::neural_net::model_spec::~model_spec(v11);
    MEMORY[0x219A19A08]();
  }

  return v10;
}

@end
