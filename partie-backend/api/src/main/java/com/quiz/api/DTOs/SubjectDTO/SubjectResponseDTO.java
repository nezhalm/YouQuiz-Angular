package com.quiz.api.DTOs.SubjectDTO;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

    @Data
    @NoArgsConstructor
    public class SubjectResponseDTO {
        private long id;
        private String title;
        private SubjectResponseDTO parent;
        private List<SubjectDTO> children;
    }


