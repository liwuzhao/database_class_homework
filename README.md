数据库原理及设计课程作业

### 题目

某高校，主要人员有：在职人员（行政人员、教师、一般员工）、退休人员和临时工。

现在，需要存储这些人员的人事档案信息：编号、姓名、性别、年龄、职务、职称、政治面貌、最高学历、任职时间、来院时间、人员类别。其中，人员编号唯一，不能重复。

要求：
- 添加删除功能：能根据学院人事的变动情况，添加删除记录；
- 查询功能：能根据编号和姓名进行查询；
- 编辑功能（高级）：根据查询对相应的记录进行修改，并存储；
- 统计功能：能根据多种参数进行人员的统计（在职人数、党员人数、女工人数、高学历高职称人数（硕士学位以上或者副教授以上）），统计要求同时显示被统计者的信息；
- 排序功能：按照年龄、来院时间进行排序。
- 保存功能：能对输入的数据进行相应的存储。

> 注意：设计界面要友好，易于操作；
程序要有相当的容错性，即应该有一定健壮性；
