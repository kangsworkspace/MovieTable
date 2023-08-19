# MovieTable

## 🖥️ 프로젝트 소개

- 영화들에 대한 정보를 표시해주는 어플입니다.
- `Table View`, `Navigation Bar` 기능을 코드로 작성하였습니다. 
- MVC 패턴을 적용하였습니다.

<br>

## 👀 UI 구성

- `Table View`로 영화들에 대한 정보를 보여주고 `Table View Cell`을 터치하면 `Navigation Bar` 로 영화에 대한 세부 정보를 보여주는 창으로 전환합니다.

<br>

## 📌 학습한 주요 내용
#### MVC 패턴 적용 (Models에 데이터 처리를 분리)
Models에 영화에 대한 정보의 형식을 선언한 Movie,   
영화에 대한 데이터를 읽고 쓰는 MovieDataManager가 있습니다.   

Views에는 각 영화에 대한 테이블 뷰 셀이 담긴 MovieTableViewCell,       
테이블 뷰 셀을 터치하면 넘어간 다음 창인 DetailView가 있습니다.   

Controllers에는 테이블 뷰를 선언하고 기본적인 데이터를 요청하고 받는 ViewController,    
그리고 DetailView를 관리하는 DetailViewController가 있습니다.


#### `Table View`, `Navigation Bar` 기능을 코드로 작성



## 🎬 완성된 모습


## 🙉 문제점 및 해결

코드가 길어졌다.
어떤 순서로 작업할 것인가?
