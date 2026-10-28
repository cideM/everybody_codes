(def parser (peg/compile ~(split "," (number :d+))))

(defn parse [s] (peg/match parser s))

(defn even? [n] (= (% n 2) 0))

(defn p1 [input]
  (->> (parse input)
       (map |(-> (math/sqrt $0) math/ceil (math/pow 2) (- $0)))
       sum))

(defn p2 [input]
  (->> (parse input)
       (map |(if (<= $0 8) (- 8 $0) (- (* 4 (math/ceil (/ $0 4))) $0)))
       sum))

(defn p3 [input]
  (->> (parse input)
       (map (fn [n]
              (if (<= n 8)
                (- 8 n)
                (as-> (math/ceil (math/sqrt (inc n))) side
                      (if (even? side) (inc side) side)
                      (- (math/pow side 2) (inc n))))))
       sum))

(defn main [_ part &]
  (def solve
    (case part
      "1" p1
      "2" p2
      "3" p3
      (do (eprint "usage: janet main.janet <1|2|3> < input")
          (os/exit 1))))
  (pp (solve (file/read stdin :all))))
